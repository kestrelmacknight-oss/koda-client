// lib/core/crypto/dm_attachments.dart
//
// End-to-end encrypted file attachments for DMs. The file itself is
// encrypted client-side with a fresh, random, single-use AES-256-GCM key
// before it ever leaves the device -- the server and CDN only ever see
// ciphertext. That per-file key travels to the recipient the same way
// everything else in a DM does: inside the Double Ratchet-encrypted
// message content (see the envelope helpers below), never as a
// separate plaintext field the server could read.
//
// This is a deliberately different design from channel attachments
// (home_screen.dart), which upload the real file and content-type in
// the clear -- channels aren't end-to-end encrypted at all yet (group
// encryption is a separate, harder protocol), so there's no
// expectation of confidentiality to preserve there. DMs already have
// real E2EE for text; leaving attachments as a plaintext side-channel
// would undermine that.

import 'dart:convert';
import 'dart:typed_data';
import 'package:cryptography/cryptography.dart';
import '../api.dart';
import 'kcp_primitives.dart';

class DmAttachmentMeta {
  final String url; // CDN URL -- points at ciphertext, harmless if seen
  final String key; // base64 AES-256 key -- only ever travels encrypted
  final String nonce; // base64 12-byte nonce
  final String contentType; // the *real* type, known only after decrypting
  final String fileName;
  const DmAttachmentMeta({
    required this.url,
    required this.key,
    required this.nonce,
    required this.contentType,
    required this.fileName,
  });

  Map<String, dynamic> toJson() =>
      {'url': url, 'key': key, 'nonce': nonce, 'content_type': contentType, 'file_name': fileName};

  factory DmAttachmentMeta.fromJson(Map<String, dynamic> j) => DmAttachmentMeta(
        url: j['url'] as String,
        key: j['key'] as String,
        nonce: j['nonce'] as String,
        contentType: j['content_type'] as String,
        fileName: j['file_name'] as String,
      );
}

/// Encrypts [bytes] with a fresh random key and uploads the ciphertext.
/// Returns the metadata needed to fetch and decrypt it later -- the
/// caller is responsible for getting that metadata to the recipient via
/// the encrypted DM envelope, never as a bare message field.
Future<DmAttachmentMeta?> encryptAndUploadDmAttachment({
  required Uint8List bytes,
  required String contentType,
  required String fileName,
}) async {
  final key = Uint8List.fromList(SecretKeyData.random(length: 32).bytes);
  final nonce = randomNonce();
  final ciphertext = await aesGcmEncrypt(key: key, nonce: nonce, plaintext: bytes);

  final url = await KodaApi.instance.uploadBytes(
    bytes: ciphertext,
    uploadType: 'attachment',
    contentType: 'application/octet-stream',
  );
  if (url == null) {
    secureZero(key);
    return null;
  }

  // Base64-encode before zeroing -- the returned DmAttachmentMeta.key
  // string is an immutable Dart String that can never be wiped the way
  // this raw buffer can, so it's the one copy of this key that just has
  // to be trusted to the GC eventually. Zeroing the buffer afterward is
  // still real: it's the copy that would otherwise sit at whatever
  // address SecretKeyData.random allocated it at for the rest of this
  // isolate's life.
  final result = DmAttachmentMeta(
    url: url,
    key: bytesToB64(key),
    nonce: bytesToB64(nonce),
    contentType: contentType,
    fileName: fileName,
  );
  secureZero(key);
  return result;
}

/// Inverse of the upload half: fetches ciphertext from [meta.url] and
/// decrypts it with the key/nonce carried in the (already-decrypted)
/// message envelope. Throws on any failure -- same fail-closed rule as
/// the rest of this app's crypto: a corrupted or tampered attachment
/// must surface as an error, never as garbage bytes rendered to the UI.
Future<Uint8List> downloadAndDecryptDmAttachment(DmAttachmentMeta meta) async {
  final response = await KodaApi.instance.downloadRawBytes(meta.url);
  if (response == null) {
    throw StateError('Could not download attachment.');
  }
  final key = b64ToBytes(meta.key);
  try {
    return await aesGcmDecrypt(
      key: key,
      nonce: b64ToBytes(meta.nonce),
      payload: Uint8List.fromList(response),
    );
  } finally {
    secureZero(key);
  }
}

// ── DM message envelope ──────────────────────────────────────────────────
//
// What actually gets Double Ratchet-encrypted as a DM's "plaintext" is
// this small JSON envelope, not a bare string -- so a message can carry
// an attachment alongside (or instead of) text. Older messages sent
// before this existed are plain strings with no envelope; decodeDmPayload
// treats anything that isn't a recognizable envelope as legacy plain text
// rather than erroring, so old history keeps working.

String encodeDmPayload(String text, {DmAttachmentMeta? attachment}) {
  if (attachment == null) return text;
  return jsonEncode({'koda_dm_v1': true, 'text': text, 'attachment': attachment.toJson()});
}

class DmPayload {
  final String text;
  final DmAttachmentMeta? attachment;
  const DmPayload(this.text, this.attachment);
}

DmPayload decodeDmPayload(String raw) {
  try {
    final decoded = jsonDecode(raw);
    if (decoded is Map<String, dynamic> && decoded['koda_dm_v1'] == true) {
      final attachmentJson = decoded['attachment'] as Map<String, dynamic>?;
      return DmPayload(
        decoded['text'] as String? ?? '',
        attachmentJson != null ? DmAttachmentMeta.fromJson(attachmentJson) : null,
      );
    }
  } catch (_) {
    // Not our envelope -- fall through to legacy plain-text handling.
  }
  return DmPayload(raw, null);
}
