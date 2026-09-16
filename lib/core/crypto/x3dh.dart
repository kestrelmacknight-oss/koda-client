// lib/core/crypto/x3dh.dart
//
// X3DH (Extended Triple Diffie-Hellman) session establishment -- the
// handshake that lets Alice start an encrypted conversation with Bob
// even while Bob is offline, using prekeys Bob published ahead of time.
// Same construction Signal uses. Output feeds directly into
// double_ratchet.dart as the initial root key.

import 'dart:convert';
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
///
/// [previousSignedPrekey] exists to bridge SPK rotation: a peer may have
/// fetched our bundle (and started an X3DH handshake against the SPK that
/// was current then) just before we rotated. Without keeping that old
/// private key around for a grace window, their first message would be
/// silently undecryptable -- not an attack, just an ordinary race, but
/// one that would look identical to one at the UI layer. It's discarded
/// once [previousSignedPrekeyExpiresAt] passes (see
/// dm_session_manager.dart's rotation logic), same grace-period tradeoff
/// Signal's own clients make.
class LocalKeyMaterial {
  final IdentityKeyPair identity;
  final X25519KeyPair signedPrekey;
  final DateTime signedPrekeyCreatedAt;
  final X25519KeyPair? previousSignedPrekey;
  final DateTime? previousSignedPrekeyExpiresAt;
  final List<X25519KeyPair> oneTimePrekeys;
  const LocalKeyMaterial(
    this.identity,
    this.signedPrekey,
    this.oneTimePrekeys, {
    required this.signedPrekeyCreatedAt,
    this.previousSignedPrekey,
    this.previousSignedPrekeyExpiresAt,
  });
}

const _oneTimePrekeyCount = 20;

Future<LocalKeyMaterial> generateKeyMaterial() async {
  final signing = await generateEd25519KeyPair();
  final dh = await generateX25519KeyPair();
  final spk = await generateX25519KeyPair();
  final opks = await Future.wait(List.generate(_oneTimePrekeyCount, (_) => generateX25519KeyPair()));
  return LocalKeyMaterial(IdentityKeyPair(signing, dh), spk, opks,
      signedPrekeyCreatedAt: DateTime.now().toUtc());
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
  final Uint8List sessionProof; // see computeSessionProof -- goes in the X3DH header
  const X3dhInitiatorResult(
      this.sharedSecret, this.associatedData, this.ephemeral, this.sessionProof);
}

class X3dhHandshakeInvalid implements Exception {
  final String message;
  const X3dhHandshakeInvalid(this.message);
  @override
  String toString() => 'X3dhHandshakeInvalid: $message';
}

/// Thrown when a session proof (see [computeSessionProof]) doesn't match
/// what the peer sent -- both sides derived a *different* shared secret
/// from the same handshake, which the Double Ratchet's own AEAD tags
/// would eventually catch too (they fail closed on the first message),
/// but this catches it immediately, before any ratchet state is created,
/// and gives a specific diagnosis instead of a generic decrypt failure.
class X3dhSessionProofMismatch implements Exception {
  final String message;
  const X3dhSessionProofMismatch(this.message);
  @override
  String toString() => 'X3dhSessionProofMismatch: $message';
}

/// TLS-Finished-style handshake confirmation: an HMAC over the session's
/// associated data (which identity-key pair this handshake is between),
/// keyed by the shared secret itself. Since HMAC is a PRF, publishing this
/// value leaks nothing about the shared secret -- so it's safe to send in
/// the clear in the X3DH header. Both sides compute it independently right
/// after deriving the shared secret; if the values don't match, one side
/// took a different path through the X3DH math (wrong prekey, stale
/// bundle, implementation bug) and the session must not be trusted.
const _sessionProofLabel = 'KodaX3DH-SessionProof';

Future<Uint8List> computeSessionProof({
  required Uint8List sharedSecret,
  required Uint8List associatedData,
}) =>
    hmacSha256(sharedSecret, [...associatedData, ...utf8.encode(_sessionProofLabel)]);

/// Verifies a peer-supplied session proof against one computed locally.
/// Throws [X3dhSessionProofMismatch] (rather than returning a bool) so
/// callers can't accidentally ignore a failed check the way a discarded
/// boolean return value could be.
Future<void> verifySessionProof({
  required Uint8List sharedSecret,
  required Uint8List associatedData,
  required Uint8List theirProof,
}) async {
  final expected = await computeSessionProof(sharedSecret: sharedSecret, associatedData: associatedData);
  if (!constantTimeEquals(expected, theirProof)) {
    throw const X3dhSessionProofMismatch(
        'Session proof does not match -- the two sides derived different shared secrets.');
  }
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
  // Raw ECDH outputs and their concatenation are only needed as HKDF
  // input keying material -- wipe them once the derivation is done.
  secureZero(dh1);
  secureZero(dh2);
  secureZero(dh3);
  if (dh4 != null) secureZero(dh4);
  ikm.fillRange(0, ikm.length, 0);

  final ad = Uint8List.fromList([...myIdentity.dh.publicKeyBytes, ...theirBundle.ikDhPub]);
  final sessionProof = await computeSessionProof(sharedSecret: sharedSecret, associatedData: ad);
  return X3dhInitiatorResult(sharedSecret, ad, ephemeral, sessionProof);
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
  secureZero(dh1);
  secureZero(dh2);
  secureZero(dh3);
  if (dh4 != null) secureZero(dh4);
  ikm.fillRange(0, ikm.length, 0);

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
  required Uint8List sessionProof,
  Uint8List? opkPublicUsed,
}) => {
      'identity_pub':  bytesToB64(myIdentity.dh.publicKeyBytes),
      'ephemeral_pub': bytesToB64(ephemeral.publicKeyBytes),
      'session_proof': bytesToB64(sessionProof),
      if (opkPublicUsed != null) 'opk_public': bytesToB64(opkPublicUsed),
    };
