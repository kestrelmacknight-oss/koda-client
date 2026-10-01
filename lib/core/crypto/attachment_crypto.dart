// lib/core/crypto/attachment_crypto.dart
//
// Generic encrypted-file-attachment primitives, shared by DMs
// (dm_attachments.dart) and channels (channel_attachments.dart). A file
// is encrypted client-side with a fresh, random, single-use AES-256-GCM
// key before it ever leaves the device -- the server and CDN only ever
// see ciphertext, uploaded as generic application/octet-stream so the
// real content-type isn't leaked either. The key/nonce/content-type/
// file name travel back to the recipient only inside whatever
// already-encrypted envelope the caller embeds them in (the DM Double
// Ratchet, or a channel's shared epoch key) -- never as a bare
// server-visible field.

import 'dart:typed_data';
import 'package:cryptography/cryptography.dart';
import '../api.dart';
import 'kcp_primitives.dart';

class EncryptedAttachmentMeta {
  final String url; // CDN URL -- points at ciphertext, harmless if seen
  final String key; // base64 AES-256 key -- only ever travels encrypted
  final String nonce; // base64 12-byte nonce
  final String contentType; // the *real* type, known only after decrypting
  final String fileName;
  const EncryptedAttachmentMeta({
    required this.url,
    required this.key,
    required this.nonce,
    required this.contentType,
    required this.fileName,
  });

  Map<String, dynamic> toJson() =>
      {'url': url, 'key': key, 'nonce': nonce, 'content_type': contentType, 'file_name': fileName};

  factory EncryptedAttachmentMeta.fromJson(Map<String, dynamic> j) => EncryptedAttachmentMeta(
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
/// its own encrypted envelope, never as a bare message field.
Future<EncryptedAttachmentMeta?> encryptAndUploadAttachment({
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

  // Base64-encode before zeroing -- the returned meta.key string is an
  // immutable Dart String that can never be wiped the way this raw
  // buffer can, so it's the one copy of this key that just has to be
  // trusted to the GC eventually. Zeroing the buffer afterward is still
  // real: it's the copy that would otherwise sit at whatever address
  // SecretKeyData.random allocated it at for the rest of this isolate's
  // life.
  final result = EncryptedAttachmentMeta(
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
/// envelope. Throws on any failure -- same fail-closed rule as the rest
/// of this app's crypto: a corrupted or tampered attachment must surface
/// as an error, never as garbage bytes rendered to the UI.
Future<Uint8List> downloadAndDecryptAttachment(EncryptedAttachmentMeta meta) async {
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
