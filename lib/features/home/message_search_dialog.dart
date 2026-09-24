// lib/features/home/message_search_dialog.dart
//
// Client-side search over channel message history. Content is real
// end-to-end ciphertext (see core/crypto/channel_key_manager.dart) so
// the server can't run a meaningful full-text search over it -- this
// pages backward through history, decrypts each batch the same way the
// chat view does, and matches locally. Bounded per run so a search
// can't page through a channel's entire history in one go.

import 'package:flutter/material.dart';
import '../../core/api.dart';
import '../../core/message_utils.dart';
import '../../core/theme.dart';
import '../../shared/widgets.dart';

class MessageSearchResult {
  final Map<String, dynamic> message;
  // The contiguous, already-decrypted page this result was found in --
  // handed back to the caller so "jump to message" has real surrounding
  // context without another round trip.
  final List<Map<String, dynamic>> context;
  const MessageSearchResult({required this.message, required this.context});
}

class MessageSearchDialog extends StatefulWidget {
  final String channelId;
  final String myUserId;
  const MessageSearchDialog({super.key, required this.channelId, required this.myUserId});
  @override
  State<MessageSearchDialog> createState() => _MessageSearchDialogState();
}

class _MessageSearchDialogState extends State<MessageSearchDialog> {
  static const _maxPagesPerRun = 15;
  static const _maxResultsPerRun = 30;

  final _queryCtrl = TextEditingController();
  final List<Map<String, dynamic>> _results = [];
  final Map<String, List<Map<String, dynamic>>> _resultContext = {};
  String? _cursor;
  bool _searching = false;
  bool _reachedStart = false;
  bool _hasSearched = false;

  Future<void> _search() async {
    final query = _queryCtrl.text.trim().toLowerCase();
    if (query.isEmpty) return;
    setState(() {
      _results.clear();
      _resultContext.clear();
      _cursor = null;
      _reachedStart = false;
      _hasSearched = true;
      _searching = true;
    });
    await _scan(query);
  }

  Future<void> _searchMore() async {
    final query = _queryCtrl.text.trim().toLowerCase();
    if (query.isEmpty || _searching || _reachedStart) return;
    setState(() => _searching = true);
    await _scan(query);
  }

  Future<void> _scan(String query) async {
    var cursor = _cursor;
    var reachedStart = _reachedStart;
    var pages = 0;
    final newResults = <Map<String, dynamic>>[];

    while (pages < _maxPagesPerRun && newResults.length < _maxResultsPerRun) {
      final batch = await KodaApi.instance.getMessages(widget.channelId, beforeId: cursor);
      if (batch.isEmpty) { reachedStart = true; break; }

      final decrypted = await decryptMessages(batch,
          channelId: widget.channelId, myUserId: widget.myUserId);
      final ascending = decrypted.reversed.toList();
      for (final m in decrypted) {
        final content = (m['content'] as String? ?? '').toLowerCase();
        if (content.isNotEmpty && content.contains(query)) {
          newResults.add(m);
          _resultContext[m['id'] as String] = ascending;
        }
      }

      cursor = decrypted.last['id'] as String?;
      pages++;
      if (decrypted.length < 50) { reachedStart = true; break; }
    }

    if (!mounted) return;
    setState(() {
      _results.addAll(newResults);
      _cursor = cursor;
      _reachedStart = reachedStart;
      _searching = false;
    });
  }

  @override
  void dispose() {
    _queryCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: KodaColors.card,
      child: SizedBox(
        width: 440,
        height: 520,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(children: [
              Expanded(
                child: KodaTextField(
                  controller: _queryCtrl,
                  hintText: 'Search this channel...',
                  onSubmitted: (_) => _search(),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                icon: Icon(Icons.search, color: KodaColors.koda),
                tooltip: 'Search',
                onPressed: _searching ? null : _search,
              ),
            ]),
          ),
          Divider(color: KodaColors.border, height: 1),
          Expanded(
            child: !_hasSearched
                ? Center(child: Text('Searches messages already loaded on this device -- '
                    'older history gets fetched (and decrypted locally) as you scan further back.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: KodaColors.text3, fontSize: 12)))
                : _results.isEmpty && !_searching
                    ? Center(child: Text('No matches',
                        style: TextStyle(color: KodaColors.text3)))
                    : ListView.builder(
                        padding: const EdgeInsets.all(12),
                        itemCount: _results.length + 1,
                        itemBuilder: (_, i) {
                          if (i == _results.length) {
                            if (_searching) {
                              return Padding(
                                padding: EdgeInsets.all(16),
                                child: Center(child: CircularProgressIndicator(
                                    strokeWidth: 2, color: KodaColors.koda)),
                              );
                            }
                            if (_reachedStart) {
                              return Padding(
                                padding: EdgeInsets.all(16),
                                child: Center(child: Text('Start of channel history',
                                    style: TextStyle(color: KodaColors.text3, fontSize: 11))),
                              );
                            }
                            return Padding(
                              padding: const EdgeInsets.all(8),
                              child: TextButton(
                                onPressed: _searchMore,
                                child: const Text('Search further back'),
                              ),
                            );
                          }
                          final m = _results[i];
                          final author = (m['author'] as Map<String, dynamic>?)?['username']
                              as String? ?? 'Unknown';
                          return ListTile(
                            dense: true,
                            title: Text(author, style: TextStyle(
                                color: KodaColors.koda, fontSize: 12, fontWeight: FontWeight.w600)),
                            subtitle: Text(m['content'] as String? ?? '',
                                style: TextStyle(color: KodaColors.text1, fontSize: 13),
                                maxLines: 2, overflow: TextOverflow.ellipsis),
                            onTap: () => Navigator.pop(
                              context,
                              MessageSearchResult(
                                message: m,
                                context: _resultContext[m['id']] ?? [m],
                              ),
                            ),
                          );
                        },
                      ),
          ),
        ]),
      ),
    );
  }
}
