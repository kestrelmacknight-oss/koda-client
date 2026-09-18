// test/crypto/shamir_test.dart
//
// This is the correctness-critical piece of Tier 3 threshold moderator
// decryption (see lib/core/crypto/shamir.dart's header) -- hand-
// implemented rather than depending on an unvetted pub.dev package, so
// it gets real tests rather than just "it compiled." Covers: GF(256)
// arithmetic's own algebraic properties, split+combine round-tripping
// at exactly threshold shares, with more than threshold shares, across
// every subset of a split, that share order doesn't matter, and that
// fewer than threshold shares do NOT reconstruct the real secret.

import 'dart:math';
import 'dart:typed_data';
import 'package:flutter_test/flutter_test.dart';
import 'package:koda/core/crypto/shamir.dart';

void main() {
  group('GF256 arithmetic', () {
    test('add is its own inverse (XOR)', () {
      for (int a = 0; a < 256; a += 17) {
        for (int b = 0; b < 256; b += 23) {
          expect(GF256.add(GF256.add(a, b), b), a);
        }
      }
    });

    test('every nonzero element has a multiplicative inverse', () {
      for (int a = 1; a < 256; a++) {
        final inv = GF256.inverse(a);
        expect(GF256.mul(a, inv), 1,
            reason: '$a * inverse($a) should be 1, got ${GF256.mul(a, inv)}');
      }
    });

    test('mul is commutative', () {
      final rnd = Random(42);
      for (int i = 0; i < 200; i++) {
        final a = rnd.nextInt(256);
        final b = rnd.nextInt(256);
        expect(GF256.mul(a, b), GF256.mul(b, a));
      }
    });

    test('mul by zero is zero', () {
      for (int a = 0; a < 256; a++) {
        expect(GF256.mul(a, 0), 0);
        expect(GF256.mul(0, a), 0);
      }
    });

    test('mul by one is identity', () {
      for (int a = 0; a < 256; a++) {
        expect(GF256.mul(a, 1), a);
      }
    });

    test('div undoes mul', () {
      final rnd = Random(7);
      for (int i = 0; i < 200; i++) {
        final a = rnd.nextInt(255) + 1;
        final b = rnd.nextInt(255) + 1;
        expect(GF256.div(GF256.mul(a, b), b), a);
      }
    });
  });

  group('Shamir split/combine', () {
    Uint8List secretOf(String s) => Uint8List.fromList(s.codeUnits);

    test('reconstructs with exactly threshold shares', () {
      final secret = secretOf('this is a 32-byte epoch key!!!!!'); // 32 bytes
      expect(secret.length, 32);
      final shares = Shamir.split(secret, threshold: 3, totalShares: 5);
      expect(shares.length, 5);

      final reconstructed = Shamir.combine(shares.sublist(0, 3));
      expect(reconstructed, secret);
    });

    test('reconstructs with more than threshold shares (over-determined, still consistent)', () {
      final secret = secretOf('another epoch key of 32 bytes!!');
      final shares = Shamir.split(secret, threshold: 3, totalShares: 5);

      expect(Shamir.combine(shares), secret); // all 5
      expect(Shamir.combine(shares.sublist(0, 4)), secret); // 4 of 5
    });

    test('any subset of exactly threshold shares reconstructs the same secret', () {
      final secret = secretOf('yet another 32-byte secret key!');
      final shares = Shamir.split(secret, threshold: 3, totalShares: 5);

      // Every 3-of-5 combination, not just a prefix.
      for (int i = 0; i < shares.length; i++) {
        for (int j = i + 1; j < shares.length; j++) {
          for (int k = j + 1; k < shares.length; k++) {
            final subset = [shares[i], shares[j], shares[k]];
            expect(Shamir.combine(subset), secret,
                reason: 'shares at indices $i,$j,$k failed to reconstruct');
          }
        }
      }
    });

    test('share order does not matter', () {
      final secret = secretOf('order should not matter here!!!');
      final shares = Shamir.split(secret, threshold: 3, totalShares: 5);
      final subset = [shares[3], shares[0], shares[4]];
      expect(Shamir.combine(subset), secret);
      expect(Shamir.combine(subset.reversed.toList()), secret);
    });

    test('fewer than threshold shares do not reconstruct the real secret', () {
      final secret = secretOf('do not leak with 2 of 3 shares!');
      final shares = Shamir.split(secret, threshold: 3, totalShares: 5);

      // 2 shares when threshold is 3 -- must not recover the real secret.
      final wrong = Shamir.combine(shares.sublist(0, 2));
      expect(wrong, isNot(secret));
    });

    test('a single share alone does not reconstruct the secret', () {
      final secret = secretOf('single share reveals nothing!!!');
      final shares = Shamir.split(secret, threshold: 4, totalShares: 6);
      final wrong = Shamir.combine([shares[0]]);
      expect(wrong, isNot(secret));
    });

    test('works for a real 32-byte AES-256 key (the actual use case)', () {
      final rnd = Random.secure();
      final secret = Uint8List.fromList(List.generate(32, (_) => rnd.nextInt(256)));
      final shares = Shamir.split(secret, threshold: 2, totalShares: 3);
      expect(Shamir.combine(shares.sublist(0, 2)), secret);
      expect(Shamir.combine([shares[1], shares[2]]), secret);
      expect(Shamir.combine([shares[0], shares[2]]), secret);
    });

    test('ShamirShare round-trips through JSON', () {
      final secret = secretOf('json round-trip check 32 bytes!');
      final shares = Shamir.split(secret, threshold: 2, totalShares: 3);
      final restored = shares.map((s) => ShamirShare.fromJson(s.toJson())).toList();
      expect(Shamir.combine(restored.sublist(0, 2)), secret);
    });

    test('rejects threshold below 2', () {
      expect(() => Shamir.split(secretOf('x'), threshold: 1, totalShares: 3),
          throwsArgumentError);
    });

    test('rejects totalShares below threshold', () {
      expect(() => Shamir.split(secretOf('x'), threshold: 3, totalShares: 2),
          throwsArgumentError);
    });

    test('rejects totalShares above 255', () {
      expect(() => Shamir.split(secretOf('x'), threshold: 2, totalShares: 256),
          throwsArgumentError);
    });
  });
}
