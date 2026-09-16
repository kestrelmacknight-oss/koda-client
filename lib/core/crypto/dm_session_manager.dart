// lib/core/crypto/dm_session_manager.dart
//
// Ties X3DH + Double Ratchet + secure storage + the server's key-bundle
// endpoints together into per-DM-conversation session lifecycle:
// generating/uploading your own keys, initiating a session with a peer
// the first time you message them, completing one when a peer's first
// message reaches you, and encrypting/decrypting everything after that
// through the persisted ratchet state.
//
// Multi-device: a conversation is no longer one Double Ratchet session,
// it's N -- one per *device* on either end. Sending fans a message out
// to every device the recipient has *and* every other device this
// account itself has (so your own other devices see what you sent).
// Each session is still exactly the same X3DH + Double Ratchet
// construction as before, just keyed by (conversationId, otherDeviceId)
// instead of (conversationId) alone -- see SecureStorage's
// saveRatchetState/loadRatchetState. Backward compatibility for
// messages sent before this existed is handled by treating a row with
// no recipient_device_id as "legacy," decrypted via the original
// (pre-multi-device) storage key -- see decryptReceived below.

import 'dart:convert';
import 'dart:io' show Platform;
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

/// One target device's encrypted copy of a message -- what actually
/// goes on the wire per delivery. A single encryptForSend call produces
/// a list of these (one per fan-out target) sharing one messageGroupId.
class EncryptedEnvelope {
  final String content; // base64 ciphertext
  final String ratchetKey;
  final int msgNumber;
  final int prevChain;
  final String nonce;
  final Map<String, dynamic>? x3dhHeader; // only present on a session's first message to this device
  final String senderDeviceId;
  final String recipientDeviceId;
  const EncryptedEnvelope({
    required this.content,
    required this.ratchetKey,
    required this.msgNumber,
    required this.prevChain,
    required this.nonce,
    required this.senderDeviceId,
    required this.recipientDeviceId,
    this.x3dhHeader,
  });

  Map<String, dynamic> toJson() => {
        'content': content,
        'ratchet_key': ratchetKey,
        'msg_number': msgNumber,
        'prev_chain': prevChain,
        'nonce': nonce,
        'sender_device_id': senderDeviceId,
        'recipient_device_id': recipientDeviceId,
        if (x3dhHeader != null) 'x3dh_header': x3dhHeader,
      };
}

class FanOutResult {
  final String messageGroupId;
  final List<EncryptedEnvelope> deliveries;
  const FanOutResult(this.messageGroupId, this.deliveries);
}

class _Target {
  final String userId;
  final String deviceId;
  const _Target(this.userId, this.deviceId);
}

class DmSessionManager {
  /// How long a signed prekey stays current before rotateSignedPrekeyIfDue
  /// replaces it. Signal-class clients rotate on a similar weekly cadence
  /// -- frequent enough to bound how long a single leaked SPK private key
  /// stays useful to an attacker, infrequent enough that it's not a
  /// meaningful battery/bandwidth cost.
  static const spkRotationInterval = Duration(days: 7);

  /// How long a just-retired SPK's private key is kept around after
  /// rotation purely to decrypt X3DH handshakes that were already in
  /// flight against it (a peer who fetched our bundle moments before we
  /// rotated). Generous on purpose -- OPK-less handshake messages queued
  /// server-side for an offline peer could realistically be older than a
  /// day by the time they're delivered.
  static const spkGraceRetention = Duration(days: 14);

  DmSessionManager._();
  static final DmSessionManager instance = DmSessionManager._();

  /// Call after login. Gated on *local* private-key presence, not
  /// whatever the server reports -- if secure storage was ever cleared
  /// while a server-side bundle record survived (reinstall, cleared
  /// keychain, etc.), the old approach would see "server already has a
  /// bundle" and skip regenerating keys, leaving the account with a
  /// public bundle nobody holds the matching private keys for anymore.
  /// Regenerating is always safe for *this device* -- it only affects
  /// this device's own key_bundles row (see Koda.Devices server-side),
  /// never any other device's.
  Future<void> ensureMyKeysExist() async {
    final existing = await SecureStorage.loadKeyMaterial();
    if (existing != null) return;

    final material = await generateKeyMaterial();
    final spkSig = await signPrekey(material.identity, material.signedPrekey);
    await SecureStorage.saveKeyMaterial(material);
    final deviceId = await SecureStorage.getOrCreateDeviceId();
    await KodaApi.instance.uploadKeyBundle({
      ...bundleToUploadJson(material, spkSig),
      'device_id': deviceId,
      'device_name': _deviceName(),
    });
  }

