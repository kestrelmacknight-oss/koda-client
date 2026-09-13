// lib/core/crypto/safety_number.dart
//
// Two separable pieces of protection against a substituted identity key
// (e.g. a compromised or malicious server handing out a different
// bundle than the real peer published):
//
//  1. TOFU pinning + change detection -- the actual security control.
//     Pin a peer's identity keys the first time you talk to them; if a
//     later session fetch returns different keys, that's flagged rather
//     than silently accepted. This is what catches a substitution attack
//     even if nobody ever looks at a fingerprint.
//  2. A human-comparable "safety number" for the minority of users who
//     want to proactively verify out-of-band. Useful, but only as good
//     as two people actually doing the comparison -- (1) is what
//     actually protects everyone else.

import 'dart:convert';
import 'dart:typed_data';
import 'package:cryptography/cryptography.dart';
import 'kcp_primitives.dart';

/// Deterministic regardless of who computes it (sorts the two keys
/// first), so both participants land on the same number.
Future<String> computeSafetyNumber({
  required Uint8List myIkDhPub,
  required Uint8List theirIkDhPub,
}) async {
  final a = bytesToB64(myIkDhPub);
  final b = bytesToB64(theirIkDhPub);
  final ordered = ([a, b]..sort());
  final combined = utf8.encode(ordered.join(':'));
  final hash = await Sha256().hash(combined);

  // Render as 12 groups of 5 digits -- same shape as Signal's safety
  // numbers, easy to read a few digits at a time over a call or in
  // person. Not a cryptographic audit, just a comparable fingerprint --
  // labeled as a "safety number," not oversold as more.
  var acc = BigInt.zero;
  for (final byte in hash.bytes) {
    acc = (acc << 8) | BigInt.from(byte);
  }
  const base = 100000; // 5 digits per group
  final groups = <String>[];
  for (var i = 0; i < 12; i++) {
    final group = acc % BigInt.from(base);
    acc = acc ~/ BigInt.from(base);
    groups.add(group.toString().padLeft(5, '0'));
  }
  return groups.reversed.join(' ');
}

class PinnedIdentity {
  final Uint8List ikDhPub;
  // Nullable: whichever side of X3DH is responding only ever sees the
  // peer's DH identity key directly (the signing key was already used,
  // on the *other* side, to verify the SPK signature -- see
  // x3dh.dart's initiateSession). The DH key is what's pinned and
  // checked either way; the signing key is filled in opportunistically
  // when a fuller bundle fetch happens to provide it, and compared only
  // when both the stored pin and the new observation have one.
  final Uint8List? ikSignPub;
  const PinnedIdentity(this.ikDhPub, this.ikSignPub);

  Map<String, dynamic> toJson() => {
        'ik_dh_pub':   bytesToB64(ikDhPub),
        'ik_sign_pub': ikSignPub != null ? bytesToB64(ikSignPub!) : null,
      };

  factory PinnedIdentity.fromJson(Map<String, dynamic> j) => PinnedIdentity(
        b64ToBytes(j['ik_dh_pub'] as String),
        j['ik_sign_pub'] != null ? b64ToBytes(j['ik_sign_pub'] as String) : null,
      );

  /// True if nothing about the peer's identity looks different. The DH
  /// key must always match; the signing key is only checked when both
  /// this pin and the new observation have one.
  bool matches(Uint8List otherIkDhPub, [Uint8List? otherIkSignPub]) {
    if (!_bytesEqual(ikDhPub, otherIkDhPub)) return false;
    if (ikSignPub != null && otherIkSignPub != null) {
      return _bytesEqual(ikSignPub!, otherIkSignPub);
    }
    return true;
  }

  /// Fills in the signing key on a pin that was created without one
  /// (the responder path), once a fuller observation becomes available.
  /// Caller is responsible for having already confirmed [matches].
  PinnedIdentity upgraded(Uint8List? otherIkSignPub) =>
      ikSignPub == null && otherIkSignPub != null
          ? PinnedIdentity(ikDhPub, otherIkSignPub)
          : this;
}

bool _bytesEqual(List<int> a, List<int> b) {
  if (a.length != b.length) return false;
  for (var i = 0; i < a.length; i++) {
    if (a[i] != b[i]) return false;
  }
  return true;
}
