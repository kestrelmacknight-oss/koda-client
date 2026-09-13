// lib/core/message_utils.dart
//
// Shared helpers for working with channel message maps as they come
// back from the API.
//
// Channel messages are no longer sent through any encryption pretense
// (see home_screen.dart / the "real E2EE" work this pairs with) --
// group encryption needs a materially different protocol (Sender Keys)
// than the pairwise Double Ratchet DMs use, and hasn't been built yet.
// New channel messages always send encrypted: false. This function only
// exists to keep pre-existing rows in the database (from when the demo
// bridge base64-"encrypted" everything) readable rather than showing
// raw base64 -- it was never real cryptography, so there's nothing
// real to undo here, just a legacy encoding to strip.

import 'dart:convert';

Future<List<Map<String, dynamic>>> decryptMessages(
    List<Map<String, dynamic>> msgs) async {
  return msgs.map((m) {
    if (m['encrypted'] != true && m['encrypted'] != 'true') return m;
    final raw = m['content'] as String? ?? '';
    try {
      final padded = raw.padRight((raw.length + 3) ~/ 4 * 4, '=');
      return {...m, 'content': utf8.decode(base64Decode(padded))};
    } catch (_) {
      return m; // not legacy-decodable -- show as-is rather than crash
    }
  }).toList();
}
