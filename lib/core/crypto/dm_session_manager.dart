// lib/core/crypto/dm_session_manager.dart
//
// Ties X3DH + Double Ratchet + secure storage + the server's key-bundle
// endpoints together into per-DM-conversation session lifecycle:
// generating/uploading your own keys, initiating a session with a peer
// the first time you message them, completing one when a peer's first
// message reaches you, and encrypting/decrypting everything after that
// through the persisted ratchet state.

import 'dart:convert';
import 'dart:typed_data';
import '../api.dart';
import '../secure_storage.dart';
import 'kcp_primitives.dart';
import 'x3dh.dart';
import 'double_ratchet.dart';
import 'safety_number.dart';

class SafetyNumberChanged implements Exception {
  final String peerUserId;
  const SafetyNumberChanged(this.peerUserId);
  @override
  String toString() =>
      "SafetyNumberChanged: $peerUserId's identity key changed since it was last verified.";
}

class EncryptedEnvelope {
  final String content; // base64 ciphertext, goes in the message's `content` field
  final String ratchetKey;
  final int msgNumber;
  final int prevChain;
  final String nonce;
  final Map<String, dynamic>? x3dhHeader; // only present on a session's first message
  const EncryptedEnvelope({
    required this.content,
    required this.ratchetKey,
    required this.msgNumber,
    required this.prevChain,
    required this.nonce,
    this.x3dhHeader,
  });
}

class DmSessionManager {
  DmSessionManager._();
  static final DmSessionManager instance = DmSessionManager._();

  /// Call after login. Gated on *local* private-key presence, not
  /// whatever the server reports -- if secure storage was ever cleared
  /// while a server-side bundle record survived (reinstall, cleared
  /// keychain, etc.), the old approach would see "server already has a
  /// bundle" and skip regenerating keys, leaving the account with a
  /// public bundle nobody holds the matching private keys for anymore.
  /// Regenerating is always safe -- it just costs the old bundle's
  /// unused prekeys and (correctly) breaks any session other people
  /// have open with the identity that got lost.
  Future<void> ensureMyKeysExist() async {
    final existing = await SecureStorage.loadKeyMaterial();
    if (existing != null) return;

    final material = await generateKeyMaterial();
    final spkSig = await signPrekey(material.identity, material.signedPrekey);
    await SecureStorage.saveKeyMaterial(material);
    await KodaApi.instance.uploadKeyBundle(bundleToUploadJson(material, spkSig));
  }

  /// Encrypts [plaintext] for [peerUserId] in [conversationId], creating
  /// a brand-new X3DH session first if none exists locally yet.
  Future<EncryptedEnvelope> encryptForSend({
    required String conversationId,
    required String peerUserId,
    required String plaintext,
  }) async {
    var state = await SecureStorage.loadRatchetState(conversationId);
    Map<String, dynamic>? x3dhHeader;

    if (state == null) {
      final myMaterial = await SecureStorage.loadKeyMaterial();
      if (myMaterial == null) {
        throw StateError('No local key material -- call ensureMyKeysExist() first.');
      }

      final bundleJson = await KodaApi.instance.fetchKeyBundle(peerUserId);
      if (bundleJson == null) {
        throw StateError('$peerUserId has not published a key bundle yet.');
      }
      final remoteBundle = RemoteBundle.fromJson(bundleJson);

      await _checkAndPinIdentity(peerUserId, remoteBundle.ikDhPub, remoteBundle.ikSignPub);

      final x3dh = await initiateSession(myIdentity: myMaterial.identity, theirBundle: remoteBundle);
      state = await RatchetState.initAsInitiator(
        rootKey: x3dh.sharedSecret,
        theirInitialRatchetPublicKey: remoteBundle.spkPub,
        associatedData: x3dh.associatedData,
      );
      x3dhHeader = x3dhHeaderJson(
        myIdentity: myMaterial.identity,
        ephemeral: x3dh.ephemeral,
        opkPublicUsed: remoteBundle.opkPub,
      );
    }

    final result = await state.encrypt(utf8.encode(plaintext));
    await SecureStorage.saveRatchetState(conversationId, state);

    return EncryptedEnvelope(
      content: bytesToB64(result.payload),
      ratchetKey: bytesToB64(result.header.ratchetKey),
      msgNumber: result.header.msgNumber,
      prevChain: result.header.prevChain,
      nonce: bytesToB64(result.nonce),
      x3dhHeader: x3dhHeader,
    );
  }

