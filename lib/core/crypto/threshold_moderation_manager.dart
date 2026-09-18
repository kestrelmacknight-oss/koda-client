// lib/core/crypto/threshold_moderation_manager.dart
//
// Tier 3 ("threshold moderator decryption") client orchestration -- see
// koda-server's Koda.ThresholdModeration for the full design and the
// server-side half of this flow. Mirrors channel_key_manager.dart's
// shape closely: this is the same kind of "generate/split key material,
// deliver it over a pairwise ratchet session, never let the server see
// plaintext" pattern, just for Shamir shares of a channel epoch key
// instead of the epoch key itself.
//
// Flow (see Koda.ThresholdModeration's moduledoc for the server side of
// each step):
//   1. distributeSharesIfEnabled -- called right after a new channel
//      epoch key is generated (see channel_key_manager.dart), splits it
//      and delivers one share per designated moderator.
//   2. requestDecrypt -- a moderator asks to decrypt one epoch.
//   3. approve -- another designated moderator consents.
//   4. relayShareIfApproved -- once enough moderators have approved,
//      each of them (including the original requester, who already
//      holds their own share) decrypts their share locally and
//      re-encrypts it specifically to the requester.
//   5. tryReconstruct -- the requester, once it holds `threshold`
//      shares total (its own + relayed), reconstructs the epoch key
//      and returns it -- decrypting that epoch's messages from there on
//      is just the normal channel_epoch.dart machinery.

import 'dart:convert';
import 'dart:typed_data';
import '../api.dart';
import 'dm_session_manager.dart';
import 'kcp_primitives.dart' show secureZero;
import 'shamir.dart';

/// A deterministic, order-independent session id for the pairwise
/// ratchet used purely to move threshold-share material between two
/// users -- deliberately not a real DM (same reasoning as
/// channel_key_manager.dart's _channelKeySessionId, different prefix so
/// the two purposes stay logically distinct pairwise sessions even
/// between the same two users).
String _thresholdSessionId(String userIdA, String userIdB) {
  final sorted = [userIdA, userIdB]..sort();
  return 'tshare:${sorted[0]}:${sorted[1]}';
}

class ThresholdModerationManager {
  ThresholdModerationManager._();
  static final ThresholdModerationManager instance = ThresholdModerationManager._();

  /// Call right after a new channel epoch key is generated (both the
  /// bootstrap and post-departure-rotation paths in
  /// channel_key_manager.dart) -- no-ops entirely if Tier 3 isn't
  /// enabled for the channel's server, so this is always safe to call
  /// unconditionally from there.
  Future<void> distributeSharesIfEnabled({
    required String serverId,
    required String channelId,
    required int epoch,
    required Uint8List epochKey,
    required String myUserId,
  }) async {
    final config = await KodaApi.instance.getThresholdModerationConfig(serverId);
    if (config == null || config['enabled'] != true) return;

    final moderatorIds = List<String>.from(config['moderator_ids'] ?? []);
    final threshold = config['threshold'] as int?;
    if (moderatorIds.length < 2 || threshold == null || threshold < 2) return;

    final pending = await KodaApi.instance.getPendingThresholdShareRecipients(channelId, epoch);
    if (pending.isEmpty) return;

    final shares = Shamir.split(epochKey, threshold: threshold, totalShares: moderatorIds.length);
    // moderatorIds is a stable, ordered list from the server config --
    // share i goes to moderatorIds[i], consistently, so every
    // distribution for this epoch (even if split across multiple
    // callers racing to fill pending_share_recipients) hands the same
    // moderator the same share index.
    final byModeratorId = <String, ShamirShare>{
      for (var i = 0; i < moderatorIds.length && i < shares.length; i++) moderatorIds[i]: shares[i],
    };

    final deliveries = <Map<String, dynamic>>[];
    for (final moderatorId in pending) {
      final share = byModeratorId[moderatorId];
      if (share == null || moderatorId == myUserId) continue;
      try {
        final envelope = await DmSessionManager.instance.encryptForSendSingleSession(
          conversationId: _thresholdSessionId(myUserId, moderatorId),
          peerUserId: moderatorId,
          plaintext: jsonEncode(share.toJson()),
        );
        deliveries.add({
          'moderator_id': moderatorId,
          'share_index': share.index,
          'content': envelope.content,
          'ratchet_key': envelope.ratchetKey,
          'msg_number': envelope.msgNumber,
          'prev_chain': envelope.prevChain,
          'nonce': envelope.nonce,
          if (envelope.x3dhHeader != null) 'x3dh_header': envelope.x3dhHeader,
        });
      } catch (_) {
        // e.g. that moderator hasn't published a key bundle yet -- picked
        // up again next time someone calls this for the same epoch.
        continue;
      }
    }

    if (deliveries.isNotEmpty) {
      await KodaApi.instance.deliverThresholdShares(channelId, epoch, deliveries);
    }
  }

