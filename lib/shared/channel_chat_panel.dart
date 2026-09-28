// lib/shared/channel_chat_panel.dart
//
// Self-contained E2EE text chat for a single channel_id, reused wherever
// a channel's chat needs to be shown outside home_screen.dart's own
// content pane -- currently just the voice-channel side panel in
// voice_screen.dart. This is a relocation of home_screen.dart's
// _selectChannel text-branch + _sendMessage + supporting message-row
// widgets, not a new implementation: every API call here is already
// channel_id-keyed with no assumption about which screen is hosting it.
//
// Deliberately self-fetches members/roles/emoji by [serverId] rather
// than accepting them from a parent -- a parent's cached member/role
// list reflects whichever server is *currently selected in its own
// sidebar*, which can differ from this panel's server if the user
// switched servers while a voice call (and this panel) stayed open.
//
// v1 scope: reactions, edit, pin, delete, report, reply, attachments,
// GIF picker, and link previews are all here. Thread-creation from this
// panel and the emoji-shortcode autocomplete row are cut for v1 -- both
// are reasonable, small follow-ups, not required for a working chat.

import 'dart:async';
import 'dart:io' show File;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:phoenix_socket/phoenix_socket.dart';
import '../core/api.dart';
import '../core/message_language.dart';
import '../l10n/generated/app_localizations.dart';
import '../core/theme.dart';
import '../core/providers.dart';
import '../core/uploader.dart';
import '../core/socket.dart';
import '../core/link_preview.dart';
import '../core/message_utils.dart';
import '../core/secure_storage.dart';
import '../core/crypto/channel_key_manager.dart';
import 'widgets.dart';
import 'custom_emoji.dart';
import 'pronoun_label.dart';
import 'report_dialog.dart';
import '../features/dm/dm_screen.dart';
import '../features/home/gif_picker_dialog.dart';
import '../features/marketplace/tip_dialog.dart';

const _kQuickReactions = ['👍', '❤️', '😂', '😮', '😢', '😡'];

class ChannelChatPanel extends ConsumerStatefulWidget {
  final String channelId;
  final String serverId;

  const ChannelChatPanel({
    super.key,
    required this.channelId,
    required this.serverId,
  });

  @override
  ConsumerState<ChannelChatPanel> createState() => _ChannelChatPanelState();
}

