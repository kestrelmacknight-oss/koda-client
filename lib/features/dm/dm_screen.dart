// lib/features/dm/dm_screen.dart
//
// Direct messages with three tabs: All (conversations), Friends, Requests.

import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:phoenix_socket/phoenix_socket.dart';
import '../../core/api.dart';
import '../../core/socket.dart';
import '../../core/theme.dart';
import '../../core/providers.dart';
import '../../core/secure_storage.dart';
import '../../core/time_utils.dart';
import '../../core/crypto/dm_attachments.dart';
import '../../core/crypto/dm_session_manager.dart';
import '../../core/crypto/double_ratchet.dart' show DoubleRatchetDecryptFailure;
import '../../shared/pronoun_label.dart';
import '../../shared/report_dialog.dart';
import '../../shared/tier_badge.dart';
import '../../shared/widgets.dart';
import 'safety_number_screen.dart';

class DmScreen extends ConsumerStatefulWidget {
  // Set by push-notification-tap / deep-link routing (see
  // home_screen.dart's _handlePushTap) to jump straight into a specific
  // conversation once it's loaded, rather than landing on the bare list.
  final String? initialConversationId;
  const DmScreen({super.key, this.initialConversationId});
  @override
  ConsumerState<DmScreen> createState() => _DmScreenState();
}

