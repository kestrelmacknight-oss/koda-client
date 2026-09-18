// lib/core/crypto/shamir.dart
//
// Shamir's Secret Sharing over GF(256), for Tier 3 threshold moderator
// decryption (see koda-server's Koda.Moderation moduledoc for how this
// fits alongside Tier 1/Tier 2). A channel epoch key gets split into N
// shares, one per designated moderator, such that any K of them can
// reconstruct it but K-1 or fewer reveal nothing -- not even to the
// server, which only ever relays each share E2EE to its holder over the
// same pairwise ratchet delivery already used for the real epoch key
// (see channel_key_manager.dart).
//
// Hand-implemented rather than depending on a pub.dev package: the
// options that actually exist (dart_ssss: 7 years stale, Dart 3
// incompatible; shamir_secret_plg: 1 like, 48 downloads, 0 GitHub
// stars, unclear backend) don't meet a reasonable trust bar for
// something this security-critical. This follows the same well-known,
// widely-published algorithm real implementations use (e.g. Poettering's
// ssss, HashiCorp Vault's Shamir package): one independent random
// polynomial per secret byte, over the same GF(256) field AES itself
// uses (irreducible polynomial x^8+x^4+x^3+x+1, i.e. 0x11B) purely
// because it's the most widely cross-verifiable GF(256) construction
// available, not because of any relation to AES otherwise.
//
// No built-in integrity check (this is standard Shamir's Secret Sharing,
// not an authenticated scheme) -- combining shares from the wrong split,
// or fewer than the real threshold, silently produces garbage bytes, not
// an error. Callers that need to detect that (e.g. "did we actually
// reconstruct the right epoch key") must verify the result out-of-band,
// e.g. by checking it actually decrypts that epoch's messages.

import 'dart:typed_data';
import 'kcp_primitives.dart' show randomBytes, bytesToB64, b64ToBytes;

/// GF(256) arithmetic (the AES/Rijndael field) via log/antilog tables --
/// standard technique, makes multiply/divide O(1) instead of doing
/// carryless polynomial multiplication + reduction on every call.
class GF256 {
  GF256._();

  static final List<int> _exp = _buildExp();
  static final List<int> _log = _buildLog();

  static List<int> _buildExp() {
    final table = List<int>.filled(256, 0);
    int x = 1;
    for (int i = 0; i < 255; i++) {
      table[i] = x;
      x = _mulNoTable(x, 0x03); // 0x03 is a generator of this field
    }
    return table;
  }

  static List<int> _buildLog() {
    final exp = _exp;
    final table = List<int>.filled(256, 0); // log[0] is never legitimately read
    for (int i = 0; i < 255; i++) {
      table[exp[i]] = i;
    }
    return table;
  }

  /// Carryless (XOR-based) polynomial multiplication mod x^8+x^4+x^3+x+1,
  /// used only to bootstrap the tables above -- everything else in this
  /// file goes through the O(1) table-based mul()/div() below.
  static int _mulNoTable(int a, int b) {
    int result = 0;
    var x = a;
    var y = b;
    for (int i = 0; i < 8; i++) {
      if ((y & 1) != 0) result ^= x;
      final hiBitSet = (x & 0x80) != 0;
      x = (x << 1) & 0xFF;
      if (hiBitSet) x ^= 0x1B;
      y >>= 1;
    }
    return result;
  }

  /// GF(256) addition -- and its own inverse, i.e. also subtraction --
  /// is XOR in any characteristic-2 field.
  static int add(int a, int b) => a ^ b;

  static int mul(int a, int b) {
    if (a == 0 || b == 0) return 0;
    return _exp[(_log[a] + _log[b]) % 255];
  }

  static int inverse(int a) {
    if (a == 0) throw ArgumentError('0 has no multiplicative inverse');
    return _exp[(255 - _log[a]) % 255];
  }

  static int div(int a, int b) {
    if (a == 0) return 0;
    return mul(a, inverse(b));
  }
}