  /// Rotates the signed prekey if it's older than [spkRotationInterval].
  /// Safe to call on every app start / periodically while the app is
  /// open -- a no-op most of the time. Only the SPK rotates here (not the
  /// identity key, which must stay stable for TOFU pinning to mean
  /// anything, and not one-time prekeys, which are single-use and
  /// replenished separately).
  ///
  /// The upload is a *partial* PUT -- just device_id/spk_pub/spk_sig --
  /// which the server's put_key_bundle/3 merges via Ecto's cast/3 rather
  /// than replacing the row, so it can't clobber ik_*_pub or opks. The
  /// server also stamps spk_rotated_at itself on every such call, so
  /// there's nothing to send for that field (see koda-server's
  /// lib/koda/crypto.ex).
  ///
  /// Already-established Double Ratchet sessions are unaffected: once
  /// initAsResponder/initAsInitiator captures a signed-prekey keypair
  /// into a conversation's persisted ratchet state, that state never
  /// consults SecureStorage.loadKeyMaterial().signedPrekey again -- only
  /// *new* incoming sessions look at the current SPK, which is exactly
  /// what the previousSignedPrekey grace window in decryptReceived exists
  /// to bridge.
  Future<void> rotateSignedPrekeyIfDue() async {
    final material = await SecureStorage.loadKeyMaterial();
    if (material == null) return; // ensureMyKeysExist() hasn't run yet

    final age = DateTime.now().toUtc().difference(material.signedPrekeyCreatedAt);
    if (age < spkRotationInterval) return;

    final newSpk = await generateX25519KeyPair();
    final spkSig = await signPrekey(material.identity, newSpk);
    final now = DateTime.now().toUtc();

    // If a still-in-grace-period previous SPK exists from an earlier
    // rotation, it's being replaced now regardless of whether its own
    // grace window had already elapsed -- nothing keeps a reference to it
    // after this point, so wipe it rather than just letting it fall out
    // of the object graph unzeroed.
    if (material.previousSignedPrekey != null) {
      secureZero(material.previousSignedPrekey!.privateKeyBytes);
    }

    final rotated = LocalKeyMaterial(
      material.identity,
      newSpk,
      material.oneTimePrekeys,
      signedPrekeyCreatedAt: now,
      previousSignedPrekey: material.signedPrekey,
      previousSignedPrekeyExpiresAt: now.add(spkGraceRetention),
    );
    await SecureStorage.saveKeyMaterial(rotated);
    await KodaApi.instance.uploadKeyBundle({
      'device_id': await SecureStorage.getOrCreateDeviceId(),
      'spk_pub': bytesToB64(newSpk.publicKeyBytes),
      'spk_sig': bytesToB64(spkSig),
    });
  }

