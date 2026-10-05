// lib/core/crypto/dm_attachments.dart
//
// End-to-end encrypted file attachments for DMs. The file itself is
// encrypted client-side with a fresh, random, single-use AES-256-GCM key
// before it ever leaves the device -- the server and CDN only ever see
// ciphertext (see attachment_crypto.dart for the shared encrypt/upload/
// download primitives channel attachments now use too). That per-file
// key travels to the recipient the same way everything else in a DM
// does: inside the Double Ratchet-encrypted message content (see the
// envelope helpers below), never as a separate plaintext field the
// server could read.
//
// Channel attachments (channel_attachments.dart) follow the identical
// design, substituting the channel's shared epoch key for the DM
// ratchet as the envelope's outer encryption. Channel *text* has been
// genuinely end-to-end encrypted since channel_key_manager.dart shipped
// -- this file's envelope pattern was simply the first of the two to
// exist, not a DM-only capability.

import 'dart:convert';
import 'dart:typed_data';
import 'attachment_crypto.dart';

typedef DmAttachmentMeta = EncryptedAttachmentMeta;

/// Encrypts [bytes] with a fresh random key and uploads the ciphertext.
/// Returns the metadata needed to fetch and decrypt it later -- the
/// caller is responsible for getting that metadata to the recipient via
/// the encrypted DM envelope, never as a bare message field.
Future<DmAttachmentMeta?> encryptAndUploadDmAttachment({
  required Uint8List bytes,
  required String contentType,
  required String fileName,
}) =>
    encryptAndUploadAttachment(bytes: bytes, contentType: contentType, fileName: fileName);

/// Inverse of the upload half: fetches ciphertext from [meta.url] and
/// decrypts it with the key/nonce carried in the (already-decrypted)
/// message envelope. Throws on any failure -- same fail-closed rule as
/// the rest of this app's crypto: a corrupted or tampered attachment
/// must surface as an error, never as garbage bytes rendered to the UI.
Future<Uint8List> downloadAndDecryptDmAttachment(DmAttachmentMeta meta) =>
    downloadAndDecryptAttachment(meta);

// ── DM message envelope ──────────────────────────────────────────────────
//
// What actually gets Double Ratchet-encrypted as a DM's "plaintext" is
// this small JSON envelope, not a bare string -- so a message can carry
// an attachment alongside (or instead of) text. Older messages sent
// before this existed are plain strings with no envelope; decodeDmPayload
// treats anything that isn't a recognizable envelope as legacy plain text
// rather than erroring, so old history keeps working.

String encodeDmPayload(String text, {DmAttachmentMeta? attachment, ForwardedFrom? forwardedFrom}) {
  if (attachment == null && forwardedFrom == null) return text;
  return jsonEncode({
    'koda_dm_v1': true,
    'text': text,
    'attachment': attachment?.toJson(),
    'forwarded_from': forwardedFrom?.toJson(),
  });
}

class DmPayload {
  final String text;
  final DmAttachmentMeta? attachment;
  final ForwardedFrom? forwardedFrom;
  const DmPayload(this.text, this.attachment, [this.forwardedFrom]);
}

DmPayload decodeDmPayload(String raw) {
  try {
    final decoded = jsonDecode(raw);
    if (decoded is Map<String, dynamic> && decoded['koda_dm_v1'] == true) {
      final attachmentJson = decoded['attachment'] as Map<String, dynamic>?;
      final forwardedFromJson = decoded['forwarded_from'] as Map<String, dynamic>?;
      return DmPayload(
        decoded['text'] as String? ?? '',
        attachmentJson != null ? DmAttachmentMeta.fromJson(attachmentJson) : null,
        forwardedFromJson != null ? ForwardedFrom.fromJson(forwardedFromJson) : null,
      );
    }
  } catch (_) {
    // Not our envelope -- fall through to legacy plain-text handling.
  }
  return DmPayload(raw, null);
}