  /// This device's own share for a channel epoch, decrypted -- null if
  /// none has been delivered (yet, or Tier 3 wasn't enabled when that
  /// epoch was generated).
  Future<ShamirShare?> myShareFor(String channelId, int epoch, String myUserId) async {
    final deliveries = await KodaApi.instance.getMyThresholdShares(channelId);
    final match = deliveries.cast<Map<String, dynamic>?>().firstWhere(
        (d) => d?['epoch'] == epoch, orElse: () => null);
    if (match == null) return null;

    final plaintext = await DmSessionManager.instance.decryptReceived(
      conversationId: _thresholdSessionId(myUserId, match['sender_id'] as String),
      message: match,
    );
    return ShamirShare.fromJson(jsonDecode(plaintext) as Map<String, dynamic>);
  }

  Future<Map<String, dynamic>?> requestDecrypt(String channelId, int epoch, String reason) =>
      KodaApi.instance.createThresholdDecryptRequest(channelId, epoch, reason);

  Future<Map<String, dynamic>?> approve(String requestId) =>
      KodaApi.instance.approveThresholdDecryptRequest(requestId);

  /// Call after approving (or after learning a request you already
  /// approved has since become fully approved) -- if the request is
  /// approved and this device holds a share for that epoch, decrypts it
  /// locally and relays it to the requester. No-ops if the request
  /// isn't approved yet, or this device has no share for that epoch.
  Future<void> relayShareIfApproved({
    required Map<String, dynamic> request,
    required String myUserId,
  }) async {
    if (request['status'] != 'approved') return;
    final requestedBy = request['requested_by'] as String?;
    if (requestedBy == null || requestedBy == myUserId) return; // requester already holds their own share

    final channelId = request['channel_id'] as String;
    final epoch = request['epoch'] as int;
    final share = await myShareFor(channelId, epoch, myUserId);
    if (share == null) return;

    final envelope = await DmSessionManager.instance.encryptForSendSingleSession(
      conversationId: _thresholdSessionId(myUserId, requestedBy),
      peerUserId: requestedBy,
      plaintext: jsonEncode(share.toJson()),
    );
    await KodaApi.instance.relayThresholdShare(request['id'] as String, {
      'content': envelope.content,
      'ratchet_key': envelope.ratchetKey,
      'msg_number': envelope.msgNumber,
      'prev_chain': envelope.prevChain,
      'nonce': envelope.nonce,
      if (envelope.x3dhHeader != null) 'x3dh_header': envelope.x3dhHeader,
    });
  }

  /// For the requester: attempts to reconstruct the epoch key from its
  /// own share plus whatever's been relayed so far. Returns null if
  /// there aren't enough shares yet -- caller should try again later
  /// (e.g. on a manual refresh) rather than poll aggressively; this
  /// whole flow already requires other humans to actively approve and
  /// relay, so it's not going to resolve within one tick either way.
  Future<Uint8List?> tryReconstruct({
    required Map<String, dynamic> request,
    required String myUserId,
    required int threshold,
  }) async {
    final channelId = request['channel_id'] as String;
    final epoch = request['epoch'] as int;

    final mine = await myShareFor(channelId, epoch, myUserId);
    if (mine == null) return null;

    final relays = await KodaApi.instance.getThresholdShareRelays(request['id'] as String);
    final relayed = <ShamirShare>[];
    for (final r in relays) {
      try {
        final plaintext = await DmSessionManager.instance.decryptReceived(
          conversationId: _thresholdSessionId(myUserId, r['sender_id'] as String),
          message: r,
        );
        relayed.add(ShamirShare.fromJson(jsonDecode(plaintext) as Map<String, dynamic>));
      } catch (_) {
        continue; // one bad/undecryptable relay shouldn't block the rest
      }
    }

    final shares = [mine, ...relayed];
    if (shares.length < threshold) return null;

    final key = Shamir.combine(shares);
    // The individual share bytes have done their job; only the
    // reconstructed epoch key itself needs to go on to actually decrypt
    // messages (see channel_epoch.dart) and get zeroed after.
    for (final s in shares) {
      secureZero(s.bytes);
    }
    await KodaApi.instance.completeThresholdDecryptRequest(request['id'] as String);
    return key;
  }
}