class ShamirShare {
  /// The polynomial's x-coordinate for this share, 1..255 (never 0 --
  /// f(0) is the secret itself, so a share at x=0 would just be it).
  final int index;
  final Uint8List bytes;
  const ShamirShare({required this.index, required this.bytes});

  Map<String, dynamic> toJson() => {'index': index, 'bytes': bytesToB64(bytes)};
  factory ShamirShare.fromJson(Map<String, dynamic> j) => ShamirShare(
        index: j['index'] as int,
        bytes: b64ToBytes(j['bytes'] as String),
      );
}

class Shamir {
  Shamir._();

  /// Splits [secret] into [totalShares] shares, any [threshold] of which
  /// reconstruct it (see combine). threshold-1 or fewer shares reveal
  /// nothing about secret -- for every byte, a random degree-(threshold-1)
  /// polynomial is generated with that byte as its constant term, so an
  /// attacker with too few points has one free parameter left per
  /// missing share, consistent with every possible byte value equally.
  static List<ShamirShare> split(
    Uint8List secret, {
    required int threshold,
    required int totalShares,
  }) {
    if (threshold < 2) {
      throw ArgumentError('threshold must be at least 2');
    }
    if (totalShares < threshold) {
      throw ArgumentError('totalShares must be >= threshold');
    }
    if (totalShares > 255) {
      throw ArgumentError('totalShares must be <= 255 (GF(256) share indices are 1..255)');
    }

    // One independent random polynomial per secret byte.
    final coefficients = List<Uint8List>.generate(
        secret.length, (_) => randomBytes(threshold - 1));

    return List<ShamirShare>.generate(totalShares, (i) {
      final x = i + 1;
      final shareBytes = Uint8List(secret.length);
      for (int b = 0; b < secret.length; b++) {
        shareBytes[b] = _evalPolynomial(secret[b], coefficients[b], x);
      }
      return ShamirShare(index: x, bytes: shareBytes);
    });
  }

  /// f(x) via Horner's method, where the polynomial is
  /// constantTerm + coefficients[0]*x + coefficients[1]*x^2 + ...
  static int _evalPolynomial(int constantTerm, Uint8List coefficients, int x) {
    int result = 0;
    for (int i = coefficients.length - 1; i >= 0; i--) {
      result = GF256.add(GF256.mul(result, x), coefficients[i]);
    }
    return GF256.add(GF256.mul(result, x), constantTerm);
  }

  /// Reconstructs the secret from >= threshold [shares] via Lagrange
  /// interpolation at x=0, independently per byte. All shares must come
  /// from the same split() call and have equal-length bytes -- mixing
  /// shares from different secrets/splits produces garbage silently,
  /// not an error (see this file's header).
  static Uint8List combine(List<ShamirShare> shares) {
    if (shares.isEmpty) {
      throw ArgumentError('need at least one share');
    }
    final length = shares.first.bytes.length;
    final secret = Uint8List(length);
    for (int b = 0; b < length; b++) {
      secret[b] = _lagrangeInterpolateAtZero(shares, b);
    }
    return secret;
  }

  static int _lagrangeInterpolateAtZero(List<ShamirShare> shares, int byteIndex) {
    int result = 0;
    for (int i = 0; i < shares.length; i++) {
      final xi = shares[i].index;
      final yi = shares[i].bytes[byteIndex];

      // L_i(0) = product over j!=i of (0 - x_j) / (x_i - x_j). In
      // GF(2^n), -a == a (every element is its own additive inverse) and
      // subtraction == addition == XOR, so this reduces to
      // product(x_j) / product(x_i XOR x_j).
      int numerator = 1;
      int denominator = 1;
      for (int j = 0; j < shares.length; j++) {
        if (i == j) continue;
        final xj = shares[j].index;
        numerator = GF256.mul(numerator, xj);
        denominator = GF256.mul(denominator, GF256.add(xi, xj));
      }

      final term = GF256.mul(yi, GF256.div(numerator, denominator));
      result = GF256.add(result, term);
    }
    return result;
  }
}
