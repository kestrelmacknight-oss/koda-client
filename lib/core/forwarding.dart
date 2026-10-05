// lib/core/forwarding.dart
//
// Shared send logic for "Forward" -- composes already-decrypted plaintext
// (plus, if present, a freshly re-encrypted copy of the original
// attachment) as a brand-new message into a channel or DM, using the
// exact same encrypt-then-send sequence an ordinary live-typed message
// already goes through (see channel_chat_panel.dart's/dm_screen.dart's
// own _sendMessage). The server never sees plaintext at any point --
// forwarding only ever moves content a client already decrypted into a
// fresh encryption the destination's own key can open, never a
// server-side content copy. See core/crypto/channel_attachments.dart /
// dm_attachments.dart for the forwarded_from envelope field itself.

import 'crypto/attachment_crypto.dart';
import 'crypto/channel_attachments.dart';
import 'crypto/channel_key_manager.dart';
import 'crypto/dm_attachments.dart';
import 'crypto/dm_session_manager.dart';
import 'api.dart';
import 'secure_storage.dart';

/// The original attachment's key was only ever distributed to the
/// origin's recipients, so forwarding needs its own independently
/// encrypted copy, not a pointer to the same ciphertext. Returns null if
/// there was nothing to forward; throws if the re-encrypt/upload failed,
/// same fail-closed convention as the rest of this app's crypto -- a
/// forward must never silently drop or leak an attachment.
Future<EncryptedAttachmentMeta?> _reencryptAttachmentForForward(
    EncryptedAttachmentMeta? original) async {
  if (original == null) return null;
  final bytes = await downloadAndDecryptAttachment(original);
  final reencrypted = await encryptAndUploadAttachment(
    bytes: bytes,
    contentType: original.contentType,
    fileName: original.fileName,
  );
  if (reencrypted == null) throw StateError('Could not re-upload forwarded attachment.');
  return reencrypted;
}

/// Forwards [text] (plus [originalAttachment]/[gifAttachment], if any)
/// into [channelId] as a brand-new message, attributed to
/// [forwardedFrom]. Deliberately sets no reply-to or mentions -- those
/// are destination-context concepts the origin message's don't carry any
/// meaning into. Returns false on any failure (encryption not ready,
/// re-upload failed, send rejected).
Future<bool> forwardMessageToChannel({
  required String channelId,
  required String text,
  EncryptedAttachmentMeta? originalAttachment,
  Map<String, dynamic>? gifAttachment,
  required ForwardedFrom forwardedFrom,
  required String myUserId,
}) async {
  EncryptedAttachmentMeta? attachment;
  try {
    attachment = await _reencryptAttachmentForForward(originalAttachment);
  } catch (_) {
    return false;
  }

  final payload = encodeChannelPayload(text, attachment: attachment, forwardedFrom: forwardedFrom);
  final encrypted = await ChannelKeyManager.instance
      .encryptForChannel(channelId, payload, myUserId: myUserId);
  if (encrypted == null) return false;

  final result = await KodaApi.instance.sendMessage(channelId, encrypted.content,
      encrypted: true,
      epoch: encrypted.epoch,
      nonce: encrypted.nonce,
      attachmentUrl: gifAttachment?['url'],
      attachmentContentType: gifAttachment?['contentType']);
  final msg = result.data;
  if (msg != null) await SecureStorage.cacheDecryptedContent(msg['id'] as String, payload);
  return msg != null;
}

/// Forwards into a DM conversation -- same shape as the channel case,
/// substituting the DM's Double Ratchet fan-out for a channel epoch key.
Future<bool> forwardMessageToDm({
  required String conversationId,
  required String peerUserId,
  required String text,
  EncryptedAttachmentMeta? originalAttachment,
  required ForwardedFrom forwardedFrom,
  required String myUserId,
}) async {
  EncryptedAttachmentMeta? attachment;
  try {
    attachment = await _reencryptAttachmentForForward(originalAttachment);
  } catch (_) {
    return false;
  }

  final payload = encodeDmPayload(text, attachment: attachment, forwardedFrom: forwardedFrom);
  final fanOut = await DmSessionManager.instance.encryptForSend(
    conversationId: conversationId,
    peerUserId: peerUserId,
    myUserId: myUserId,
    plaintext: payload,
  );
  final groupId = await KodaApi.instance.sendDmMessage(
      conversationId, fanOut.messageGroupId, fanOut.deliveries.map((d) => d.toJson()).toList());
  if (groupId != null) await SecureStorage.cacheDecryptedContent(groupId, payload);
  return groupId != null;
}
