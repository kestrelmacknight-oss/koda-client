// lib/core/crypto/x3dh.dart
//
// X3DH (Extended Triple Diffie-Hellman) session establishment -- the
// handshake that lets Alice start an encrypted conversation with Bob
// even while Bob is offline, using prekeys Bob published ahead of time.
// Same construction Signal uses. Output feeds directly into
// double_ratchet.dart as the initial root key.

import 'dart:typed_data';
import 'kcp_primitives.dart';

class IdentityKeyPair {
  final Ed25519KeyPair signing; // ik_sign -- signs the SPK
  final X25519KeyPair dh; // ik_dh -- used directly in the DH computations
  const IdentityKeyPair(this.signing, this.dh);
}

/// Everything generated at account setup / SPK rotation time. Private
/// halves never leave the device; only the `*Pub`/`spkSig` fields (plus
/// the OPKs' public halves) are uploaded to the server.
class LocalKeyMaterial {
  final IdentityKeyPair identity;
  final X25519KeyPair signedPrekey;
  final List<X25519KeyPair> oneTimePrekeys;
  const LocalKeyMaterial(this.identity, this.signedPrekey, this.oneTimePrekeys);
}

const _oneTimePrekeyCount = 20;

Future<LocalKeyMaterial> generateKeyMaterial() async {
  final signing = await generateEd25519KeyPair();
  final dh = await generateX25519KeyPair();
  final spk = await generateX25519KeyPair();
  final opks = await Future.wait(List.generate(_oneTimePrekeyCount, (_) => generateX25519KeyPair()));
  return LocalKeyMaterial(IdentityKeyPair(signing, dh), spk, opks);
}

Future<Uint8List> signPrekey(IdentityKeyPair identity, X25519KeyPair prekey) =>
    ed25519Sign(identity.signing, prekey.publicKeyBytes);

/// The public bundle uploaded to the server (PUT /keys/bundle).
Map<String, dynamic> bundleToUploadJson(LocalKeyMaterial material, Uint8List spkSig) => {
      'ik_sign_pub': bytesToB64(material.identity.signing.publicKeyBytes),
      'ik_dh_pub':   bytesToB64(material.identity.dh.publicKeyBytes),
      'spk_pub':     bytesToB64(material.signedPrekey.publicKeyBytes),
      'spk_sig':     bytesToB64(spkSig),
      'opks':        material.oneTimePrekeys.map((k) => bytesToB64(k.publicKeyBytes)).toList(),
    };

/// A peer's bundle as fetched from the server (GET /keys/bundle/:userId).
/// Fetching this consumes one of the peer's OPKs server-side -- see the
/// koda-server commit pairing with this, KeyBundleController.show/2.
class RemoteBundle {
  final Uint8List ikSignPub;
  final Uint8List ikDhPub;
  final Uint8List spkPub;
  final Uint8List spkSig;
  final Uint8List? opkPub;

  const RemoteBundle({
    required this.ikSignPub,
    required this.ikDhPub,
    required this.spkPub,
    required this.spkSig,
    this.opkPub,
  });

  factory RemoteBundle.fromJson(Map<String, dynamic> j) => RemoteBundle(
        ikSignPub: b64ToBytes(j['ik_sign_pub'] as String),
        ikDhPub:   b64ToBytes(j['ik_dh_pub'] as String),
        spkPub:    b64ToBytes(j['spk_pub'] as String),
        spkSig:    b64ToBytes(j['spk_sig'] as String),
        opkPub:    j['opk'] != null ? b64ToBytes(j['opk'] as String) : null,
      );
}

class X3dhInitiatorResult {
  final Uint8List sharedSecret; // 32 bytes -- feeds the Double Ratchet as RK
  final Uint8List associatedData;
  final X25519KeyPair ephemeral; // discard the private half immediately after this call site is done
  const X3dhInitiatorResult(this.sharedSecret, this.associatedData, this.ephemeral);
}

