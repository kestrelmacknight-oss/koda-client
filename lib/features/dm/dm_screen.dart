// lib/features/dm/dm_screen.dart
//
// Direct messages: a two-panel layout (conversation list | chat) matching
// the same overall visual pattern as the main home screen. Opening a new
// DM requires knowing the other person's username -- for Alpha, this is
// a simple username-entry dialog rather than a friend-picker (friends
// feature is planned separately).

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../core/api.dart';
import '../../core/theme.dart';
import '../../core/providers.dart';
import '../../shared/widgets.dart';

class DmScreen extends ConsumerStatefulWidget {
  const DmScreen({super.key});
  @override
  ConsumerState<DmScreen> createState() => _DmScreenState();
}

class _DmScreenState extends ConsumerState<DmScreen> {
  List<Map<String, dynamic>> _conversations = [];
  Map<String, dynamic>? _activeConversation;
  List<Map<String, dynamic>> _messages = [];
  bool _loadingConvos = true;
  bool _loadingMessages = false;
  final _msgCtrl = TextEditingController();
  final _scroll = ScrollController();

  @override
  void initState() {
    super.initState();
    _loadConversations();
  }

  @override
  void dispose() {
    _msgCtrl.dispose();
    _scroll.dispose();
    super.dispose();
  }

  Future<void> _loadConversations() async {
    setState(() => _loadingConvos = true);
    final convos = await KodaApi.instance.getDmConversations();
    if (!mounted) return;
    setState(() {
      _conversations = convos;
      _loadingConvos = false;
    });
  }

  Future<void> _selectConversation(Map<String, dynamic> convo) async {
    setState(() {
      _activeConversation = convo;
      _loadingMessages = true;
      _messages = [];
    });
    final msgs = await KodaApi.instance.getDmMessages(convo['id'] as String);
    if (!mounted) return;
    final stillActive = _activeConversation?['id'] == convo['id'];
    if (!stillActive) return;
    setState(() {
      _messages = msgs.reversed.toList();
      _loadingMessages = false;
    });
    _scrollToBottom();
  }

