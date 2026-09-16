// lib/core/crypto/channel_key_manager.dart
//
// Orchestrates channel group encryption on top of channel_epoch.dart
// (the actual key generation/AES-GCM) and dm_session_manager.dart (the
// pairwise Double Ratchet used purely as a delivery transport for
// epoch keys -- see koda-server's Koda.ChannelCrypto for why that reuse
// is safe and deliberate).
//
// Three things happen here, all idempotent and safe to call repeatedly:
//  1. syncDeliveries -- decrypt any epoch keys sent to me that I don't
//     already have stored locally.
//  2. ensureReady -- bootstrap a channel's first epoch if it has none,
//     and opportunistically top up delivery to anyone currently missing
//     the key (new joiners, members who were offline last time).
//  3. rotateAfterDeparture -- start a fresh epoch after a member leaves/
//     is removed, so they can't read anything sent afterward.

import 'dart:convert';
import 'dart:typed_data';
import '../api.dart';
import '../secure_storage.dart';
import 'channel_epoch.dart';
import 'dm_session_manager.dart';
import 'kcp_primitives.dart';

class ChannelEncryptResult {
  final int epoch;
  final String content;
  final String nonce;
  const ChannelEncryptResult({required this.epoch, required this.content, required this.nonce});
}

/// A deterministic, order-independent session id for the pairwise
/// ratchet used purely to move an epoch key between two users --
/// deliberately NOT a real DM conversation id. Going through
/// openDmConversation/dm_conversations instead would (a) create a
/// visible, empty DM thread for two members who've never actually
/// talked, and (b) silently fail whenever the recipient has
/// friends-only DMs on and isn't already a friend of whoever's
/// distributing, since that's exactly what Koda.Friends.can_dm?/2
/// gates -- key-bundle fetch itself has no such gate (X3DH sessions are
/// meant to be establishable with anyone), so this reuses the ratchet
/// mechanics without ever touching the friends-gated endpoint.
String _channelKeySessionId(String userIdA, String userIdB) {
  final sorted = [userIdA, userIdB]..sort();
  return 'ckey:${sorted[0]}:${sorted[1]}';
}

class ChannelKeyManager {
  ChannelKeyManager._();
  static final ChannelKeyManager instance = ChannelKeyManager._();

  /// Decrypts and stores any epoch keys sent to me for this channel that
  /// I don't already hold locally. Best-effort per delivery -- one
  /// undecryptable entry (stale session, safety number changed) doesn't
  /// block the rest.
  Future<void> syncDeliveries(String channelId, {required String myUserId}) async {
    final deliveries = await KodaApi.instance.getMyChannelDeliveries(channelId);
    for (final d in deliveries) {
      final epoch = d['epoch'] as int?;
      final senderId = d['sender_id'] as String?;
      if (epoch == null || senderId == null) continue;

      final already = await SecureStorage.loadChannelEpochKey(channelId, epoch);
      if (already != null) continue;

      try {
        final plaintext = await DmSessionManager.instance.decryptReceived(
          conversationId: _channelKeySessionId(myUserId, senderId),
          message: d,
        );
        final payload = jsonDecode(plaintext) as Map<String, dynamic>;
        final key = b64ToBytes(payload['key'] as String);
        await SecureStorage.saveChannelEpochKey(channelId, epoch, key);
      } catch (_) {
        // Try again on the next sync rather than surfacing this --
        // a single bad delivery shouldn't block the rest.
        continue;
      }
    }
  }

  /// Ensures this channel has an epoch and that I hold its key where
  /// possible, then tops up delivery for anyone still missing it.
  /// Returns the current epoch number, or null if the channel still
  /// isn't usable yet (network failure, or I'm still waiting on someone
  /// else's delivery to reach me).
  Future<int?> ensureReady(String channelId, {required String myUserId}) async {
    await syncDeliveries(channelId, myUserId: myUserId);

    final currentEpoch = await KodaApi.instance.getChannelEpoch(channelId);
    if (currentEpoch == null) return null;

    var epoch = currentEpoch;
    if (epoch == 0) {
      final started = await KodaApi.instance.startChannelEpoch(channelId);
      if (started == null) return null;
      epoch = started.epoch;

      if (started.created) {
        // I won the race to bootstrap -- I'm the one who has to
        // actually generate the key, nobody else can.
        final key = await generateChannelEpochKey();
        await SecureStorage.saveChannelEpochKey(channelId, epoch, key);
      }
      // If I lost the race, fall through: I don't have the key yet and
      // must not generate my own -- distributePendingIfAny below will
      // no-op until a future syncDeliveries picks up the winner's copy.
    }

    final key = await SecureStorage.loadChannelEpochKey(channelId, epoch);
    if (key == null) return null; // waiting on a delivery -- caller should retry later

    await _distributePendingIfAny(channelId, epoch, key, myUserId: myUserId);
    return epoch;
  }

