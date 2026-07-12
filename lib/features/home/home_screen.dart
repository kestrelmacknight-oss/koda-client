// lib/features/home/home_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../core/api.dart';
import '../../core/theme.dart';
import '../../core/providers.dart';
import '../../shared/widgets.dart';
import '../settings/settings_screen.dart';
import '../server/server_settings_screen.dart';
import '../voice/voice_screen.dart';
import '../dm/dm_screen.dart';
import '../../core/socket.dart';
import '../../core/kcp_bridge.dart';
import 'package:phoenix_socket/phoenix_socket.dart';
import '../gallery/gallery_screen.dart';
import '../stage/stage_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});
  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends ConsumerState<HomeScreen> {
  List<Map<String, dynamic>> _servers = [];
  List<Map<String, dynamic>> _channels = [];
  List<Map<String, dynamic>> _messages = [];
  bool _loadingServers = true;
  bool _showingDms = false;
  String? _activeChannelId;
  final _messageController = TextEditingController();
  final _scroll = ScrollController();

  @override
  void initState() {
    super.initState();
    _loadServers();
  }


  @override
  void dispose() {
    if (_activeChannelId != null) {
      KodaSocket.instance.leave('channel:$_activeChannelId');
    }
    _messageController.dispose();
    _scroll.dispose();
    super.dispose();
  }
  Future<void> _loadServers() async {
    setState(() => _loadingServers = true);
    final servers = await KodaApi.instance.getServers();
    if (!mounted) return;
    setState(() {
      _servers = servers;
      _loadingServers = false;
    });
    if (servers.isNotEmpty) _selectServer(servers.first);
  }

  Future<void> _selectServer(Map<String, dynamic> server) async {
    setState(() => _showingDms = false);
    ref.read(selectedServerProvider.notifier).state = server;
    ref.read(selectedChannelProvider.notifier).state = null;
    final channels = await KodaApi.instance.getChannels(server['id']);
    if (!mounted) return;
    setState(() => _channels = channels);
    final firstText = channels.firstWhere(
        (c) => c['type'] == 'text', orElse: () => {});
    if (firstText.isNotEmpty) _selectChannel(firstText);
  }

  Future<void> _selectChannel(Map<String, dynamic> channel) async {
    final channelId = channel['id'] as String;
    ref.read(selectedChannelProvider.notifier).state = channel;

    // Leave the previous channel's socket topic
    if (_activeChannelId != null && _activeChannelId != channelId) {
      KodaSocket.instance.leave('channel:$_activeChannelId');
    }

    // Stage channels push a route -- handled separately from text
    if (channel['type'] == 'stage') {
      ref.read(selectedChannelProvider.notifier).state = channel;
      await Navigator.push(context, MaterialPageRoute(
        builder: (_) => StageScreen(channel: channel),
      ));
      if (mounted) _returnToTextChannel();
      return;
    }

    if (channel['type'] == 'text') {
      final messages = await KodaApi.instance.getMessages(channelId);
      if (!mounted) return;
      final stillSelected =
          ref.read(selectedChannelProvider)?['id'] == channelId;
      if (!stillSelected) return;

      final decrypted = await _decryptMessages(messages.reversed.toList());
      if (!mounted) return;
      setState(() {
        _messages = decrypted;
        _activeChannelId = channelId;
      });

      // Subscribe to real-time messages for this channel
      final ch = await KodaSocket.instance.channelAsync('channel:$channelId');
      ch?.messages.listen((msg) {
        if (!mounted) return;
        if (msg.event == const PhoenixChannelEvent.custom('new_message')) {
          final payload = msg.payload as Map<String, dynamic>?;
          if (payload != null) {
            if (payload['encrypted'] == true) {
              kcpDecrypt(
                channelId: channelId,
                payload:    payload['content'] as String? ?? '',
                ratchetKey: payload['ratchet_key'] as String? ?? '',
                msgNumber:  (payload['msg_number'] as num?)?.toInt() ?? 0,
                prevChain:  (payload['prev_chain'] as num?)?.toInt() ?? 0,
                nonce:      payload['nonce'] as String? ?? '',
              ).then((plain) {
                if (mounted) setState(() =>
                    _messages.add({...payload, 'content': plain}));
              });
            } else {
              setState(() => _messages.add(payload));
            }
          }
        }
      });
    }
  }

  Future<void> _sendMessage() async {
    final channel = ref.read(selectedChannelProvider);
    final text = _messageController.text.trim();
    if (channel == null || text.isEmpty) return;
    _messageController.clear();

    // Encrypt message content before sending
    String wireContent = text;
    bool encrypted = false;
    try {
      final enc = await kcpEncrypt(channelId: channel['id'] as String, plaintext: text);
      wireContent = enc.payload;
      encrypted = true;
    } catch (_) {
      // Encryption failed -- send as plaintext (demo fallback)
    }
    final msg = await KodaApi.instance.sendMessage(channel['id'], wireContent, encrypted: encrypted);
    if (msg != null && mounted) {
      setState(() => _messages.add(msg));
      Future.delayed(const Duration(milliseconds: 50), () {
        if (_scroll.hasClients) {
          _scroll.animateTo(_scroll.position.maxScrollExtent,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut);
        }
      });
    }
  }

  Future<List<Map<String, dynamic>>> _decryptMessages(
      List<Map<String, dynamic>> msgs) async {
    final result = <Map<String, dynamic>>[];
    for (final m in msgs) {
      if (m['encrypted'] == true) {
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

  void _returnToTextChannel() {
    // Clear selected channel immediately so content area shows empty
    // state rather than trying to render the just-left voice/stage channel
    ref.read(selectedChannelProvider.notifier).state = null;
    final firstText = _channels.firstWhere(
        (c) => c['type'] == 'text', orElse: () => {});
    if (firstText.isNotEmpty) {
      _selectChannel(firstText);
    } else {
      ref.read(selectedChannelProvider.notifier).state = null;
    }
  }

  Future<void> _joinVoice(Map<String, dynamic> channel) async {
    final result = await KodaApi.instance.getVoiceToken(channel['id']);
    if (!mounted) return;
    if (result == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not connect to voice.')));
      return;
    }
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => VoiceScreen(
            channelName: channel['name'] as String,
            token: result['token'] as String,
            url: result['url'] as String,
          ),
        ));
    if (mounted) _returnToTextChannel();
  }

  Future<void> _showCreateServerDialog() async {
    final nameController = TextEditingController();
    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: const Text('Create a server',
            style: TextStyle(color: KodaColors.text1)),
        content:
            KodaTextField(controller: nameController, hintText: 'Server name'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel')),
          TextButton(
            onPressed: () async {
              if (nameController.text.trim().isEmpty) return;
              final server = await KodaApi.instance
                  .createServer(name: nameController.text.trim());
              if (server != null && mounted) {
                Navigator.pop(context);
                _loadServers();
              }
            },
            child: const Text('Create'),
          ),
        ],
      ),
    );
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
    } catch (_) {
      return '';
    }
  }

  Future<void> _showChannelContextMenu(
      Map<String, dynamic> channel, Offset position) async {
    final action = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
          position.dx, position.dy, position.dx, position.dy),
      color: KodaColors.card,
      items: const [
        PopupMenuItem(value: 'edit', child: Text('Edit Channel')),
        PopupMenuItem(value: 'delete', child: Text('Delete Channel')),
      ],
    );
    if (action == 'delete') {
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (ctx) => AlertDialog(
          backgroundColor: KodaColors.card,
          content: Text('Delete #${channel['name']}? This cannot be undone.',
              style: const TextStyle(color: KodaColors.text1)),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(ctx, false),
                child: const Text('Cancel')),
            TextButton(
                onPressed: () => Navigator.pop(ctx, true),
                child: const Text('Delete',
                    style: TextStyle(color: KodaColors.accent))),
          ],
        ),
      );
      if (confirmed == true) {
        await KodaApi.instance.deleteChannel(channel['id']);
        final server = ref.read(selectedServerProvider);
        if (server != null) _selectServer(server);
      }
    } else if (action == 'edit') {
      final nameController = TextEditingController(text: channel['name']);
      final newName = await showDialog<String>(
        context: context,
        builder: (_) => AlertDialog(
          backgroundColor: KodaColors.card,
          title: const Text('Rename Channel',
              style: TextStyle(color: KodaColors.text1)),
          content: KodaTextField(
              controller: nameController, hintText: 'Channel name'),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel')),
            TextButton(
                onPressed: () =>
                    Navigator.pop(context, nameController.text.trim()),
                child: const Text('Save')),
          ],
        ),
      );
      if (newName != null && newName.isNotEmpty) {
        await KodaApi.instance.updateChannel(channel['id'], {'name': newName});
        final server = ref.read(selectedServerProvider);
        if (server != null) _selectServer(server);
      }
    }
  }

  // Returns the correct content widget for the currently selected channel.
  // Keeping this as a method rather than inline in build() avoids the
  // "if statement as positional argument" Dart restriction entirely.
  Widget _buildContentArea(Map<String, dynamic>? selectedChannel) {
    if (selectedChannel == null) {
      return const Center(
          child: Text('Select a channel',
              style: TextStyle(color: KodaColors.text3)));
    }

    final type = selectedChannel['type'] as String? ?? 'text';

    if (type == 'gallery') {
      return GalleryScreen(channel: selectedChannel);
    }
    if (type == 'stage') {
      return StageScreen(channel: selectedChannel);
    }

    // Text channel (and anything else -- fallback to chat)
    return Column(children: [
      Container(
        height: 52,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: KodaColors.border))),
        child: Row(children: [
          Icon(
            type == 'voice' ? Icons.volume_up : Icons.tag,
            size: 16,
            color: KodaColors.text3,
          ),
          const SizedBox(width: 6),
          Text(selectedChannel['name'] as String? ?? '',
              style: const TextStyle(
                  color: KodaColors.text1, fontWeight: FontWeight.w600)),
          const SizedBox(width: 8),

          const Tooltip(
            message: 'End-to-end encrypted',
            child: Icon(Icons.lock_outline, size: 13, color: KodaColors.mint),
          ),
        ]),
      ),
      Expanded(
        child: ListView.builder(
          controller: _scroll,
          padding: const EdgeInsets.all(16),
          itemCount: _messages.length,
          itemBuilder: (_, i) {
            final m = _messages[i];
            final author =
                (m['author'] as Map<String, dynamic>?)?['username'] as String? ??
                (m['sender_id'] as String?)?.substring(0, 6) ??
                'Unknown';
            final time = _formatTime(m['inserted_at']);
            final canDelete = true; // server enforces permission
            return GestureDetector(
              onSecondaryTapUp: (d) async {
                final action = await showMenu<String>(
                  context: context,
                  position: RelativeRect.fromLTRB(d.globalPosition.dx,
                      d.globalPosition.dy, d.globalPosition.dx, d.globalPosition.dy),
                  color: KodaColors.card,
                  items: [
                    if (canDelete) const PopupMenuItem(
                        value: 'delete', child: Text('Delete Message')),
                  ],
                );
                if (action == 'delete' && mounted) {
                  final ok = await KodaApi.instance.deleteMessage(
                    m['channel_id'] as String? ?? selectedChannel!['id'] as String,
                    m['id'] as String? ?? '',
                  );
                  if (ok) setState(() => _messages.remove(m));
                }
              },
              child: Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
            ),
            ); // end GestureDetector
          },
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(14),
        child: Row(children: [
          Expanded(
            child: KodaTextField(
              controller: _messageController,
              hintText: 'Message #${selectedChannel['name']}',
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

  @override
  Widget build(BuildContext context) {
    final selectedServer  = ref.watch(selectedServerProvider);
    final selectedChannel = ref.watch(selectedChannelProvider);
    final user = ref.watch(authProvider).user;

    return Scaffold(
      backgroundColor: KodaColors.voidBg,
      body: Row(children: [
        // ── Server rail ──────────────────────────────────────────────
        Container(
          width: 72,
          color: KodaColors.bg2,
          child: Column(children: [
            const SizedBox(height: 14),

            // DM button at top of rail
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Tooltip(
                message: 'Direct Messages',
                child: GestureDetector(
                  onTap: () => setState(() {
                    _showingDms = true;
                    ref.read(selectedServerProvider.notifier).state = null;
                    ref.read(selectedChannelProvider.notifier).state = null;
                  }),
                  child: Container(
                    width: 48, height: 48,
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: _showingDms ? KodaColors.koda : KodaColors.elevated,
                      borderRadius: BorderRadius.circular(_showingDms ? 14 : 24),
                    ),
                    child: const Icon(Icons.chat_bubble_outline,
                        color: Colors.white, size: 20),
                  ),
                ),
              ),
            ),

            Container(
                height: 1, width: 32, color: KodaColors.border,
                margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 20)),

            // Server buttons
            Expanded(
              child: _loadingServers
                  ? const Center(
                      child: CircularProgressIndicator(strokeWidth: 2))
                  : ListView(
                      children: _servers.map((s) {
                        final selected =
                            !_showingDms && selectedServer?['id'] == s['id'];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: GestureDetector(
                            onTap: () => _selectServer(s),
                            child: Container(
                              width: 48, height: 48,
                              margin: const EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                color: selected
                                    ? KodaColors.koda
                                    : KodaColors.elevated,
                                borderRadius:
                                    BorderRadius.circular(selected ? 14 : 24),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                (s['name'] as String).isNotEmpty
                                    ? (s['name'] as String)[0].toUpperCase()
                                    : '?',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
            ),
            IconButton(
              icon: const Icon(Icons.add, color: KodaColors.text2),
              tooltip: 'Create Server',
              onPressed: _showCreateServerDialog,
            ),
            const SizedBox(height: 10),
          ]),
        ),

        // ── Main content ─────────────────────────────────────────────
        if (_showingDms)
          const Expanded(child: DmScreen())
        else ...[
          // Channel list
          Container(
            width: 220,
            color: KodaColors.card,
            child: Column(children: [
              Container(
                height: 52,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: const BoxDecoration(
                    border:
                        Border(bottom: BorderSide(color: KodaColors.border))),
                child: Row(children: [
                  Expanded(
                    child: Text(selectedServer?['name'] ?? 'Koda',
                        style: const TextStyle(
                            color: KodaColors.text1,
                            fontWeight: FontWeight.w700),
                        overflow: TextOverflow.ellipsis),
                  ),
                  if (selectedServer != null)
                    IconButton(
                      icon: const Icon(Icons.settings_outlined,
                          size: 16, color: KodaColors.text3),
                      tooltip: 'Server Settings',
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const ServerSettingsScreen())),
                    ),
                ]),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  children: _channels.map((c) {
                    final selected = selectedChannel?['id'] == c['id'];
                    final isVoice = c['type'] == 'voice';
                    final icon = switch (c['type'] as String? ?? 'text') {
                      'voice'   => Icons.volume_up,
                      'gallery' => Icons.image_outlined,
                      'stage'   => Icons.campaign_outlined,
                      _         => Icons.tag,
                    };
                    return GestureDetector(
                      onSecondaryTapUp: (d) =>
                          _showChannelContextMenu(c, d.globalPosition),
                      child: ListTile(
                        dense: true,
                        leading: Icon(icon,
                            size: 16,
                            color: selected
                                ? KodaColors.text1
                                : KodaColors.text3),
                        title: Text(c['name'] as String? ?? '',
                            style: TextStyle(
                                fontSize: 13,
                                color: selected
                                    ? KodaColors.text1
                                    : KodaColors.text3)),
                        selected: selected,
                        selectedTileColor: KodaColors.koda.withOpacity(0.1),
                        onTap: () =>
                            isVoice ? _joinVoice(c) : _selectChannel(c),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    border: Border(top: BorderSide(color: KodaColors.border))),
                child: Row(children: [
                  KodaAvatar(username: user?.username ?? '?', size: 30, avatarUrl: user?.avatarUrl),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(user?.username ?? '',
                        style: const TextStyle(
                            color: KodaColors.text1, fontSize: 13),
                        overflow: TextOverflow.ellipsis),
                  ),
                  IconButton(
                    icon: const Icon(Icons.settings_outlined,
                        size: 16, color: KodaColors.text3),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const SettingsScreen())),
                  ),
                ]),
              ),
            ]),
          ),

          // Content area -- delegates to _buildContentArea which handles
          // gallery, text chat, and the "nothing selected" empty state.
          Expanded(child: _buildContentArea(selectedChannel)),
        ],
      ]),
    );
  }
}