  Future<void> _sendMessage() async {
    final convo = _activeConversation;
    final text = _msgCtrl.text.trim();
    if (convo == null || text.isEmpty) return;
    _msgCtrl.clear();

    final msg = await KodaApi.instance.sendDmMessage(convo['id'] as String, text);
    if (msg != null && mounted) {
      setState(() => _messages.add(msg));
      _scrollToBottom();
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scroll.hasClients) {
        _scroll.animateTo(_scroll.position.maxScrollExtent,
            duration: const Duration(milliseconds: 200), curve: Curves.easeOut);
      }
    });
  }

  Future<void> _showNewDmDialog() async {
    // For Alpha: look up a user by username via the members list of any
    // mutual server -- a full user search endpoint is on the roadmap.
    // For now, we open a conversation directly by user ID if the caller
    // already has one, or fall back to a plain username-entry dialog
    // where the user types the exact username they want to DM.
    final ctrl = TextEditingController();
    final username = await showDialog<String>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: const Text('New Message', style: TextStyle(color: KodaColors.text1)),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          const Text('Enter the exact username to message:',
              style: TextStyle(color: KodaColors.text3, fontSize: 12)),
          const SizedBox(height: 10),
          KodaTextField(controller: ctrl, hintText: 'Username'),
        ]),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          TextButton(
            onPressed: () => Navigator.pop(context, ctrl.text.trim()),
            child: const Text('Open'),
          ),
        ],
      ),
    );

    if (username == null || username.isEmpty) return;

    // Find this user in the members of any server we're in --
    // a proper user-search endpoint will replace this in future.
    final server = ref.read(selectedServerProvider);
    if (server == null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Select a server first so we can find that user.')));
      }
      return;
    }

    final members = await KodaApi.instance.getMembers(server['id'] as String);
    final match = members.where((m) =>
        (m['username'] as String?)?.toLowerCase() == username.toLowerCase()).firstOrNull;

    if (match == null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Could not find "$username" in this server.')));
      }
      return;
    }

    final convId = await KodaApi.instance.openDmConversation(match['user_id'] as String);
    if (convId == null || !mounted) return;

    await _loadConversations();

    final newConvo = _conversations.firstWhere(
        (c) => c['id'] == convId,
        orElse: () => {'id': convId, 'user': match});
    _selectConversation(newConvo);
  }

  String _formatTime(dynamic raw) {
    if (raw == null) return '';
    try {
      DateTime dt;
      if (raw is int) {
        dt = DateTime.fromMillisecondsSinceEpoch(raw, isUtc: true).toLocal();
      } else {
        final asInt = int.tryParse(raw.toString());
        dt = asInt != null
            ? DateTime.fromMillisecondsSinceEpoch(asInt, isUtc: true).toLocal()
            : DateTime.parse(raw.toString()).toLocal();
      }
      return DateFormat('MMM d, yyyy h:mm a').format(dt);
    } catch (_) { return ''; }
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      // ── Conversation list ─────────────────────────────────────────
      Container(
        width: 240,
        color: KodaColors.card,
        child: Column(children: [
          Container(
            height: 52,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: KodaColors.border))),
            child: Row(children: [
              const Expanded(
                child: Text('Direct Messages',
                    style: TextStyle(color: KodaColors.text1,
                        fontSize: 13, fontWeight: FontWeight.w700)),
              ),
              IconButton(
                icon: const Icon(Icons.edit_outlined, size: 16, color: KodaColors.text3),
                tooltip: 'New Message',
                onPressed: _showNewDmDialog,
              ),
            ]),
          ),
          Expanded(
            child: _loadingConvos
                ? const Center(child: CircularProgressIndicator(
                    color: KodaColors.koda, strokeWidth: 2))
                : _conversations.isEmpty
                    ? const Center(child: Text('No conversations yet',
                        style: TextStyle(color: KodaColors.text3, fontSize: 12)))
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        itemCount: _conversations.length,
                        itemBuilder: (_, i) {
                          final c = _conversations[i];
                          final user = c['user'] as Map<String, dynamic>? ?? {};
                          final username = user['username'] as String? ?? '?';
                          final active = _activeConversation?['id'] == c['id'];
                          return ListTile(
                            dense: true,
                            selected: active,
                            selectedTileColor: KodaColors.koda.withOpacity(0.1),
                            leading: KodaAvatar(username: username, size: 32),
                            title: Text(username,
                                style: TextStyle(
                                    color: active ? KodaColors.text1 : KodaColors.text2,
                                    fontSize: 13)),
                            onTap: () => _selectConversation(c),
                          );
                        },
                      ),
          ),
        ]),
      ),

      // ── Chat area ─────────────────────────────────────────────────
      Expanded(
        child: _activeConversation == null
            ? const Center(child: Text('Select a conversation',
                style: TextStyle(color: KodaColors.text3)))
            : Column(children: [
                Container(
                  height: 52,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: KodaColors.border))),
                  child: Row(children: [
                    KodaAvatar(
                      username: (_activeConversation!['user']
                              as Map<String, dynamic>?)?['username'] as String? ?? '?',
                      size: 28,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      (_activeConversation!['user']
                              as Map<String, dynamic>?)?['username'] as String? ?? '',
                      style: const TextStyle(color: KodaColors.text1,
                          fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ]),
                ),
                Expanded(
                  child: _loadingMessages
                      ? const Center(child: CircularProgressIndicator(
                          color: KodaColors.koda, strokeWidth: 2))
                      : _messages.isEmpty
                          ? const Center(child: Text('No messages yet',
                              style: TextStyle(color: KodaColors.text3)))
                          : ListView.builder(
                              controller: _scroll,
                              padding: const EdgeInsets.all(16),
                              itemCount: _messages.length,
                              itemBuilder: (_, i) {
                                final m = _messages[i];
                                final author =
                                    (m['author'] as Map<String, dynamic>?)?['username'] as String?
                                    ?? (m['sender_id'] as String?)?.substring(0, 6)
                                    ?? 'Unknown';
                                final time = _formatTime(m['inserted_at']);
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                    KodaAvatar(
                                      username: author,
                                     size: 34,
                                      avatarUrl: (m['author'] as Map<String, dynamic>?)?['avatar_url'] as String?,
                                      ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.baseline,
                                          textBaseline: TextBaseline.alphabetic,
                                          children: [
                                            Text(author,
                                                style: const TextStyle(
                                                    color: KodaColors.koda,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600)),
                                            if (time.isNotEmpty) ...[
                                              const SizedBox(width: 6),
                                              Text(time,
                                                  style: const TextStyle(
                                                      color: KodaColors.text3, fontSize: 11)),
                                            ],
                                          ],
                                        ),
                                        const SizedBox(height: 2),
                                        Text(m['content'] as String? ?? '',
                                            style: const TextStyle(
                                                color: KodaColors.text1, fontSize: 14)),
                                      ]),
                                    ),
                                  ]),
                                );
                              },
                            ),
                ),
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: Row(children: [
                    Expanded(
                      child: KodaTextField(
                        controller: _msgCtrl,
                        onSubmitted: (_) => _sendMessage(),
                    hintText: 'Message @${(_activeConversation!['user'] as Map<String, dynamic>?)?['username'] ?? ''}',
                      ),
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      icon: const Icon(Icons.send, color: KodaColors.koda),
                      onPressed: _sendMessage,
                    ),
                  ]),
                ),
              ]),
      ),
    ]);
  }
}