  /// Call after a member leaves/is kicked/is banned from a server whose
  /// channels are encrypted. Starts a fresh epoch and distributes it to
  /// everyone who still has access -- the departed member, no longer
  /// among them, can't read anything sent afterward. Best-effort: meant
  /// to be called by whichever client actually processes the departure,
  /// which already has the up-to-date member list.
  Future<void> rotateAfterDeparture(String channelId, {required String myUserId}) async {
    final started = await KodaApi.instance.startChannelEpoch(channelId);
    if (started == null || !started.created) return; // someone else is already handling it
    final key = await generateChannelEpochKey();
    await SecureStorage.saveChannelEpochKey(channelId, started.epoch, key);
    await _distributePendingIfAny(channelId, started.epoch, key, myUserId: myUserId);
  }

  Future<void> _distributePendingIfAny(
      String channelId, int epoch, Uint8List key, {required String myUserId}) async {
    final pending = await KodaApi.instance.getPendingEpochRecipients(channelId, epoch);
    if (pending.isEmpty) return;

    final payload = jsonEncode({'key': bytesToB64(key)});
    final deliveries = <Map<String, dynamic>>[];

    for (final recipientId in pending) {
      if (recipientId == myUserId) continue; // I already have it, nothing to deliver to myself
      try {
        final envelope = await DmSessionManager.instance.encryptForSendSingleSession(
          conversationId: _channelKeySessionId(myUserId, recipientId),
          peerUserId: recipientId,
          plaintext: payload,
        );
        deliveries.add({
          'recipient_id': recipientId,
          'content': envelope.content,
          'ratchet_key': envelope.ratchetKey,
          'msg_number': envelope.msgNumber,
          'prev_chain': envelope.prevChain,
          'nonce': envelope.nonce,
          if (envelope.x3dhHeader != null) 'x3dh_header': envelope.x3dhHeader,
        });
      } catch (_) {
        // e.g. recipient hasn't published a key bundle yet -- they'll
        // be picked up again next time someone calls ensureReady.
        continue;
      }
    }

    if (deliveries.isNotEmpty) {
      await KodaApi.instance.deliverChannelEpochKeys(channelId, epoch, deliveries);
    }
  }

  /// Encrypts [plaintext] for sending in [channelId], bootstrapping/
  /// distributing keys as needed first. Returns null if the channel
  /// isn't ready yet (see ensureReady) -- callers must not fall back to
  /// sending plaintext in that case.
  Future<ChannelEncryptResult?> encryptForChannel(
      String channelId, String plaintext, {required String myUserId}) async {
    final epoch = await ensureReady(channelId, myUserId: myUserId);
    if (epoch == null) return null;
    final key = await SecureStorage.loadChannelEpochKey(channelId, epoch);
    if (key == null) return null;

    final enc = await encryptChannelMessage(
      epochKey: key, channelId: channelId, epoch: epoch, plaintext: plaintext);
    return ChannelEncryptResult(epoch: epoch, content: enc.content, nonce: enc.nonce);
  }

  /// Encrypts [plaintext] under a *specific* already-established epoch
  /// rather than always the current one -- for editing a message that
  /// was originally sent under an older epoch. Returns null if this
  /// device doesn't hold that epoch's key (it should, if it's editing a
  /// message it originally sent under that epoch).
  Future<ChannelEncryptResult?> encryptForEpoch(
      String channelId, int epoch, String plaintext) async {
    final key = await SecureStorage.loadChannelEpochKey(channelId, epoch);
    if (key == null) return null;

    final enc = await encryptChannelMessage(
      epochKey: key, channelId: channelId, epoch: epoch, plaintext: plaintext);
    return ChannelEncryptResult(epoch: epoch, content: enc.content, nonce: enc.nonce);
  }

  /// Decrypts a received channel message. If the key for its epoch
  /// isn't held locally yet, syncs deliveries once before giving up --
  /// covers the case where this device just received a message before
  /// it had a chance to pick up the epoch key that was sent moments
  /// earlier. Returns null (never plaintext-fallback) if still unable.
  Future<String?> decryptForChannel(
      String channelId, int epoch, String content, String nonce, {required String myUserId}) async {
    var key = await SecureStorage.loadChannelEpochKey(channelId, epoch);
    if (key == null) {
      await syncDeliveries(channelId, myUserId: myUserId);
      key = await SecureStorage.loadChannelEpochKey(channelId, epoch);
    }
    if (key == null) return null;

    try {
      return await decryptChannelMessage(
        epochKey: key, channelId: channelId, epoch: epoch, content: content, nonce: nonce);
    } catch (_) {
      return null;
    }
  }
}