  /// Decrypts an incoming DM message map (as returned by the server --
  /// see get_dm_messages/2 in koda-server's lib/koda/chat.ex). Completes
  /// the responder side of X3DH automatically if this is the first
  /// message of a new session (x3dh_header present and no local ratchet
  /// state yet).
  Future<String> decryptReceived({
    required String conversationId,
    required String senderUserId,
    required Map<String, dynamic> message,
  }) async {
    var state = await SecureStorage.loadRatchetState(conversationId);
    final x3dhHeaderJson = message['x3dh_header'] as Map<String, dynamic>?;

    if (state == null) {
      if (x3dhHeaderJson == null) {
        throw StateError(
            'No session for this conversation and the message carries no X3DH header -- cannot decrypt.');
      }
      final myMaterial = await SecureStorage.loadKeyMaterial();
      if (myMaterial == null) {
        throw StateError('No local key material -- call ensureMyKeysExist() first.');
      }

      final theirIdentityDhPub = b64ToBytes(x3dhHeaderJson['identity_pub'] as String);
      final theirEphemeralPub = b64ToBytes(x3dhHeaderJson['ephemeral_pub'] as String);
      final opkPublicUsed = x3dhHeaderJson['opk_public'] != null
          ? b64ToBytes(x3dhHeaderJson['opk_public'] as String)
          : null;

      await _checkAndPinIdentity(senderUserId, theirIdentityDhPub, null);

      X25519KeyPair? myOpk;
      if (opkPublicUsed != null) {
        myOpk = myMaterial.oneTimePrekeys
            .where((k) => bytesToB64(k.publicKeyBytes) == bytesToB64(opkPublicUsed))
            .firstOrNull;
      }

      final x3dh = await respondToSession(
        myIdentity: myMaterial.identity,
        mySignedPrekey: myMaterial.signedPrekey,
        myOneTimePrekey: myOpk,
        theirIdentityDhPub: theirIdentityDhPub,
        theirEphemeralPub: theirEphemeralPub,
      );
      state = RatchetState.initAsResponder(
        rootKey: x3dh.sharedSecret,
        myInitialRatchetKeyPair: myMaterial.signedPrekey,
        associatedData: x3dh.associatedData,
      );
      if (myOpk != null) {
        await SecureStorage.removeOneTimePrekey(myOpk.publicKeyBytes);
      }
    }

    final header = RatchetHeader(
      b64ToBytes(message['ratchet_key'] as String),
      message['msg_number'] as int,
      message['prev_chain'] as int,
    );
    final plaintext = await state.decrypt(
      header: header,
      nonce: b64ToBytes(message['nonce'] as String),
      payload: b64ToBytes(message['content'] as String),
    );
    await SecureStorage.saveRatchetState(conversationId, state);
    return utf8.decode(plaintext);
  }

  Future<String> mySafetyNumberWith(String peerUserId, Uint8List peerIkDhPub) async {
    final myMaterial = await SecureStorage.loadKeyMaterial();
    if (myMaterial == null) throw StateError('No local key material.');
    return computeSafetyNumber(
      myIkDhPub: myMaterial.identity.dh.publicKeyBytes,
      theirIkDhPub: peerIkDhPub,
    );
  }

  /// Checks (and pins, on first contact) a peer's identity keys. Safe to
  /// call from both the initiator path (has the full bundle, both keys)
  /// and the responder path (only the DH key, from the X3DH header --
  /// pass null for the signing key).
  Future<void> _checkAndPinIdentity(
      String peerUserId, Uint8List ikDhPub, Uint8List? ikSignPub) async {
    final pinned = await SecureStorage.loadPinnedIdentity(peerUserId);
    if (pinned == null) {
      await SecureStorage.savePinnedIdentity(peerUserId, PinnedIdentity(ikDhPub, ikSignPub));
      return;
    }
    if (!pinned.matches(ikDhPub, ikSignPub)) {
      throw SafetyNumberChanged(peerUserId);
    }
    final upgraded = pinned.upgraded(ikSignPub);
    if (!identical(upgraded, pinned)) {
      await SecureStorage.savePinnedIdentity(peerUserId, upgraded);
    }
  }
}
