// lib/core/crypto/channel_attachments.dart
//
// End-to-end encrypted file attachments for channels -- the channel
// equivalent of dm_attachments.dart's envelope. The file itself is
// encrypted client-side with a fresh, random, single-use AES-256-GCM key
// (see attachment_crypto.dart) before it ever leaves the device; the
// server and CDN only ever see ciphertext. That per-file key travels to
// every channel member the same way the message text already does:
// embedded in the plaintext that gets encrypted under the channel's
// shared epoch key (see channel_key_manager.dart), never as a separate
// plaintext field the server could read.

import 'dart:convert';
import 'attachment_crypto.dart';

/// What actually gets epoch-key-encrypted as a channel message's
/// "plaintext" is this small JSON envelope, not a bare string, whenever
/// there's an attachment or forward provenance to carry alongside (or
/// instead of) text. Every channel message encrypted before this existed
/// is a plain string with no envelope; decodeChannelPayload treats
/// anything that isn't a recognizable envelope as plain text rather than
/// erroring, so old history keeps working.
String encodeChannelPayload(String text, {EncryptedAttachmentMeta? attachment, ForwardedFrom? forwardedFrom}) {
  if (attachment == null && forwardedFrom == null) return text;
  return jsonEncode({
    'koda_channel_v1': true,
    'text': text,
    'attachment': attachment?.toJson(),
    'forwarded_from': forwardedFrom?.toJson(),
  });
}

class ChannelPayload {
  final String text;
  final EncryptedAttachmentMeta? attachment;
  final ForwardedFrom? forwardedFrom;
  const ChannelPayload(this.text, this.attachment, [this.forwardedFrom]);
}

ChannelPayload decodeChannelPayload(String raw) {
  try {
    final decoded = jsonDecode(raw);
    if (decoded is Map<String, dynamic> && decoded['koda_channel_v1'] == true) {
      final attachmentJson = decoded['attachment'] as Map<String, dynamic>?;
      final forwardedFromJson = decoded['forwarded_from'] as Map<String, dynamic>?;
      return ChannelPayload(
        decoded['text'] as String? ?? '',
        attachmentJson != null ? EncryptedAttachmentMeta.fromJson(attachmentJson) : null,
        forwardedFromJson != null ? ForwardedFrom.fromJson(forwardedFromJson) : null,
      );
    }
  } catch (_) {
    // Not our envelope -- fall through to legacy plain-text handling.
  }
  return ChannelPayload(raw, null);
}
