// lib/core/message_utils.dart
//
// Shared helpers for working with message maps as they come back from
// the API (decrypting the ones marked encrypted: true).

import 'kcp_bridge.dart';

Future<List<Map<String, dynamic>>> decryptMessages(
    List<Map<String, dynamic>> msgs) async {
  final result = <Map<String, dynamic>>[];
  for (final m in msgs) {
    if (m['encrypted'] == true || m['encrypted'] == 'true') {
      try {
        final plain = await kcpDecrypt(
          channelId: m['channel_id'] as String? ?? '',
          payload:   m['content']   as String? ?? '',
          ratchetKey: m['ratchet_key'] as String? ?? '',
          msgNumber:  (m['msg_number'] as num?)?.toInt() ?? 0,
          prevChain:  (m['prev_chain'] as num?)?.toInt() ?? 0,
          nonce:      m['nonce'] as String? ?? '',
        );
        result.add({...m, 'content': plain});
      } catch (_) {
        result.add(m); // fallback: show raw
      }
    } else {
      result.add(m);
    }
  }
  return result;
}