  /// A single, non-fanned-out session with [peerUserId] under
  /// [conversationId] -- keyed by the original (pre-multi-device)
  /// storage key, same one a legacy row's decryptReceived falls back
  /// to. This is **not** for real DM conversations (those need
  /// encryptForSend's full multi-device fan-out so every device on both
  /// ends gets a copy) -- it exists for channel_key_manager.dart, which
  /// reuses the pairwise Double Ratchet purely as a transport to move a
  /// channel's epoch key to one other *user* (koda-server's
  /// Koda.ChannelCrypto has no per-device concept at all -- one
  /// delivery row per recipient user, full stop), not a real
  /// conversation multiple devices need independent copies of.
  Future<EncryptedEnvelope> encryptForSendSingleSession({
    required String conversationId,
    required String peerUserId,
    required String plaintext,
  }) async {
    final myMaterial = await SecureStorage.loadKeyMaterial();
    if (myMaterial == null) {
      throw StateError('No local key material -- call ensureMyKeysExist() first.');
    }

    var state = await SecureStorage.loadRatchetState(conversationId);
    Map<String, dynamic>? x3dhHeader;

    if (state == null) {
      final bundleJson = await KodaApi.instance.fetchKeyBundle(
          peerUserId, (await KodaApi.instance.getDeviceIdsFor(peerUserId)).firstOrNull ?? '');
      if (bundleJson == null) {
        throw StateError('$peerUserId has not published a key bundle yet.');
      }
      final remoteBundle = RemoteBundle.fromJson(bundleJson);
      await _checkAndPinIdentity(peerUserId, remoteBundle.ikDhPub, remoteBundle.ikSignPub, null);

      final x3dh = await initiateSession(myIdentity: myMaterial.identity, theirBundle: remoteBundle);
      state = await RatchetState.initAsInitiator(
        rootKey: x3dh.sharedSecret,
        theirInitialRatchetPublicKey: remoteBundle.spkPub,
        associatedData: x3dh.associatedData,
      );
      x3dhHeader = x3dhHeaderJson(
        myIdentity: myMaterial.identity,
        ephemeral: x3dh.ephemeral,
        sessionProof: x3dh.sessionProof,
        opkPublicUsed: remoteBundle.opkPub,
      );
      secureZero(x3dh.sharedSecret);
      secureZero(x3dh.ephemeral.privateKeyBytes);
    }

    final result = await state.encrypt(utf8.encode(plaintext));
    await SecureStorage.saveRatchetState(conversationId, state);

    return EncryptedEnvelope(
      content: bytesToB64(result.payload),
      ratchetKey: bytesToB64(result.header.ratchetKey),
      msgNumber: result.header.msgNumber,
      prevChain: result.header.prevChain,
      nonce: bytesToB64(result.nonce),
      senderDeviceId: '',
      recipientDeviceId: '',
      x3dhHeader: x3dhHeader,
    );
  }

  /// Encrypts [plaintext] for every device that needs a copy: every
  /// device [peerUserId] currently has, plus every *other* device this
  /// account itself has (self-sync) -- established sessions are reused,
  /// new ones are X3DH-initiated on demand, one handshake per new
  /// target device. Throws if the peer has no devices at all (never
  /// published a bundle).
  Future<FanOutResult> encryptForSend({
    required String conversationId,
    required String peerUserId,
    required String myUserId,
    required String plaintext,
  }) async {
    final myMaterial = await SecureStorage.loadKeyMaterial();
    if (myMaterial == null) {
      throw StateError('No local key material -- call ensureMyKeysExist() first.');
    }
    final myDeviceId = await SecureStorage.getOrCreateDeviceId();

    final peerDeviceIds = await KodaApi.instance.getDeviceIdsFor(peerUserId);
    if (peerDeviceIds.isEmpty) {
      throw StateError('$peerUserId has not published a key bundle yet.');
    }
    final myOtherDevices = (await KodaApi.instance.getMyDevices())
        .map((d) => d['device_id'] as String)
        .where((id) => id != myDeviceId);

    final targets = <_Target>[
      for (final d in peerDeviceIds) _Target(peerUserId, d),
      for (final d in myOtherDevices) _Target(myUserId, d),
    ];

    final plaintextBytes = utf8.encode(plaintext);
    final deliveries = <EncryptedEnvelope>[];

    for (final target in targets) {
      var state = await SecureStorage.loadRatchetState(conversationId, target.deviceId);
      Map<String, dynamic>? x3dhHeader;

      if (state == null) {
        final bundleJson = await KodaApi.instance.fetchKeyBundle(target.userId, target.deviceId);
        if (bundleJson == null) {
          // Vanished between the device-id listing above and now (device
          // revoked mid-send) -- skip it, the rest of the fan-out still
          // has to reach everyone else.
          continue;
        }
        final remoteBundle = RemoteBundle.fromJson(bundleJson);
        await _checkAndPinIdentity(target.userId, remoteBundle.ikDhPub, remoteBundle.ikSignPub, target.deviceId);

        final x3dh = await initiateSession(myIdentity: myMaterial.identity, theirBundle: remoteBundle);
        state = await RatchetState.initAsInitiator(
          rootKey: x3dh.sharedSecret,
          theirInitialRatchetPublicKey: remoteBundle.spkPub,
          associatedData: x3dh.associatedData,
        );
        x3dhHeader = x3dhHeaderJson(
          myIdentity: myMaterial.identity,
          ephemeral: x3dh.ephemeral,
          sessionProof: x3dh.sessionProof,
          opkPublicUsed: remoteBundle.opkPub,
        );
        // initAsInitiator already HKDF-derived its own root key from
        // sharedSecret (a copy); the raw shared secret and the ephemeral
        // private key have no further use once the header above is built.
        secureZero(x3dh.sharedSecret);
        secureZero(x3dh.ephemeral.privateKeyBytes);
      }

      final result = await state.encrypt(plaintextBytes);
      await SecureStorage.saveRatchetState(conversationId, state, target.deviceId);

      deliveries.add(EncryptedEnvelope(
        content: bytesToB64(result.payload),
        ratchetKey: bytesToB64(result.header.ratchetKey),
        msgNumber: result.header.msgNumber,
        prevChain: result.header.prevChain,
        nonce: bytesToB64(result.nonce),
        senderDeviceId: myDeviceId,
        recipientDeviceId: target.deviceId,
        x3dhHeader: x3dhHeader,
      ));
    }

    return FanOutResult(_generateUuidV4(), deliveries);
  }

