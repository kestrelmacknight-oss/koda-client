// lib/features/dm/dm_screen.dart
//
// Direct messages with three tabs: All (conversations), Friends, Requests.

import 'dart:async';
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

class _DmScreenState extends ConsumerState<DmScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabs;

  // All tab
  List<Map<String, dynamic>> _conversations = [];
  Map<String, dynamic>? _activeConversation;
  List<Map<String, dynamic>> _messages = [];
  bool _loadingConvos = true;
  bool _loadingMessages = false;
  final _msgCtrl = TextEditingController();
  final _scroll = ScrollController();

  // Friends tab
  List<Map<String, dynamic>> _friends = [];
  bool _loadingFriends = true;

  // Requests tab
  List<Map<String, dynamic>> _receivedRequests = [];
  List<Map<String, dynamic>> _sentRequests = [];
  bool _loadingRequests = true;

  @override
  void initState() {
    super.initState();
    _tabs = TabController(length: 3, vsync: this);
    _tabs.addListener(() {
      if (!_tabs.indexIsChanging) {
        if (_tabs.index == 1) _loadFriends();
        if (_tabs.index == 2) _loadRequests();
      }
    });
    _loadConversations();
  }

  @override
  void dispose() {
    _tabs.dispose();
    _msgCtrl.dispose();
    _scroll.dispose();
    super.dispose();
  }

  Future<void> _loadConversations() async {
    setState(() => _loadingConvos = true);
    final convos = await KodaApi.instance.getConversations();
    if (!mounted) return;
    setState(() { _conversations = convos; _loadingConvos = false; });
  }

  Future<void> _loadFriends() async {
    setState(() => _loadingFriends = true);
    final friends = await KodaApi.instance.getFriends();
    if (!mounted) return;
    setState(() { _friends = friends; _loadingFriends = false; });
  }

  Future<void> _loadRequests() async {
    setState(() => _loadingRequests = true);
    final data = await KodaApi.instance.getFriendRequests();
    if (!mounted) return;
    setState(() {
      _receivedRequests = List<Map<String, dynamic>>.from(
          data?['received'] ?? []);
      _sentRequests = List<Map<String, dynamic>>.from(
          data?['sent'] ?? []);
      _loadingRequests = false;
    });
  }

  Future<void> _openConversation(Map<String, dynamic> convo) async {
    setState(() { _activeConversation = convo; _loadingMessages = true; });
    final msgs = await KodaApi.instance.getDmMessages(convo['id']);
    if (!mounted) return;
    setState(() { _messages = msgs.reversed.toList(); _loadingMessages = false; });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scroll.hasClients) {
        _scroll.jumpTo(_scroll.position.maxScrollExtent);
      }
    });
  }

  Future<void> _sendMessage() async {
    final convo = _activeConversation;
    final text = _msgCtrl.text.trim();
    if (convo == null || text.isEmpty) return;
    _msgCtrl.clear();
    final msg = await KodaApi.instance.sendDmMessage(convo['id'], text);
    if (msg != null && mounted) {
      setState(() => _messages.add(msg));
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scroll.hasClients) {
          _scroll.animateTo(_scroll.position.maxScrollExtent,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut);
        }
      });
    }
  }

  Future<void> _startDm(Map<String, dynamic> friend) async {
    final userId = friend['id'] as String;
    final convo = await KodaApi.instance.getOrCreateConversation(userId);
    if (convo != null && mounted) {
      _tabs.animateTo(0);
      await _loadConversations();
      await _openConversation(convo);
    }
  }

  Future<void> _acceptRequest(Map<String, dynamic> req) async {
    final userId = req['user']['id'] as String;
    final ok = await KodaApi.instance.acceptFriendRequest(userId);
    if (ok && mounted) _loadRequests();
  }

  Future<void> _declineRequest(Map<String, dynamic> req) async {
    final userId = req['user']['id'] as String;
    final ok = await KodaApi.instance.declineFriendRequest(userId);
    if (ok && mounted) _loadRequests();
  }

  String _formatTime(dynamic raw) {
    if (raw == null) return '';
    try {
      final dt = DateTime.parse(raw.toString()).toLocal();
      return DateFormat('h:mm a').format(dt);
    } catch (_) { return ''; }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KodaColors.voidBg,
      appBar: AppBar(
        backgroundColor: KodaColors.bg2,
        title: const Text('Messages',
            style: TextStyle(color: KodaColors.text1, fontSize: 16,
                fontWeight: FontWeight.w700)),
        bottom: TabBar(
          controller: _tabs,
          indicatorColor: KodaColors.koda,
          labelColor: KodaColors.text1,
          unselectedLabelColor: KodaColors.text3,
          tabs: const [
            Tab(text: 'All'),
            Tab(text: 'Friends'),
            Tab(text: 'Requests'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabs,
        children: [
          _buildAllTab(),
          _buildFriendsTab(),
          _buildRequestsTab(),
        ],
      ),
    );
  }

  // ── All (conversations) ───────────────────────────────────────────────────

  Widget _buildAllTab() {
    return Row(children: [
      // Conversation list
      Container(
        width: 260,
        color: KodaColors.bg2,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: KodaColors.koda,
                foregroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 36),
              ),
              onPressed: _showNewDmDialog,
              icon: const Icon(Icons.add, size: 16),
              label: const Text('New Message'),
            ),
          ),
          Expanded(
            child: _loadingConvos
                ? const Center(child: CircularProgressIndicator(
                    color: KodaColors.koda))
                : _conversations.isEmpty
                    ? const Center(child: Text('No conversations yet',
                        style: TextStyle(color: KodaColors.text3,
                            fontSize: 13)))
                    : ListView.builder(
                        itemCount: _conversations.length,
                        itemBuilder: (_, i) {
                          final c = _conversations[i];
                          final other = c['other_user'] as Map<String, dynamic>?;
                          final name = other?['username'] as String? ?? 'Unknown';
                          final active = _activeConversation?['id'] == c['id'];
                          return ListTile(
                            selected: active,
                            selectedTileColor: KodaColors.koda.withOpacity(0.1),
                            leading: KodaAvatar(username: name, size: 32,
                                avatarUrl: other?['avatar_url'] as String?),
                            title: Text(name,
                                style: const TextStyle(
                                    color: KodaColors.text1, fontSize: 13)),
                            onTap: () => _openConversation(c),
                          );
                        },
                      ),
          ),
        ]),
      ),

      // Chat area
      Expanded(
        child: _activeConversation == null
            ? const Center(child: Text('Select a conversation',
                style: TextStyle(color: KodaColors.text3)))
            : _buildChatArea(),
      ),
    ]);
  }

  Widget _buildChatArea() {
    return Column(children: [
      // Messages
      Expanded(
        child: _loadingMessages
            ? const Center(child: CircularProgressIndicator(
                color: KodaColors.koda))
            : ListView.builder(
                controller: _scroll,
                padding: const EdgeInsets.all(16),
                itemCount: _messages.length,
                itemBuilder: (_, i) {
                  final m = _messages[i];
                  final me = ref.read(authProvider).user;
                  final isMe = m['sender_id'] == me?.id;
                  final author = (m['author'] as Map<String, dynamic>?)?
                      ['username'] as String? ?? 'Unknown';
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (!isMe) ...[
                          KodaAvatar(username: author, size: 32),
                          const SizedBox(width: 8),
                        ],
                        Expanded(
                          child: Column(
                            crossAxisAlignment: isMe
                                ? CrossAxisAlignment.end
                                : CrossAxisAlignment.start,
                            children: [
                              if (!isMe)
                                Text(author,
                                    style: const TextStyle(
                                        color: KodaColors.koda,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600)),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                decoration: BoxDecoration(
                                  color: isMe
                                      ? KodaColors.koda.withOpacity(0.2)
                                      : KodaColors.card,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  m['content'] as String? ?? '',
                                  style: const TextStyle(
                                      color: KodaColors.text1,
                                      fontSize: 13),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (isMe) const SizedBox(width: 8),
                      ],
                    ),
                  );
                },
              ),
      ),

      // Input
      Padding(
        padding: const EdgeInsets.all(14),
        child: Row(children: [
          Expanded(
            child: KodaTextField(
              controller: _msgCtrl,
              hintText: 'Message...',
              onSubmitted: (_) => _sendMessage(),
            ),
          ),
          const SizedBox(width: 10),
          IconButton(
            icon: const Icon(Icons.send, color: KodaColors.koda),
            onPressed: _sendMessage,
          ),
        ]),
      ),
    ]);
  }

  // ── Friends tab ───────────────────────────────────────────────────────────

  Widget _buildFriendsTab() {
    if (_loadingFriends) {
      return const Center(child: CircularProgressIndicator(
          color: KodaColors.koda));
    }
    if (_friends.isEmpty) {
      return const Center(child: Text('No friends yet.\nSend a friend request to get started.',
          textAlign: TextAlign.center,
          style: TextStyle(color: KodaColors.text3, fontSize: 13)));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _friends.length,
      itemBuilder: (_, i) {
        final f = _friends[i];
        final name = f['username'] as String? ?? 'Unknown';
        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            color: KodaColors.card,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: KodaColors.border),
          ),
          child: ListTile(
            leading: KodaAvatar(username: name, size: 36,
                avatarUrl: f['avatar_url'] as String?),
            title: Text(name,
                style: const TextStyle(color: KodaColors.text1,
                    fontWeight: FontWeight.w500)),
            trailing: Row(mainAxisSize: MainAxisSize.min, children: [
              IconButton(
                icon: const Icon(Icons.message_outlined,
                    color: KodaColors.koda, size: 18),
                tooltip: 'Send message',
                onPressed: () => _startDm(f),
              ),
              IconButton(
                icon: const Icon(Icons.person_remove_outlined,
                    color: KodaColors.text3, size: 18),
                tooltip: 'Unfriend',
                onPressed: () async {
                  final ok = await KodaApi.instance.unfriend(
                      f['id'] as String);
                  if (ok && mounted) _loadFriends();
                },
              ),
            ]),
          ),
        );
      },
    );
  }

  // ── Requests tab ──────────────────────────────────────────────────────────

  Widget _buildRequestsTab() {
    if (_loadingRequests) {
      return const Center(child: CircularProgressIndicator(
          color: KodaColors.koda));
    }
    if (_receivedRequests.isEmpty && _sentRequests.isEmpty) {
      return const Center(child: Text('No pending friend requests.',
          style: TextStyle(color: KodaColors.text3, fontSize: 13)));
    }
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        if (_receivedRequests.isNotEmpty) ...[
          const Text('INCOMING', style: TextStyle(color: KodaColors.text3,
              fontSize: 11, fontWeight: FontWeight.w700,
              letterSpacing: 0.8)),
          const SizedBox(height: 8),
          ..._receivedRequests.map((req) {
            final user = req['user'] as Map<String, dynamic>?;
            final name = user?['username'] as String? ?? 'Unknown';
            final msg = req['message'] as String?;
            return Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: KodaColors.card,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: KodaColors.border),
              ),
              child: Row(children: [
                KodaAvatar(username: name, size: 36,
                    avatarUrl: user?['avatar_url'] as String?),
                const SizedBox(width: 10),
                Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text(name, style: const TextStyle(
                      color: KodaColors.text1, fontWeight: FontWeight.w500)),
                  if (msg != null && msg.isNotEmpty)
                    Text(msg, style: const TextStyle(
                        color: KodaColors.text3, fontSize: 12)),
                ])),
                IconButton(
                  icon: const Icon(Icons.check_circle_outline,
                      color: KodaColors.koda, size: 22),
                  tooltip: 'Accept',
                  onPressed: () => _acceptRequest(req),
                ),
                IconButton(
                  icon: const Icon(Icons.cancel_outlined,
                      color: KodaColors.accent, size: 22),
                  tooltip: 'Decline',
                  onPressed: () => _declineRequest(req),
                ),
              ]),
            );
          }),
          const SizedBox(height: 16),
        ],
        if (_sentRequests.isNotEmpty) ...[
          const Text('SENT', style: TextStyle(color: KodaColors.text3,
              fontSize: 11, fontWeight: FontWeight.w700,
              letterSpacing: 0.8)),
          const SizedBox(height: 8),
          ..._sentRequests.map((req) {
            final user = req['user'] as Map<String, dynamic>?;
            final name = user?['username'] as String? ?? 'Unknown';
            return Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.symmetric(
                  horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: KodaColors.card,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: KodaColors.border),
              ),
              child: Row(children: [
                KodaAvatar(username: name, size: 36,
                    avatarUrl: user?['avatar_url'] as String?),
                const SizedBox(width: 10),
                Expanded(child: Text(name, style: const TextStyle(
                    color: KodaColors.text1, fontWeight: FontWeight.w500))),
                const Text('Pending', style: TextStyle(
                    color: KodaColors.text3, fontSize: 12)),
              ]),
            );
          }),
        ],
      ],
    );
  }

  // ── New DM dialog ─────────────────────────────────────────────────────────

  Future<void> _showNewDmDialog() async {
    final ctrl = TextEditingController();
    final username = await showDialog<String>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: const Text('New Message',
            style: TextStyle(color: KodaColors.text1)),
        content: KodaTextField(controller: ctrl,
            hintText: 'Enter username'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context),
              child: const Text('Cancel')),
          TextButton(onPressed: () => Navigator.pop(context,
              ctrl.text.trim()), child: const Text('Open')),
        ],
      ),
    );
    if (username == null || username.isEmpty) return;
    final user = await KodaApi.instance.getUserByUsername(username);
    if (user == null || !mounted) return;
    final convo = await KodaApi.instance.getOrCreateConversation(
        user['id'] as String);
    if (convo != null && mounted) {
      await _loadConversations();
      await _openConversation(convo);
    }
  }
}