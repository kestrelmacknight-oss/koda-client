// lib/core/message_utils.dart
//
// Shared helpers for working with channel message maps as they come
// back from the API.
//
// Channel messages are now genuinely end-to-end encrypted with a
// shared per-channel key (see crypto/channel_key_manager.dart) -- a
// message with a non-null `epoch` is real AES-256-GCM ciphertext, keyed
// by whichever epoch of that channel's key it was sent under. A message
// with `encrypted: true` but no `epoch` predates that work (the old
// demo bridge that base64-"encrypted" everything, never real
// cryptography) and is just base64-decoded to stay readable.

import 'dart:convert';
import 'secure_storage.dart';
import 'crypto/channel_key_manager.dart';

Future<List<Map<String, dynamic>>> decryptMessages(
    List<Map<String, dynamic>> msgs,
    {required String channelId, required String myUserId}) async {
  final out = <Map<String, dynamic>>[];

  for (final m in msgs) {
    final isEncrypted = m['encrypted'] == true || m['encrypted'] == 'true';
    if (!isEncrypted) {
      out.add(m);
      continue;
    }

    final epoch = m['epoch'] as int?;
    if (epoch == null) {
      // Legacy pre-existing row from before real channel encryption.
      final raw = m['content'] as String? ?? '';
      try {
        final padded = raw.padRight((raw.length + 3) ~/ 4 * 4, '=');
        out.add({...m, 'content': utf8.decode(base64Decode(padded))});
      } catch (_) {
        out.add(m); // not legacy-decodable -- show as-is rather than crash
      }
      continue;
    }

    final messageId = m['id'] as String?;
    final cached = messageId != null
        ? await SecureStorage.getCachedDecryptedContent(messageId)
        : null;
    if (cached != null) {
      out.add({...m, 'content': cached});
      continue;
    }

    final content = m['content'] as String?;
    final nonce = m['nonce'] as String?;
    if (content == null || nonce == null) {
      out.add({...m, 'content': '', '_decryptFailed': true});
      continue;
    }

    final plaintext = await ChannelKeyManager.instance
        .decryptForChannel(channelId, epoch, content, nonce, myUserId: myUserId);
    if (plaintext == null) {
      // Either the key hasn't reached this device yet, or the
      // ciphertext failed to authenticate -- both surface the same way
      // here; the channel view retries on next sync rather than ever
      // falling back to showing something unverified.
      out.add({...m, 'content': '', '_decryptPending': true});
      continue;
    }

    if (messageId != null) await SecureStorage.cacheDecryptedContent(messageId, plaintext);
    out.add({...m, 'content': plaintext});
  }

  return out;
}