class _DmScreenState extends ConsumerState<DmScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabs;

  // All tab
  List<Map<String, dynamic>> _conversations = [];
  Map<String, dynamic>? _activeConversation;
  String? _activeConversationId;
  List<Map<String, dynamic>> _messages = [];
  bool _loadingConvos = true;
  bool _loadingMessages = false;
  String? _peerLastReadAt;
  Map<String, int> _unreadCounts = {};
  bool _safetyNumberChanged = false;
  final _msgCtrl = TextEditingController();
  final _scroll = ScrollController();
  DmAttachmentMeta? _pendingAttachment;
  bool _uploadingAttachment = false;

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
    _loadUnreadCounts();
  }

  @override
  void dispose() {
    if (_activeConversationId != null) {
      KodaSocket.instance.leave('dm:$_activeConversationId');
    }
    ref.read(activeConversationProvider.notifier).state = null;
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

    final targetId = widget.initialConversationId;
    if (targetId != null) {
      final target = convos.cast<Map<String, dynamic>?>().firstWhere(
          (c) => c?['id'] == targetId, orElse: () => null);
      if (target != null) _openConversation(target);
    }
  }

  Future<void> _loadUnreadCounts() async {
    final counts = await KodaApi.instance.getUnreadCounts();
    if (!mounted) return;
    setState(() => _unreadCounts = Map<String, int>.from(counts['dms'] ?? {}));
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

  String? _peerUserId(Map<String, dynamic> convo) =>
      (convo['user'] as Map<String, dynamic>?)?['id'] as String?;

  /// Real end-to-end decryption (X3DH + Double Ratchet, see
  /// lib/core/crypto) for DMs -- unlike channel messages, which aren't
  /// encrypted yet (group E2EE is a separate, harder protocol). Each
  /// message key is used once and then gone by design, so plaintext is
  /// cached locally the moment it's known (send or decrypt) -- that
  /// cache, not the ratchet, is what lets history redisplay later.
  ///
  /// Cached by message_group_id, not row id -- multi-device fan-out
  /// means a single logical message can be N rows (one per target
  /// device) sharing one group id, and all N should hit the same cache
  /// entry (see _dedupeByGroup). Legacy rows (no group id) fall back to
  /// their own row id, exactly as before multi-device existed.
  Future<Map<String, dynamic>> _decryptForDisplay(
      Map<String, dynamic> message, String conversationId) async {
    if (message['encrypted'] != true) return message;
    final cacheKey = (message['message_group_id'] as String?) ?? message['id'] as String;

    final cached = await SecureStorage.getCachedDecryptedContent(cacheKey);
    if (cached != null) return _applyPayload(message, cached);

    try {
      final plain = await DmSessionManager.instance.decryptReceived(
        conversationId: conversationId,
        message: message,
      );
      await SecureStorage.cacheDecryptedContent(cacheKey, plain);
      return _applyPayload(message, plain);
    } on SafetyNumberChanged {
      if (mounted) setState(() => _safetyNumberChanged = true);
      return {...message, 'content': '', '_undecryptable': 'safety_number_changed'};
    } on DoubleRatchetDecryptFailure {
      return {...message, 'content': '', '_undecryptable': 'failed'};
    } catch (_) {
      return {...message, 'content': '', '_undecryptable': 'failed'};
    }
  }

  /// Folds N per-device rows sharing one message_group_id into one
  /// displayed bubble (keeps the first occurrence -- order-preserving,
  /// and content is identical across every device's copy of the same
  /// logical message by construction). Legacy rows (no group id, or a
  /// plaintext/never-encrypted row) each keep their own row id as their
  /// dedup key, so they're never folded into each other.
  List<Map<String, dynamic>> _dedupeByGroup(List<Map<String, dynamic>> messages) {
    final seen = <String>{};
    final result = <Map<String, dynamic>>[];
    for (final m in messages) {
      final key = (m['message_group_id'] as String?) ?? m['id'] as String;
      if (seen.add(key)) result.add(m);
    }
    return result;
  }

  /// Decrypted DM content is a [DmPayload] envelope, not a bare string --
  /// this splits it back into the text (for the bubble) and the optional
  /// attachment metadata (for [_buildAttachment]). Legacy messages sent
  /// before attachments existed decode as plain text with no attachment,
  /// so old history keeps rendering correctly.
  Map<String, dynamic> _applyPayload(Map<String, dynamic> message, String raw) {
    final payload = decodeDmPayload(raw);
    return {
      ...message,
      'content': payload.text,
      if (payload.attachment != null) '_attachment': payload.attachment,
    };
  }

  Future<void> _openConversation(Map<String, dynamic> convo) async {
    final conversationId = convo['id'] as String;
    final peerUserId = _peerUserId(convo);

    if (_activeConversationId != null && _activeConversationId != conversationId) {
      KodaSocket.instance.leave('dm:$_activeConversationId');
    }

    setState(() {
      _activeConversation = convo;
      _activeConversationId = conversationId;
      _loadingMessages = true;
      _peerLastReadAt = null;
      _safetyNumberChanged = false;
    });
    ref.read(activeConversationProvider.notifier).state = conversationId;

    final myDeviceId = await SecureStorage.getOrCreateDeviceId();
    final msgs = await KodaApi.instance.getDmMessages(conversationId, myDeviceId);
    if (!mounted) return;
    final decrypted = peerUserId == null
        ? msgs
        : await Future.wait(msgs.map((m) => _decryptForDisplay(m, conversationId)));
    if (!mounted) return;
    setState(() {
      _messages = _dedupeByGroup(decrypted.reversed.toList());
      _loadingMessages = false;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scroll.hasClients) {
        _scroll.jumpTo(_scroll.position.maxScrollExtent);
      }
    });

    KodaApi.instance.markDmRead(conversationId);
    setState(() => _unreadCounts = {..._unreadCounts, conversationId: 0});
    KodaApi.instance.getDmPeerLastReadAt(conversationId).then((readAt) {
      if (mounted && _activeConversationId == conversationId) {
        setState(() => _peerLastReadAt = readAt);
      }
    });

    final ch = await KodaSocket.instance.channelAsync('dm:$conversationId');
    ch?.messages.listen((msg) {
      if (!mounted || _activeConversationId != conversationId) return;
      if (msg.event == const PhoenixChannelEvent.custom('new_message')) {
        final payload = msg.payload as Map<String, dynamic>?;
        if (payload == null) return;
        // Every device-delivery row for this conversation broadcasts on
        // this same topic -- only handle the copy addressed to this
        // device (or a legacy row, recipient_device_id == null). A
        // sender's own outgoing fan-out is never addressed to the
        // sending device itself, so this also correctly skips the
        // "echo" of a message this client just sent -- that's already
        // shown optimistically in _sendMessage.
        final rowDeviceId = payload['recipient_device_id'] as String?;
        if (rowDeviceId != null && rowDeviceId != myDeviceId) return;
        // Already displayed (own optimistic send, or another of this
        // device's own fan-out copies already arrived) -- skip the dup.
        final groupId = payload['message_group_id'] as String?;
        if (groupId != null && _messages.any((m) => m['message_group_id'] == groupId)) return;
        () async {
          final display = peerUserId == null
              ? payload
              : await _decryptForDisplay(payload, conversationId);
          if (!mounted || _activeConversationId != conversationId) return;
          setState(() => _messages.add(display));
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (_scroll.hasClients) {
              _scroll.animateTo(_scroll.position.maxScrollExtent,
                  duration: const Duration(milliseconds: 200), curve: Curves.easeOut);
            }
          });
          // Conversation is open -- the incoming message is immediately seen.
          KodaApi.instance.markDmRead(conversationId);
        }();
      } else if (msg.event == const PhoenixChannelEvent.custom('conversation_read')) {
        final payload = msg.payload as Map<String, dynamic>?;
        final me = ref.read(authProvider).user;
        if (payload != null && payload['user_id'] != me?.id) {
          setState(() => _peerLastReadAt = payload['read_at'] as String?);
        }
      }
    });
  }

  Future<void> _sendMessage() async {
    final convo = _activeConversation;
    final text = _msgCtrl.text.trim();
    final peerUserId = convo != null ? _peerUserId(convo) : null;
    final attachment = _pendingAttachment;
    if (convo == null || peerUserId == null) return;
    if (text.isEmpty && attachment == null) return;
    if (_safetyNumberChanged) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text(
          "This conversation's safety number changed -- verify it before sending.")));
      return;
    }
    _msgCtrl.clear();
    setState(() => _pendingAttachment = null);

    try {
      final me = ref.read(authProvider).user;
      if (me == null) return;

      // The attachment's decryption key/nonce never leave this envelope --
      // it gets Double Ratchet-encrypted below exactly like ordinary text,
      // so the server only ever sees ciphertext for both the message and
      // (separately) the file itself.
      final payload = encodeDmPayload(text, attachment: attachment);
      final fanOut = await DmSessionManager.instance.encryptForSend(
        conversationId: convo['id'] as String,
        peerUserId: peerUserId,
        myUserId: me.id,
        plaintext: payload,
      );
      final groupId = await KodaApi.instance.sendDmMessage(
          convo['id'] as String, fanOut.messageGroupId,
          fanOut.deliveries.map((d) => d.toJson()).toList());

      if (groupId != null && mounted) {
        // Fan-out never addresses a copy back to this device (see
        // encryptForSend) -- this local, already-known plaintext is the
        // only way the sender ever sees their own message, live or on
        // reload (SecureStorage cache lookup by message_group_id, see
        // _decryptForDisplay).
        await SecureStorage.cacheDecryptedContent(groupId, payload);
        setState(() => _messages.add({
              'id': groupId,
              'message_group_id': groupId,
              'conversation_id': convo['id'],
              'sender_id': me.id,
              'author': {'id': me.id, 'username': me.username},
              'encrypted': true,
              'inserted_at': DateTime.now().toUtc().toIso8601String(),
              'content': text,
              if (attachment != null) '_attachment': attachment,
            }));
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (_scroll.hasClients) {
            _scroll.animateTo(_scroll.position.maxScrollExtent,
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOut);
          }
        });
      } else if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Message not sent.')));
      }
    } on SafetyNumberChanged {
      if (mounted) {
        setState(() => _safetyNumberChanged = true);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text(
            "This conversation's safety number changed -- verify it before sending.")));
      }
    } catch (e) {
      // Fail closed: never send plaintext when encryption couldn't
      // complete. Surface the failure instead.
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Could not encrypt message: $e')));
      }
    }
  }

  // Matches Koda.Upload's allowed_content_types server-side (minus
  // application/pdf's dedicated mime lookup -- ciphertext always uploads
  // as application/octet-stream regardless of the real file type, see
  // lib/core/crypto/dm_attachments.dart).
  static const _attachmentExtensions = [
    'jpg', 'jpeg', 'png', 'gif', 'webp', 'svg', 'avif',
    'mp4', 'webm', 'mov',
    'mp3', 'ogg', 'wav',
    'pdf',
  ];
  static const _extensionContentTypes = {
    'jpg': 'image/jpeg', 'jpeg': 'image/jpeg', 'png': 'image/png',
    'gif': 'image/gif', 'webp': 'image/webp', 'svg': 'image/svg+xml',
    'avif': 'image/avif', 'mp4': 'video/mp4', 'webm': 'video/webm',
    'mov': 'video/quicktime', 'mp3': 'audio/mpeg', 'ogg': 'audio/ogg',
    'wav': 'audio/wav', 'pdf': 'application/pdf',
  };

  Future<void> _pickAndEncryptAttachment() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: _attachmentExtensions,
    );
    final path = result?.files.single.path;
    if (path == null || !mounted) return;
    final ext = result!.files.single.extension?.toLowerCase() ?? '';
    final contentType = _extensionContentTypes[ext] ?? 'application/octet-stream';
    final fileName = result.files.single.name;

    setState(() => _uploadingAttachment = true);
    try {
      final bytes = await File(path).readAsBytes();
      final meta = await encryptAndUploadDmAttachment(
          bytes: bytes, contentType: contentType, fileName: fileName);
      if (!mounted) return;
      if (meta == null) {
        setState(() => _uploadingAttachment = false);
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Attachment upload failed.')));
        return;
      }
      setState(() {
        _pendingAttachment = meta;
        _uploadingAttachment = false;
      });
    } catch (e) {
      if (mounted) {
        setState(() => _uploadingAttachment = false);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Could not encrypt attachment: $e')));
      }
    }
  }

  bool _seenByPeer(Map<String, dynamic> message) {
    final readAt = _peerLastReadAt;
    final sentAt = message['inserted_at'] as String?;
    if (readAt == null || sentAt == null) return false;
    try {
      return !parseServerTimestamp(readAt).isBefore(parseServerTimestamp(sentAt));
    } catch (_) {
      return false;
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
      final dt = parseServerTimestamp(raw.toString());
      return DateFormat('h:mm a').format(dt);
    } catch (_) { return ''; }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KodaColors.voidBg,
      appBar: AppBar(
        backgroundColor: KodaColors.bg2,
        title: Text('Messages',
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
                ? Center(child: CircularProgressIndicator(
                    color: KodaColors.koda))
                : _conversations.isEmpty
                    ? Center(child: Text('No conversations yet',
                        style: TextStyle(color: KodaColors.text3,
                            fontSize: 13)))
                    : ListView.builder(
                        itemCount: _conversations.length,
                        itemBuilder: (_, i) {
                          final c = _conversations[i];
                          final other = c['user'] as Map<String, dynamic>?;
                          final name = other?['username'] as String? ?? 'Unknown';
                          final active = _activeConversation?['id'] == c['id'];
                          final unread = _unreadCounts[c['id']] ?? 0;
                          return ListTile(
                            selected: active,
                            selectedTileColor: KodaColors.koda.withValues(alpha: 0.1),
                            leading: KodaAvatar(username: name, size: 32,
                                avatarUrl: other?['avatar_url'] as String?,
                                tier: other?['koda_tier'] as String?),
                            title: Row(mainAxisSize: MainAxisSize.min, children: [
                              Flexible(child: Text(name,
                                  style: TextStyle(
                                      color: KodaColors.text1, fontSize: 13,
                                      fontWeight: unread > 0 ? FontWeight.w700 : FontWeight.w400),
                                  overflow: TextOverflow.ellipsis)),
                              const SizedBox(width: 4),
                              TierBadge(tier: other?['koda_tier'] as String?, size: 12),
                            ]),
                            trailing: unread > 0
                                ? Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                                    decoration: BoxDecoration(
                                        color: KodaColors.koda,
                                        borderRadius: BorderRadius.circular(99)),
                                    child: Text('$unread',
                                        style: const TextStyle(color: Colors.white,
                                            fontSize: 11, fontWeight: FontWeight.w700)),
                                  )
                                : null,
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
            ? Center(child: Text('Select a conversation',
                style: TextStyle(color: KodaColors.text3)))
            : _buildChatArea(),
      ),
    ]);
  }

  Widget _buildChatArea() {
    final peer = _activeConversation?['user'] as Map<String, dynamic>?;
    final peerName = peer?['username'] as String? ?? 'Unknown';
    final peerId = peer?['id'] as String?;
    final peerTier = peer?['koda_tier'] as String?;

    return Column(children: [
      Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: KodaColors.border))),
        child: Row(children: [
          Text(withPronouns(peerName, peer), style: TextStyle(
              color: KodaColors.text1, fontWeight: FontWeight.w600, fontSize: 13)),
          const SizedBox(width: 6),
          TierBadge(tier: peerTier, size: 13),
          const SizedBox(width: 8),
          Tooltip(
            message: 'End-to-end encrypted',
            child: Icon(Icons.lock_outline, size: 13, color: KodaColors.mint),
          ),
          const Spacer(),
          if (peerId != null)
            IconButton(
              icon: Icon(Icons.verified_user_outlined, size: 18, color: KodaColors.text3),
              tooltip: 'Verify Safety Number',
              onPressed: () async {
                final confirmed = await Navigator.push<bool>(context, MaterialPageRoute(
                  builder: (_) => SafetyNumberScreen(peerUserId: peerId, peerName: peerName),
                ));
                if (confirmed == true && mounted) setState(() => _safetyNumberChanged = false);
              },
            ),
        ]),
      ),
      if (_safetyNumberChanged)
        Container(
          width: double.infinity,
          color: KodaColors.accent.withValues(alpha: 0.15),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            "$peerName's safety number changed -- verify it before sending. "
            "This can mean they reinstalled the app, or (rarely) something is wrong.",
            style: TextStyle(color: KodaColors.accent, fontSize: 11),
          ),
        ),
      // Messages
      Expanded(
        child: _loadingMessages
            ? Center(child: CircularProgressIndicator(
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
                  final canReport = !isMe && m['_undecryptable'] == null;
                  return GestureDetector(
                    onSecondaryTapUp: !canReport ? null : (d) async {
                      final action = await showMenu<String>(
                        context: context,
                        position: RelativeRect.fromLTRB(d.globalPosition.dx,
                            d.globalPosition.dy, d.globalPosition.dx, d.globalPosition.dy),
                        color: KodaColors.card,
                        items: [
                          PopupMenuItem(value: 'report',
                              child: Text('Report Message', style: TextStyle(color: KodaColors.accent))),
                        ],
                      );
                      if (action == 'report' && mounted) {
                        final submitted = await showReportDmMessageDialog(
                          context,
                          messageId: m['id'] as String? ?? '',
                          disclosedContent: m['content'] as String? ?? '',
                        );
                        if (submitted && mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Report submitted.')));
                        }
                      }
                    },
                    child: Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (!isMe) ...[
                          KodaAvatar(username: author, size: 32,
                              avatarUrl: peer?['avatar_url'] as String?,
                              tier: peerTier),
                          const SizedBox(width: 8),
                        ],
                        Expanded(
                          child: Column(
                            crossAxisAlignment: isMe
                                ? CrossAxisAlignment.end
                                : CrossAxisAlignment.start,
                            children: [
                              if (!isMe)
                                Text(withPronouns(author, m['author'] as Map<String, dynamic>?),
                                    style: TextStyle(
                                        color: KodaColors.koda,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600)),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                decoration: BoxDecoration(
                                  color: isMe
                                      ? KodaColors.koda.withValues(alpha: 0.2)
                                      : KodaColors.card,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: m['_undecryptable'] != null
                                    ? Row(mainAxisSize: MainAxisSize.min, children: [
                                        Icon(Icons.lock_outline,
                                            size: 13, color: KodaColors.accent),
                                        const SizedBox(width: 6),
                                        Text(
                                          m['_undecryptable'] == 'safety_number_changed'
                                              ? 'Unable to decrypt -- safety number changed'
                                              : 'Unable to decrypt this message',
                                          style: TextStyle(
                                              color: KodaColors.accent,
                                              fontSize: 12,
                                              fontStyle: FontStyle.italic),
                                        ),
                                      ])
                                    : Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          if (m['_attachment'] is DmAttachmentMeta) ...[
                                            _EncryptedAttachment(
                                                meta: m['_attachment'] as DmAttachmentMeta),
                                            if ((m['content'] as String? ?? '').isNotEmpty)
                                              const SizedBox(height: 6),
                                          ],
                                          if ((m['content'] as String? ?? '').isNotEmpty)
                                            Text(
                                              m['content'] as String,
                                              style: TextStyle(
                                                  color: KodaColors.text1,
                                                  fontSize: 13),
                                            ),
                                        ],
                                      ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 2, left: 2, right: 2),
                                child: Text(_formatTime(m['inserted_at']),
                                    style: TextStyle(color: KodaColors.text3, fontSize: 10)),
                              ),
                              if (isMe && i == _messages.length - 1 && _seenByPeer(m))
                                Padding(
                                  padding: EdgeInsets.only(top: 2, right: 2),
                                  child: Text('Seen',
                                      style: TextStyle(color: KodaColors.text3, fontSize: 10)),
                                ),
                            ],
                          ),
                        ),
                        if (isMe) const SizedBox(width: 8),
                      ],
                    ),
                  ));
                },
              ),
      ),

      // Input
      Padding(
        padding: const EdgeInsets.all(14),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          if (_pendingAttachment != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                Icon(Icons.lock_outline, size: 12, color: KodaColors.mint),
                const SizedBox(width: 4),
                Flexible(
                  child: Text(_pendingAttachment!.fileName,
                      style: TextStyle(color: KodaColors.text2, fontSize: 12),
                      overflow: TextOverflow.ellipsis),
                ),
                IconButton(
                  icon: Icon(Icons.close, size: 14, color: KodaColors.text3),
                  onPressed: () => setState(() => _pendingAttachment = null),
                  constraints: const BoxConstraints(),
                  padding: const EdgeInsets.only(left: 6),
                  visualDensity: VisualDensity.compact,
                ),
              ]),
            ),
          Row(children: [
            IconButton(
              icon: _uploadingAttachment
                  ? SizedBox(
                      width: 16, height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2, color: KodaColors.koda))
                  : Icon(Icons.attach_file, color: KodaColors.text3),
              onPressed: _uploadingAttachment ? null : _pickAndEncryptAttachment,
            ),
            Expanded(
              child: KodaTextField(
                controller: _msgCtrl,
                hintText: 'Message...',
                onSubmitted: (_) => _sendMessage(),
              ),
            ),
            const SizedBox(width: 10),
            IconButton(
              icon: Icon(Icons.send, color: KodaColors.koda),
              onPressed: _sendMessage,
            ),
          ]),
        ]),
      ),
    ]);
  }

  // ── Friends tab ───────────────────────────────────────────────────────────

  Widget _buildFriendsTab() {
    if (_loadingFriends) {
      return Center(child: CircularProgressIndicator(
          color: KodaColors.koda));
    }
    if (_friends.isEmpty) {
      return Center(child: Text('No friends yet.\nSend a friend request to get started.',
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
                avatarUrl: f['avatar_url'] as String?,
                tier: f['koda_tier'] as String?),
            title: Row(mainAxisSize: MainAxisSize.min, children: [
              Flexible(child: Text(name,
                  style: TextStyle(color: KodaColors.text1,
                      fontWeight: FontWeight.w500),
                  overflow: TextOverflow.ellipsis)),
              const SizedBox(width: 4),
              TierBadge(tier: f['koda_tier'] as String?, size: 12),
            ]),
            trailing: Row(mainAxisSize: MainAxisSize.min, children: [
              IconButton(
                icon: Icon(Icons.message_outlined,
                    color: KodaColors.koda, size: 18),
                tooltip: 'Send message',
                onPressed: () => _startDm(f),
              ),
              IconButton(
                icon: Icon(Icons.person_remove_outlined,
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
      return Center(child: CircularProgressIndicator(
          color: KodaColors.koda));
    }
    if (_receivedRequests.isEmpty && _sentRequests.isEmpty) {
      return Center(child: Text('No pending friend requests.',
          style: TextStyle(color: KodaColors.text3, fontSize: 13)));
    }
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        if (_receivedRequests.isNotEmpty) ...[
          Text('INCOMING', style: TextStyle(color: KodaColors.text3,
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
                  Text(name, style: TextStyle(
                      color: KodaColors.text1, fontWeight: FontWeight.w500)),
                  if (msg != null && msg.isNotEmpty)
                    Text(msg, style: TextStyle(
                        color: KodaColors.text3, fontSize: 12)),
                ])),
                IconButton(
                  icon: Icon(Icons.check_circle_outline,
                      color: KodaColors.koda, size: 22),
                  tooltip: 'Accept',
                  onPressed: () => _acceptRequest(req),
                ),
                IconButton(
                  icon: Icon(Icons.cancel_outlined,
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
          Text('SENT', style: TextStyle(color: KodaColors.text3,
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
                Expanded(child: Text(name, style: TextStyle(
                    color: KodaColors.text1, fontWeight: FontWeight.w500))),
                Text('Pending', style: TextStyle(
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
        title: Text('New Message',
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

/// Renders one decrypted DM attachment. Deliberately not `Image.network`
/// (or any direct CDN fetch by URL) -- the bytes at that URL are AES-256-GCM
/// ciphertext, so they have to be fetched and decrypted first (see
/// lib/core/crypto/dm_attachments.dart) before there's anything displayable.
/// Decrypted once per widget lifetime and cached in memory; nothing
/// plaintext is written to disk unless the user explicitly saves the file.
class _EncryptedAttachment extends StatefulWidget {
  final DmAttachmentMeta meta;
  const _EncryptedAttachment({required this.meta});

  @override
  State<_EncryptedAttachment> createState() => _EncryptedAttachmentState();
}

class _EncryptedAttachmentState extends State<_EncryptedAttachment> {
  late final Future<Uint8List> _bytes = downloadAndDecryptDmAttachment(widget.meta);

  Future<void> _saveToDisk(Uint8List bytes) async {
    final path = await FilePicker.platform.saveFile(fileName: widget.meta.fileName);
    if (path == null) return;
    await File(path).writeAsBytes(bytes);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Saved ${widget.meta.fileName}')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final isImage = widget.meta.contentType.startsWith('image/');
    return FutureBuilder<Uint8List>(
      future: _bytes,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const SizedBox(
              width: 32, height: 32,
              child: Center(child: CircularProgressIndicator(strokeWidth: 2)));
        }
        if (snapshot.hasError || snapshot.data == null) {
          return _attachmentChip(Icons.error_outline, widget.meta.fileName,
              color: KodaColors.accent, onTap: null);
        }
        final bytes = snapshot.data!;
        if (isImage) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 320, maxHeight: 240),
              child: GestureDetector(
                onTap: () => _saveToDisk(bytes),
                child: Image.memory(bytes, fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) => _attachmentChip(
                        Icons.insert_drive_file_outlined, widget.meta.fileName,
                        onTap: () => _saveToDisk(bytes))),
              ),
            ),
          );
        }
        return _attachmentChip(Icons.insert_drive_file_outlined, widget.meta.fileName,
            onTap: () => _saveToDisk(bytes));
      },
    );
  }

  Widget _attachmentChip(IconData icon, String fileName,
      {Color? color, VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        constraints: const BoxConstraints(maxWidth: 280),
        decoration: BoxDecoration(
          color: KodaColors.elevated,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: KodaColors.border),
        ),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Icon(icon, size: 16, color: color ?? KodaColors.text3),
          const SizedBox(width: 8),
          Flexible(
            child: Text(fileName,
                style: TextStyle(color: KodaColors.koda, fontSize: 12),
                overflow: TextOverflow.ellipsis),
          ),
        ]),
      ),
    );
  }
}