class X3dhHandshakeInvalid implements Exception {
  final String message;
  const X3dhHandshakeInvalid(this.message);
  @override
  String toString() => 'X3dhHandshakeInvalid: $message';
}

/// Alice's side: she has Bob's bundle, computes the shared secret, and
/// gets back what she needs to send the first Double Ratchet message.
/// Throws [X3dhHandshakeInvalid] if the bundle's SPK signature doesn't
/// verify -- this is the actual MITM check at handshake time (distinct
/// from, and more important than, a human comparing safety numbers).
Future<X3dhInitiatorResult> initiateSession({
  required IdentityKeyPair myIdentity,
  required RemoteBundle theirBundle,
}) async {
  final sigValid = await ed25519Verify(theirBundle.ikSignPub, theirBundle.spkPub, theirBundle.spkSig);
  if (!sigValid) {
    throw const X3dhHandshakeInvalid(
        "Peer's signed prekey signature does not verify against their identity key.");
  }

  final ephemeral = await generateX25519KeyPair();

  final dh1 = await dh(myIdentity.dh, theirBundle.spkPub);
  final dh2 = await dh(ephemeral, theirBundle.ikDhPub);
  final dh3 = await dh(ephemeral, theirBundle.spkPub);
  final dh4 = theirBundle.opkPub != null ? await dh(ephemeral, theirBundle.opkPub!) : null;

  final ikm = <int>[...dh1, ...dh2, ...dh3, if (dh4 != null) ...dh4];
  final sharedSecret = await hkdfSha256(
    ikm: ikm,
    salt: List.filled(32, 0),
    info: 'KodaX3DH',
    outputLength: 32,
  );

  final ad = Uint8List.fromList([...myIdentity.dh.publicKeyBytes, ...theirBundle.ikDhPub]);
  return X3dhInitiatorResult(sharedSecret, ad, ephemeral);
}

/// Bob's side: he receives Alice's prekey message header and completes
/// the same computation using his stored SPK private key (and OPK
/// private key, if the header references one).
Future<({Uint8List sharedSecret, Uint8List associatedData})> respondToSession({
  required IdentityKeyPair myIdentity,
  required X25519KeyPair mySignedPrekey,
  X25519KeyPair? myOneTimePrekey,
  required Uint8List theirIdentityDhPub,
  required Uint8List theirEphemeralPub,
}) async {
  final dh1 = await dh(mySignedPrekey, theirIdentityDhPub);
  final dh2 = await dh(myIdentity.dh, theirEphemeralPub);
  final dh3 = await dh(mySignedPrekey, theirEphemeralPub);
  final dh4 = myOneTimePrekey != null ? await dh(myOneTimePrekey, theirEphemeralPub) : null;

  final ikm = <int>[...dh1, ...dh2, ...dh3, if (dh4 != null) ...dh4];
  final sharedSecret = await hkdfSha256(
    ikm: ikm,
    salt: List.filled(32, 0),
    info: 'KodaX3DH',
    outputLength: 32,
  );

  final ad = Uint8List.fromList([...theirIdentityDhPub, ...myIdentity.dh.publicKeyBytes]);
  return (sharedSecret: sharedSecret, associatedData: ad);
}

/// The prekey-message header Alice attaches to her first Double Ratchet
/// message, stored server-side as dm_messages.x3dh_header. opk_public
/// (not an id) lets Bob identify which of his local OPK private keys to
/// use and then delete -- the server only ever hands out the public half.
Map<String, dynamic> x3dhHeaderJson({
  required IdentityKeyPair myIdentity,
  required X25519KeyPair ephemeral,
  Uint8List? opkPublicUsed,
}) => {
      'identity_pub':  bytesToB64(myIdentity.dh.publicKeyBytes),
      'ephemeral_pub': bytesToB64(ephemeral.publicKeyBytes),
      if (opkPublicUsed != null) 'opk_public': bytesToB64(opkPublicUsed),
    };