  /// Decrypts an incoming DM message row (as returned by
  /// Koda.Chat.get_dm_messages/3). Completes the responder side of X3DH
  /// automatically if this is the first message of a new session
  /// (x3dh_header present and no local ratchet state yet for that
  /// sender device). The sender may be the conversation's other
  /// participant *or*, for a self-sync delivery, one of this account's
  /// own other devices -- both are handled identically, since the
  /// crypto doesn't care who's on the other end of a session, only
  /// which device.
  Future<String> decryptReceived({
    required String conversationId,
    required Map<String, dynamic> message,
  }) async {
    final senderUserId = message['sender_id'] as String;
    final senderDeviceId = message['sender_device_id'] as String?;
    final recipientDeviceId = message['recipient_device_id'] as String?;

    // recipient_device_id == null marks a row from before multi-device
    // existed -- decrypt it via the original single-session storage key,
    // completely untouched by anything below. Never happens for a row
    // sent after this shipped (every new send always populates it).
    final legacy = recipientDeviceId == null;

    var state = await SecureStorage.loadRatchetState(conversationId, legacy ? null : senderDeviceId);
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
      // Absent on headers written before session proofs existed --
      // tolerated for backward compatibility, verified strictly whenever
      // it's present.
      final theirSessionProof = x3dhHeaderJson['session_proof'] != null
          ? b64ToBytes(x3dhHeaderJson['session_proof'] as String)
          : null;

      await _checkAndPinIdentity(senderUserId, theirIdentityDhPub, null, legacy ? null : senderDeviceId);

      X25519KeyPair? myOpk;
      if (opkPublicUsed != null) {
        myOpk = myMaterial.oneTimePrekeys
            .where((k) => bytesToB64(k.publicKeyBytes) == bytesToB64(opkPublicUsed))
            .firstOrNull;
      }

      final header = RatchetHeader(
        b64ToBytes(message['ratchet_key'] as String),
        message['msg_number'] as int,
        message['prev_chain'] as int,
      );
      final nonce = b64ToBytes(message['nonce'] as String);
      final payload = b64ToBytes(message['content'] as String);

      // Try the current SPK first. If it fails and we still hold a
      // just-retired one within its grace window, this message may be an
      // X3DH handshake the sender started against our *previous* bundle
      // just before we rotated -- retry against that one before giving up.
      // See LocalKeyMaterial's previousSignedPrekey doc for why this is a
      // routine race rather than something to fail closed on immediately.
      Future<RatchetState> buildResponderState(X25519KeyPair spk) async {
        final x3dh = await respondToSession(
          myIdentity: myMaterial.identity,
          mySignedPrekey: spk,
          myOneTimePrekey: myOpk,
          theirIdentityDhPub: theirIdentityDhPub,
          theirEphemeralPub: theirEphemeralPub,
        );
        if (theirSessionProof != null) {
          // Verify before creating any ratchet state -- a mismatch here
          // means the two sides derived different shared secrets, so
          // nothing downstream of this point should be trusted.
          await verifySessionProof(
            sharedSecret: x3dh.sharedSecret,
            associatedData: x3dh.associatedData,
            theirProof: theirSessionProof,
          );
        }
        // Unlike the initiator's copy, this sharedSecret becomes
        // RatchetState.rootKey directly (initAsResponder doesn't re-derive
        // it) -- it must not be zeroed here.
        return RatchetState.initAsResponder(
          rootKey: x3dh.sharedSecret,
          myInitialRatchetKeyPair: spk,
          associatedData: x3dh.associatedData,
        );
      }

      final candidate = await buildResponderState(myMaterial.signedPrekey);
      try {
        final plaintext = await candidate.decrypt(header: header, nonce: nonce, payload: payload);
        state = candidate;
        await SecureStorage.saveRatchetState(conversationId, state, legacy ? null : senderDeviceId);
        if (myOpk != null) {
          await SecureStorage.removeOneTimePrekey(myOpk.publicKeyBytes);
          secureZero(myOpk.privateKeyBytes); // one-time prekeys are single-use by design
        }
        return utf8.decode(plaintext);
      } on DoubleRatchetDecryptFailure {
        final previous = myMaterial.previousSignedPrekey;
        final previousExpiresAt = myMaterial.previousSignedPrekeyExpiresAt;
        if (previous == null ||
            previousExpiresAt == null ||
            DateTime.now().toUtc().isAfter(previousExpiresAt)) {
          rethrow;
        }
        final fallback = await buildResponderState(previous);
        final plaintext = await fallback.decrypt(header: header, nonce: nonce, payload: payload);
        state = fallback;
        await SecureStorage.saveRatchetState(conversationId, state, legacy ? null : senderDeviceId);
        if (myOpk != null) {
          await SecureStorage.removeOneTimePrekey(myOpk.publicKeyBytes);
          secureZero(myOpk.privateKeyBytes);
        }
        return utf8.decode(plaintext);
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
    await SecureStorage.saveRatchetState(conversationId, state, legacy ? null : senderDeviceId);
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

  /// Checks (and pins, on first contact) a peer device's identity keys.
  /// Safe to call from both the initiator path (has the full bundle,
  /// both keys) and the responder path (only the DH key, from the X3DH
  /// header -- pass null for the signing key). [deviceId] null pins
  /// under the legacy (pre-multi-device) key, for backward-compatible
  /// history only -- every new pin is device-scoped, since each of a
  /// peer's devices has its own independent identity key (see
  /// SecureStorage.getOrCreateDeviceId's doc for why there's no way
  /// around that without a device-linking ceremony this app doesn't have).
  Future<void> _checkAndPinIdentity(
      String peerUserId, Uint8List ikDhPub, Uint8List? ikSignPub, String? deviceId) async {
    final pinned = await SecureStorage.loadPinnedIdentity(peerUserId, deviceId);
    if (pinned == null) {
      await SecureStorage.savePinnedIdentity(peerUserId, PinnedIdentity(ikDhPub, ikSignPub), deviceId);
      return;
    }
    if (!pinned.matches(ikDhPub, ikSignPub)) {
      throw SafetyNumberChanged(peerUserId);
    }
    final upgraded = pinned.upgraded(ikSignPub);
    if (!identical(upgraded, pinned)) {
      await SecureStorage.savePinnedIdentity(peerUserId, upgraded, deviceId);
    }
  }

  static const _deviceNames = {
    'windows': 'Windows', 'macos': 'macOS', 'linux': 'Linux',
    'android': 'Android', 'ios': 'iOS',
  };

  String _deviceName() {
    try {
      return _deviceNames[Platform.operatingSystem] ?? Platform.operatingSystem;
    } catch (_) {
      return 'Device';
    }
  }

  String _generateUuidV4() {
    final bytes = randomBytes(16);
    bytes[6] = (bytes[6] & 0x0f) | 0x40; // version 4
    bytes[8] = (bytes[8] & 0x3f) | 0x80; // variant 10
    final hex = bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join();
    return '${hex.substring(0, 8)}-${hex.substring(8, 12)}-${hex.substring(12, 16)}-'
        '${hex.substring(16, 20)}-${hex.substring(20)}';
  }
}
