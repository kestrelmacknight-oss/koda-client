// lib/core/crypto/channel_epoch.dart
//
// Channel group encryption: a shared symmetric "epoch key" per channel,
// used directly with AES-256-GCM by every member for every message sent
// in the current epoch. Deliberately simpler than DMs' per-pair Double
// Ratchet -- there is no per-sender chain state, just "the current
// epoch's key." See koda-server's Koda.ChannelCrypto for the epoch
// registry and per-recipient delivery bookkeeping this relies on, and
// channel_key_manager.dart for the sync/bootstrap/rotate orchestration
// built on top of this module.
//
// Security properties: real confidentiality against the server (which
// only ever sees per-recipient ciphertext of the key itself, delivered
// over each recipient's existing DM ratchet -- never the key in the
// clear) and real removal security at epoch boundaries (a departed
// member never receives the next epoch's key). What this does *not*
// give you is per-sender forward secrecy within a single epoch -- if an
// epoch's key is ever compromised, every message sent under it is
// readable. That tradeoff was a deliberate choice over full Sender Keys
// for how much simpler this is to build and reason about correctly.

import 'dart:convert';
import 'dart:typed_data';
import 'kcp_primitives.dart';

const int channelEpochKeyLength = 32; // AES-256

/// A fresh random epoch key. Every bit independent of any other epoch's
/// key or any user's identity/session keys -- compromising one epoch
/// reveals nothing about any other.
Future<Uint8List> generateChannelEpochKey() async {
  return randomBytes(channelEpochKeyLength);
}

class EncryptedChannelMessage {
  final String content; // base64 ciphertext, goes in the message's `content` field
  final String nonce;
  const EncryptedChannelMessage({required this.content, required this.nonce});
}

/// Encrypts [plaintext] with the given epoch key. [channelId] and
/// [epoch] are bound in as AAD so a ciphertext can't be replayed as if
/// it belonged to a different channel or a different epoch of the same
/// channel even though nothing about the key itself would stop that.
Future<EncryptedChannelMessage> encryptChannelMessage({
  required Uint8List epochKey,
  required String channelId,
  required int epoch,
  required String plaintext,
}) async {
  final nonce = randomNonce();
  final payload = await aesGcmEncrypt(
    key: epochKey,
    nonce: nonce,
    plaintext: utf8.encode(plaintext),
    aad: utf8.encode('$channelId:$epoch'),
  );
  return EncryptedChannelMessage(content: bytesToB64(payload), nonce: bytesToB64(nonce));
}

/// Inverse of [encryptChannelMessage]. Throws if authentication fails
/// (tampered ciphertext, wrong key/epoch, or content forged for a
/// different channel) -- callers must surface this as "unable to
/// decrypt," never fall back to displaying anything.
Future<String> decryptChannelMessage({
  required Uint8List epochKey,
  required String channelId,
  required int epoch,
  required String content,
  required String nonce,
}) async {
  final plaintext = await aesGcmDecrypt(
    key: epochKey,
    nonce: b64ToBytes(nonce),
    payload: b64ToBytes(content),
    aad: utf8.encode('$channelId:$epoch'),
  );
  return utf8.decode(plaintext);
}