class _ChannelChatPanelState extends ConsumerState<ChannelChatPanel> {
  List<Map<String, dynamic>> _messages = [];
  List<Map<String, dynamic>> _members = [];
  List<Map<String, dynamic>> _roles = [];
  Map<String, dynamic>? _replyingTo;
  Map<String, dynamic>? _pendingAttachment;
  bool _uploadingAttachment = false;
  bool _loading = true;
  final _messageController = TextEditingController();
  final _scroll = ScrollController();

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void didUpdateWidget(ChannelChatPanel oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.channelId != widget.channelId) {
      KodaSocket.instance.leave('channel:${oldWidget.channelId}');
      setState(() { _messages = []; _loading = true; });
      _load();
    }
  }

  @override
  void dispose() {
    KodaSocket.instance.leave('channel:${widget.channelId}');
    _messageController.dispose();
    _scroll.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> _serverEmoji() =>
      ref.watch(serverEmojiProvider(widget.serverId)).value ?? const [];

  Future<void> _load() async {
    final myUserId = ref.read(authProvider).user?.id;
    if (myUserId == null) return;
    final channelId = widget.channelId;

    final results = await Future.wait([
      KodaApi.instance.getMessages(channelId),
      KodaApi.instance.getMembers(widget.serverId),
      KodaApi.instance.getRoles(widget.serverId),
    ]);
    if (!mounted || widget.channelId != channelId) return;

    // Fire-and-forget: top up delivery of the current epoch key to
    // anyone missing it, same as home_screen.dart's text-channel path.
    unawaited(ChannelKeyManager.instance.ensureReady(channelId,
        myUserId: myUserId, serverId: widget.serverId));

    final messages = results[0];
    final decrypted = await decryptMessages(messages.reversed.toList(),
        channelId: channelId, myUserId: myUserId);
    if (!mounted || widget.channelId != channelId) return;
    setState(() {
      _messages = decrypted;
      _members = results[1];
      _roles = results[2];
      _loading = false;
    });
    KodaApi.instance.markChannelRead(channelId);

    final ch = await KodaSocket.instance.channelAsync('channel:$channelId');
    ch?.messages.listen((msg) {
      if (!mounted || widget.channelId != channelId) return;
      if (msg.event == const PhoenixChannelEvent.custom('new_message')) {
        final payload = msg.payload as Map<String, dynamic>?;
        if (payload != null) {
          decryptMessages([payload], channelId: channelId, myUserId: myUserId).then((decoded) {
            if (mounted) setState(() => _messages.add(decoded.first));
          });
          KodaApi.instance.markChannelRead(channelId);
        }
      } else if (msg.event == const PhoenixChannelEvent.custom('message_deleted')) {
        final payload = msg.payload as Map<String, dynamic>?;
        final id = payload?['id'];
        if (id != null) setState(() => _messages.removeWhere((m) => m['id'] == id));
      } else if (msg.event == const PhoenixChannelEvent.custom('message_edited')) {
        final payload = msg.payload as Map<String, dynamic>?;
        final id = payload?['id'];
        if (id != null) {
          final i = _messages.indexWhere((m) => m['id'] == id);
          if (i != -1) {
            final existing = _messages[i];
            final merged = {...existing,
              'content': payload!['content'],
              'nonce': payload['nonce'],
              'edited_at': payload['edited_at']};
            final messageId = id as String;
            SecureStorage.deleteCachedDecryptedContent(messageId).then((_) {
              decryptMessages([merged], channelId: channelId, myUserId: myUserId).then((decoded) {
                if (mounted) {
                  setState(() {
                    final j = _messages.indexWhere((m) => m['id'] == id);
                    if (j != -1) _messages[j] = decoded.first;
                  });
                }
              });
            });
          }
        }
      } else if (msg.event == const PhoenixChannelEvent.custom('message_pinned') ||
                 msg.event == const PhoenixChannelEvent.custom('message_unpinned')) {
        final payload = msg.payload as Map<String, dynamic>?;
        final id = payload?['id'];
        final pinned = msg.event == const PhoenixChannelEvent.custom('message_pinned');
        if (id != null) {
          setState(() {
            final i = _messages.indexWhere((m) => m['id'] == id);
            if (i != -1) {
              _messages[i] = {..._messages[i],
                'pinned_at': pinned ? DateTime.now().toIso8601String() : null};
            }
          });
        }
      } else if (msg.event == const PhoenixChannelEvent.custom('link_preview_updated')) {
        final payload = msg.payload as Map<String, dynamic>?;
        final id = payload?['id'];
        if (id != null) {
          setState(() {
            final i = _messages.indexWhere((m) => m['id'] == id);
            if (i != -1) _messages[i] = {..._messages[i], 'link_preview': payload!['link_preview']};
          });
        }
      }
    });
  }

  ({bool everyone, List<String> userIds, List<String> roleIds}) _resolveMentions(String text) {
    final everyone = text.contains('@everyone');
    final tokens = RegExp(r'@([A-Za-z0-9_]+)')
        .allMatches(text)
        .map((m) => m.group(1)!)
        .toSet();

    final userIds = <String>{};
    final roleIds = <String>{};
    for (final token in tokens) {
      final role = _roles.cast<Map<String, dynamic>?>().firstWhere(
          (r) => (r?['name'] as String?)?.toLowerCase() == token.toLowerCase(),
          orElse: () => null);
      if (role != null) {
        roleIds.add(role['id'] as String);
        continue;
      }
      final member = _members.cast<Map<String, dynamic>?>().firstWhere(
          (m) => ((m?['user'] as Map<String, dynamic>?)?['username'] as String?)
                  ?.toLowerCase() ==
              token.toLowerCase(),
          orElse: () => null);
      final userId = member?['user_id'] as String?;
      if (userId != null) userIds.add(userId);
    }
    return (everyone: everyone, userIds: userIds.toList(), roleIds: roleIds.toList());
  }

  Future<void> _sendMessage() async {
    final channelId = widget.channelId;
    final text = _messageController.text.trim();
    final attachment = _pendingAttachment;
    if (text.isEmpty && attachment == null) return;
    final replyToId = _replyingTo?['id'] as String?;
    setState(() { _replyingTo = null; _pendingAttachment = null; });
    _messageController.clear();

    final myUserId = ref.read(authProvider).user?.id;
    if (myUserId == null) return;

    final encrypted = await ChannelKeyManager.instance
        .encryptForChannel(channelId, text, myUserId: myUserId);
    if (encrypted == null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text(
            "Still setting up encryption for this channel -- try sending again in a moment.")));
      }
      return;
    }

    final mentions = _resolveMentions(text);
    final result = await KodaApi.instance.sendMessage(channelId, encrypted.content,
        encrypted: true,
        epoch: encrypted.epoch,
        nonce: encrypted.nonce,
        replyToId: replyToId,
        mentionedUserIds: mentions.userIds,
        mentionedRoleIds: mentions.roleIds,
        mentionEveryone: mentions.everyone,
        attachmentUrl: attachment?['url'],
        attachmentContentType: attachment?['contentType']);
    final msg = result.data;
    if (msg != null && mounted) {
      await SecureStorage.cacheDecryptedContent(msg['id'] as String, text);
      final lang = detectMessageLanguage(text);
      setState(() => _messages.add({...msg, 'content': text,
          if (lang != null) '_detectedLang': lang}));
      Future.delayed(const Duration(milliseconds: 50), () {
        if (_scroll.hasClients) {
          _scroll.animateTo(_scroll.position.maxScrollExtent,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut);
        }
      });
      final url = firstUrl(text);
      if (url != null) _attachLinkPreview(channelId, msg['id'] as String, url);
    } else if (mounted) {
      final message = result.errorCode == 'rate_limited'
          ? "You're sending messages too fast -- slow down a bit."
          : "Message not sent -- you may not have permission to post here.";
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
    }
  }

  Future<void> _attachLinkPreview(String channelId, String messageId, String url) async {
    final preview = await fetchLinkPreview(url);
    if (preview == null || !mounted) return;
    final ok = await KodaApi.instance.setLinkPreview(channelId, messageId, preview);
    if (ok && mounted) {
      setState(() {
        final i = _messages.indexWhere((m) => m['id'] == messageId);
        if (i != -1) _messages[i] = {..._messages[i], 'link_preview': preview};
      });
    }
  }

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

  Future<void> _pickAttachment() async {
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
      final uploaded = await KodaUploader.instance.upload(
        file: File(path), uploadType: 'attachment', contentType: contentType);
      if (mounted) {
        setState(() {
          _pendingAttachment = {
            'url': uploaded.cdnUrl, 'contentType': contentType, 'fileName': fileName,
          };
          _uploadingAttachment = false;
        });
      }
    } on UploadException catch (e) {
      if (mounted) {
        setState(() => _uploadingAttachment = false);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
      }
    }
  }

  Future<void> _pickGif() async {
    final gif = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (_) => const GifPickerDialog(),
    );
    final url = gif?['url'] as String?;
    if (url == null || !mounted) return;
    setState(() => _pendingAttachment = {
      'url': url, 'contentType': 'image/gif', 'fileName': gif?['title'] as String? ?? 'GIF',
    });
    await _sendMessage();
  }

  Future<void> _editMessage(String channelId, Map<String, dynamic> message) async {
    final t = AppLocalizations.of(context);
    final ctrl = TextEditingController(text: message['content'] as String? ?? '');
    final content = await showDialog<String>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: Text(t.homeEditMessageTitle, style: TextStyle(color: KodaColors.text1)),
        content: KodaTextField(controller: ctrl, hintText: t.homeMessageLabel, autofocus: true),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context),
              child: Text(t.commonCancel)),
          TextButton(onPressed: () => Navigator.pop(context, ctrl.text.trim()),
              child: Text(t.commonSave)),
        ],
      ),
    );
    if (content == null || content.isEmpty || content == message['content']) return;

    final messageId = message['id'] as String? ?? '';
    final epoch = message['epoch'] as int?;
    String? nonce;
    String newContent = content;

    if (epoch != null) {
      // Re-encrypt under the epoch this message was originally sent
      // with -- not necessarily the channel's current epoch, since a
      // message's readability shouldn't shift out from under an edit.
      final encrypted = await ChannelKeyManager.instance.encryptForEpoch(channelId, epoch, content);
      if (encrypted == null) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text(
              "Can't edit this message right now -- its encryption key isn't available on this device.")));
        }
        return;
      }
      newContent = encrypted.content;
      nonce = encrypted.nonce;
    }

    final updated = await KodaApi.instance.editMessage(channelId, messageId, newContent, nonce: nonce);
    if (updated != null && mounted) {
      await SecureStorage.cacheDecryptedContent(messageId, content);
      setState(() {
        message['content'] = content;
        message['nonce'] = updated['nonce'];
        message['edited_at'] = updated['edited_at'];
      });
    }
  }

  Future<void> _showMessageActionMenu(Offset position, Map<String, dynamic> m, String channelId,
      {required bool isMine, required bool isPinned, required bool canDelete}) async {
    final t = AppLocalizations.of(context);
    final action = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(position.dx, position.dy, position.dx, position.dy),
      color: KodaColors.card,
      items: [
        PopupMenuItem(value: 'reply', child: Text(t.homeReplyAction)),
        if (isMine && m['encrypted'] != true)
          PopupMenuItem(value: 'edit', child: Text(t.homeEditMessageAction)),
        PopupMenuItem(value: isPinned ? 'unpin' : 'pin',
            child: Text(isPinned ? t.homeUnpinMessageAction : t.homePinMessageAction)),
        if (canDelete) PopupMenuItem(
            value: 'delete', child: Text(t.homeDeleteMessageAction)),
        if (!isMine)
          PopupMenuItem(value: 'report',
              child: Text(t.homeReportMessageAction, style: TextStyle(color: KodaColors.accent))),
      ],
    );
    if (action == 'reply' && mounted) {
      setState(() => _replyingTo = m);
    }
    if (action == 'edit' && mounted) {
      _editMessage(channelId, m);
    }
    if (action == 'pin' && mounted) {
      final ok = await KodaApi.instance.pinMessage(channelId, m['id'] as String? ?? '');
      if (ok) setState(() => m['pinned_at'] = DateTime.now().toIso8601String());
    }
    if (action == 'unpin' && mounted) {
      final ok = await KodaApi.instance.unpinMessage(channelId, m['id'] as String? ?? '');
      if (ok) setState(() => m['pinned_at'] = null);
    }
    if (action == 'delete' && mounted) {
      final ok = await KodaApi.instance.deleteMessage(channelId, m['id'] as String? ?? '');
      if (ok) setState(() => _messages.remove(m));
    }
    if (action == 'report' && mounted) {
      final submitted = await showReportChannelMessageDialog(
        context,
        channelId: channelId,
        messageId: m['id'] as String? ?? '',
        disclosedContent: m['content'] as String? ?? '',
      );
      if (submitted && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(t.homeReportSubmitted)));
      }
    }
  }

  Widget _buildReactions(Map<String, dynamic> m) {
    final t = AppLocalizations.of(context);
    final reactions = m['reactions'] as List? ?? [];
    final me = ref.read(authProvider).user;
    final serverEmoji = _serverEmoji();
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Wrap(
        spacing: 4,
        runSpacing: 4,
        children: [
          ...reactions.map((r) {
            final emoji = r['emoji'] as String;
            final count = r['count'] as int;
            final userIds = List<String>.from(r['user_ids'] ?? []);
            final reacted = me != null && userIds.contains(me.id);
            final emojiName = emoji.startsWith(kCustomEmojiPrefix) ? t.homeCustomEmojiFallback : emoji;
            return KodaTappable(
              semanticLabel: '$emojiName, ${t.homeReactionCount(count)}'
                  '${reacted ? t.homeReactionYouReacted : t.homeReactionActivateToAdd}',
              borderRadius: BorderRadius.circular(12),
              onTap: () async {
                final updated = reacted
                    ? await KodaApi.instance.removeReaction(m['id'] as String, emoji)
                    : await KodaApi.instance.addReaction(m['id'] as String, emoji);
                if (updated != null && mounted) setState(() => m['reactions'] = updated);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: reacted ? KodaColors.koda.withValues(alpha: 0.15) : KodaColors.elevated,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: reacted ? KodaColors.koda.withValues(alpha: 0.5) : KodaColors.border),
                ),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  EmojiGlyph(value: emoji, serverEmoji: serverEmoji, size: 14),
                  const SizedBox(width: 4),
                  Text('$count', style: const TextStyle(fontSize: 12)),
                ]),
              ),
            );
          }),
          KodaTappable(
            semanticLabel: t.homeAddReactionLabel,
            borderRadius: BorderRadius.circular(12),
            onTap: () => _showReactionPicker(m),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: KodaColors.elevated,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: KodaColors.border),
              ),
              child: const Text('+ :)', style: TextStyle(fontSize: 12)),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showReactionPicker(Map<String, dynamic> message) async {
    final serverEmoji = _serverEmoji();
    final emoji = await showDialog<String>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: Text(AppLocalizations.of(context).homeAddReactionTitle,
            style: TextStyle(color: KodaColors.text1, fontSize: 14)),
        content: SingleChildScrollView(
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ..._kQuickReactions.map((e) => GestureDetector(
                onTap: () => Navigator.pop(context, e),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: KodaColors.elevated,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(e, style: const TextStyle(fontSize: 24)),
                ),
              )),
              ...serverEmoji.map((e) => GestureDetector(
                onTap: () => Navigator.pop(context, '$kCustomEmojiPrefix${e['id']}'),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: KodaColors.elevated,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: EmojiGlyph(value: '$kCustomEmojiPrefix${e['id']}',
                      serverEmoji: serverEmoji, size: 24),
                ),
              )),
            ],
          ),
        ),
      ),
    );
    if (emoji == null || !mounted) return;
    final updated = await KodaApi.instance.addReaction(message['id'] as String, emoji);
    if (updated != null && mounted) {
      setState(() => message['reactions'] = updated);
    }
  }

  Widget _buildReplyPreview(Map<String, dynamic> replyTo) {
    final author = (replyTo['author'] as Map<String, dynamic>?)?['username'] as String? ?? 'Unknown';
    final content = replyTo['content'] as String? ?? '';
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: KodaColors.elevated,
        borderRadius: BorderRadius.circular(6),
        border: Border(left: BorderSide(color: KodaColors.koda, width: 2)),
      ),
      child: Text(
        '$author: $content',
        style: TextStyle(
            color: KodaColors.text3,
            fontSize: 11,
            fontStyle: FontStyle.italic),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildAttachment(Map<String, dynamic> m) {
    final url = m['attachment_url'] as String? ?? '';
    final contentType = m['attachment_content_type'] as String? ?? '';
    final fileName = url.split('/').last;

    if (contentType.startsWith('image/')) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 320, maxHeight: 240),
          child: Image.network(url, fit: BoxFit.contain,
              errorBuilder: (_, __, ___) => _attachmentChip(url, fileName)),
        ),
      );
    }
    return _attachmentChip(url, fileName);
  }

  Widget _attachmentChip(String url, String fileName) {
    return InkWell(
      onTap: () => launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication),
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
          Icon(Icons.insert_drive_file_outlined, size: 16, color: KodaColors.text3),
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

  Widget _buildLinkPreview(Map<String, dynamic> preview) {
    final url = preview['url'] as String? ?? '';
    final title = preview['title'] as String?;
    final description = preview['description'] as String?;
    final imageUrl = preview['image_url'] as String?;
    if (title == null) return const SizedBox.shrink();

    return InkWell(
      onTap: () => launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 320),
        decoration: BoxDecoration(
          color: KodaColors.elevated,
          borderRadius: BorderRadius.circular(8),
          border: Border(left: BorderSide(color: KodaColors.koda, width: 3)),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          if (imageUrl != null)
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(6)),
              child: Image.network(imageUrl, fit: BoxFit.cover, height: 140, width: double.infinity,
                  errorBuilder: (_, __, ___) => const SizedBox.shrink()),
            ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(title,
                  style: TextStyle(color: KodaColors.koda, fontSize: 13, fontWeight: FontWeight.w600),
                  maxLines: 2, overflow: TextOverflow.ellipsis),
              if (description != null) ...[
                const SizedBox(height: 2),
                Text(description,
                    style: TextStyle(color: KodaColors.text3, fontSize: 11),
                    maxLines: 2, overflow: TextOverflow.ellipsis),
              ],
            ]),
          ),
        ]),
      ),
    );
  }

  Future<void> _showUserProfile(Map<String, dynamic>? author) async {
    if (author == null) return;
    final me = ref.read(authProvider).user;
    final userId = author['id'] as String? ?? '';
    if (userId == me?.id) return;
    final t = AppLocalizations.of(context);
    final username = author['username'] as String? ?? t.dmUnknownUser;
    final avatarUrl = author['avatar_url'] as String?;

    final status = await KodaApi.instance.getFriendStatus(userId);
    if (!mounted) return;
    final isFriend = status?['friends'] == true;
    final canDm = status?['can_dm'] == true;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: KodaColors.card,
        content: SizedBox(
          width: 280,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            KodaAvatar(username: username, size: 64, avatarUrl: avatarUrl),
            const SizedBox(height: 12),
            Text(withPronouns(username, author), style: TextStyle(color: KodaColors.text1,
                fontSize: 18, fontWeight: FontWeight.w700)),
            const SizedBox(height: 16),
            if (isFriend)
              Text(t.homeAreFriends,
                  style: TextStyle(color: KodaColors.koda, fontSize: 12)),
            const SizedBox(height: 12),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              if (!isFriend)
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: KodaColors.koda,
                    foregroundColor: Colors.black,
                  ),
                  icon: const Icon(Icons.person_add_outlined, size: 16),
                  label: Text(t.homeAddFriend),
                  onPressed: () async {
                    Navigator.pop(context);
                    final ok = await KodaApi.instance.sendFriendRequest(userId);
                    if (ok && mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(t.homeFriendRequestSent(username))));
                    }
                  },
                ),
              if (canDm) ...[
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: KodaColors.elevated,
                    foregroundColor: KodaColors.text1,
                  ),
                  icon: const Icon(Icons.message_outlined, size: 16),
                  label: Text(t.homeMessageButton),
                  onPressed: () async {
                    Navigator.pop(context);
                    final convo = await KodaApi.instance.getOrCreateConversation(userId);
                    if (convo != null && mounted) {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (_) => DmScreen(initialConversationId: convo['id'] as String)));
                    }
                  },
                ),
              ],
            ]),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                foregroundColor: KodaColors.koda,
                side: BorderSide(color: KodaColors.koda),
              ),
              icon: const Icon(Icons.volunteer_activism, size: 16),
              label: Text(t.homeSendTip),
              onPressed: () {
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (_) => TipDialog(recipient: author, serverId: widget.serverId),
                );
              },
            ),
          ]),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context),
              child: Text(t.commonClose)),
        ],
      ),
    );
  }

  String _formatTime(dynamic raw) {
    if (raw == null) return '';
    try {
      final s = raw.toString();
      final dt = DateTime.tryParse(s)?.toLocal();
      if (dt == null) return '';
      final h = dt.hour % 12 == 0 ? 12 : dt.hour % 12;
      final m = dt.minute.toString().padLeft(2, '0');
      return '$h:$m ${dt.hour >= 12 ? 'PM' : 'AM'}';
    } catch (_) {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Column(children: [
      Expanded(
        child: ListView.builder(
          controller: _scroll,
          padding: const EdgeInsets.all(12),
          itemCount: _messages.length,
          itemBuilder: (_, i) {
            final m = _messages[i];
            final author =
                (m['author'] as Map<String, dynamic>?)?['username'] as String? ??
                (m['sender_id'] as String?)?.substring(0, 6) ??
                'Unknown';
            final time = _formatTime(m['inserted_at']);
            const canDelete = true; // server enforces permission
            final isMine = m['sender_id'] == ref.read(authProvider).user?.id;
            final isPinned = m['pinned_at'] != null;
            final isEdited = m['edited_at'] != null;
            final messageChannelId = m['channel_id'] as String? ?? widget.channelId;
            return GestureDetector(
              onSecondaryTapUp: (d) => _showMessageActionMenu(
                  d.globalPosition, m, messageChannelId, isMine: isMine, isPinned: isPinned, canDelete: canDelete),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    KodaTappable(
                      semanticLabel: t.homeViewProfile(author),
                      borderRadius: BorderRadius.circular(15),
                      onTap: () => _showUserProfile(m['author'] as Map<String, dynamic>?),
                      child: KodaAvatar(
                        username: author,
                        size: 28,
                        avatarUrl: (m['author'] as Map<String, dynamic>?)?['avatar_url'] as String?,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Flexible(
                                child: Text(withPronouns(author, m['author'] as Map<String, dynamic>?),
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: KodaColors.koda,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600)),
                              ),
                              if (time.isNotEmpty) ...[
                                const SizedBox(width: 6),
                                Text(time,
                                    style: TextStyle(color: KodaColors.text3, fontSize: 10)),
                              ],
                              if (isEdited) ...[
                                const SizedBox(width: 4),
                                Text('(edited)',
                                    style: TextStyle(color: KodaColors.text3, fontSize: 9)),
                              ],
                              if (isPinned) ...[
                                const SizedBox(width: 4),
                                Icon(Icons.push_pin, size: 10, color: KodaColors.gold),
                              ],
                            ],
                          ),
                          const SizedBox(height: 2),
                          if (m['reply_to'] != null)
                            _buildReplyPreview(m['reply_to'] as Map<String, dynamic>),
                          if (m['_decryptPending'] == true)
                            Text(t.homeWaitingForKey,
                                style: TextStyle(color: KodaColors.text3,
                                    fontSize: 12, fontStyle: FontStyle.italic))
                          else if (m['_decryptFailed'] == true)
                            Text(t.homeUnableToDecrypt,
                                style: TextStyle(color: KodaColors.accent,
                                    fontSize: 12, fontStyle: FontStyle.italic))
                          else if ((m['content'] as String? ?? '').isNotEmpty)
                            Text.rich(TextSpan(children: renderMessageWithEmoji(
                                m['content'] as String, _serverEmoji(),
                                TextStyle(color: KodaColors.text1, fontSize: 13)))),
                          if (m['attachment_url'] != null) ...[
                            const SizedBox(height: 4),
                            _buildAttachment(m),
                          ],
                          if (m['link_preview'] != null) ...[
                            const SizedBox(height: 4),
                            _buildLinkPreview(m['link_preview'] as Map<String, dynamic>),
                          ],
                          _buildReactions(m),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      if (_replyingTo != null)
        Container(
          color: KodaColors.elevated,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Row(children: [
            Icon(Icons.reply, size: 12, color: KodaColors.koda),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                t.homeReplyingTo((_replyingTo!['author'] as Map<String, dynamic>?)?['username'] ?? t.dmUnknownUser),
                style: TextStyle(color: KodaColors.text3, fontSize: 11),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            IconButton(
              icon: Icon(Icons.close, size: 12, color: KodaColors.text3),
              tooltip: t.homeCancelReplyTooltip,
              onPressed: () => setState(() => _replyingTo = null),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ]),
        ),
      if (_pendingAttachment != null)
        Container(
          color: KodaColors.elevated,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Row(children: [
            Icon(Icons.attach_file, size: 12, color: KodaColors.koda),
            const SizedBox(width: 6),
            Expanded(
              child: Text(_pendingAttachment!['fileName'] ?? t.homeAttachmentFallback,
                  style: TextStyle(color: KodaColors.text3, fontSize: 11),
                  overflow: TextOverflow.ellipsis),
            ),
            IconButton(
              icon: Icon(Icons.close, size: 12, color: KodaColors.text3),
              tooltip: t.homeRemoveAttachmentTooltip,
              onPressed: () => setState(() => _pendingAttachment = null),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ]),
        ),
      Padding(
        padding: const EdgeInsets.all(10),
        child: Row(children: [
          IconButton(
            iconSize: 18,
            icon: _uploadingAttachment
                ? SizedBox(width: 16, height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2, color: KodaColors.koda))
                : Icon(Icons.attach_file, color: KodaColors.text2),
            tooltip: t.homeAttachFileTooltip,
            onPressed: _uploadingAttachment ? null : _pickAttachment,
          ),
          IconButton(
            iconSize: 18,
            icon: Icon(Icons.gif_box_outlined, color: KodaColors.text2),
            tooltip: t.homeGifTooltip,
            onPressed: _pickGif,
          ),
          Expanded(
            child: KodaTextField(
              controller: _messageController,
              hintText: t.homeMessageHint(''),
              onChanged: (_) {
                KodaSocket.instance.push('channel:${widget.channelId}', 'typing', {'typing': true});
              },
              onSubmitted: (_) => _sendMessage(),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            iconSize: 18,
            icon: Icon(Icons.send, color: KodaColors.koda),
            tooltip: t.homeSendMessageTooltip,
            onPressed: _sendMessage,
          ),
        ]),
      ),
    ]);
  }
}
