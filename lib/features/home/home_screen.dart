// lib/features/home/home_screen.dart

import 'dart:async';
import 'dart:io' show File;
import 'package:file_picker/file_picker.dart';
import 'package:local_notifier/local_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/api.dart';
import '../../core/last_channel_prefs.dart';
import '../../core/platform.dart';
import '../../core/theme.dart';
import '../../core/providers.dart';
import '../../core/uploader.dart';
import '../../shared/widgets.dart';
import '../../shared/channel_edit_dialog.dart';
import '../../shared/toast.dart';
import '../../shared/custom_emoji.dart';
import '../../shared/pronoun_label.dart';
import '../../core/push_notifications.dart';
import '../../core/deep_links.dart';
import '../../shared/invite_preview_dialog.dart';
import '../../shared/report_dialog.dart';
import '../../shared/category_edit_dialog.dart';
import '../settings/settings_screen.dart';
import '../settings/content_filters_screen.dart';
import '../server/server_settings_screen.dart';
import '../voice/voice_bar.dart';
import '../../core/voice_session.dart';
import '../dm/dm_screen.dart';
import '../../core/socket.dart';
import '../../core/link_preview.dart';
import '../../core/message_utils.dart';
import '../../core/secure_storage.dart';
import '../../core/crypto/channel_key_manager.dart';
import '../../core/time_utils.dart';
import 'package:phoenix_socket/phoenix_socket.dart';
import '../gallery/gallery_screen.dart';
import '../stage/stage_screen.dart';
import '../server/rules_screen.dart';
import '../server/calendar_screen.dart';
import '../marketplace/marketplace_screen.dart';
import '../marketplace/tip_dialog.dart';
import '../server/role_select_screen.dart';
import '../../shared/notification_bell.dart';
import '../../shared/member_panel.dart';
import '../../core/notifications_provider.dart';
import '../admin/admin_screen.dart';
import 'message_search_dialog.dart';
import 'gif_picker_dialog.dart';
import '../visp/visp_setup_dialog.dart';

const _kQuickReactions = ['👍', '❤️', '😂', '😮', '😢', '😡'];
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});
  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends ConsumerState<HomeScreen> with WidgetsBindingObserver {
  List<Map<String, dynamic>> _servers = [];
  List<Map<String, dynamic>> _channels = [];
  List<Map<String, dynamic>> _categories = [];
  List<Map<String, dynamic>> _roles = [];
  List<Map<String, dynamic>> _members = [];
  Map<String, bool> _myPermissions = {};
  bool _isServerOwnerOrAdmin = false;
  List<Map<String, dynamic>> _messages = [];

  bool _showingDms = false;
  bool _showingMarketplace = false;
  bool _loadingServers = true;
  Map<String, dynamic> _contentFilters = {};
  String? _activeChannelId;
  final _messageController = TextEditingController();
  final _scroll = ScrollController();
  Map<String, dynamic>? _replyingTo;
  Map<String, String>? _pendingAttachment; // {url, contentType, fileName}
  bool _uploadingAttachment = false;
  bool _showMemberPanel = true;
  final Set<String> _expandedThreads = {};
  Map<String, int> _channelUnread = {};
  // :name shortcode autocomplete matches for the currently-typed,
  // not-yet-closed token (see _updateShortcodeMatches). Empty hides the
  // suggestion row entirely.
  List<Map<String, dynamic>> _shortcodeMatches = [];
  // Channels with an unread @mention or @role pending -- rendered as a
  // distinct (red, not violet) badge from plain unread, per
  // notifications carrying type "mention"/"role_mention" (see
  // _subscribeToUserNotifications and Koda.Chat.push_notification
  // server-side). Cleared the same place _channelUnread is zeroed.
  final Set<String> _channelsWithMentions = {};
  final Map<String, List<Map<String, dynamic>>> _voiceOccupants = {};
  final Set<String> _voiceTopics = {};
  StreamSubscription<String>? _deepLinkSub;
  // Set right before switching to the DM tab in response to a tapped
  // dm_message push/notification -- see _routeToNotification. Passed as
  // DmScreen's initialConversationId so it jumps straight to that
  // conversation once its list loads, instead of landing on the bare list.
  String? _pendingDmConversationId;
  StreamSubscription<RemoteMessage>? _pushTapSub;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _loadServers();
    _loadUnreadCounts();
    _loadContentFilters();
    PushNotifications.instance.init();
    _subscribeDeepLinks();
    _subscribePushTaps();
  }

  // Mobile OS networking gets suspended while backgrounded, and can drop
  // the live Phoenix socket outright (killed process, a network change
  // the OS didn't bother waking the app to handle, etc.) -- resuming to a
  // dead socket would otherwise sit silently stale until the user happens
  // to tap something that incidentally reconnects it. Desktop rarely
  // backgrounds this way (and window focus isn't app lifecycle), but the
  // check is cheap and correct there too.
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) _onResumed();
  }

  Future<void> _onResumed() async {
    if (!KodaSocket.instance.isConnected) {
      // The socket died while backgrounded -- _channels was cleared by
      // KodaSocket's own closeStream handler, so every rejoin below
      // starts clean (no duplicate listeners on a channel object that's
      // already gone).
      await _subscribeToUserNotifications();
      if (_channels.isNotEmpty) _subscribeVoicePresence();
      final activeChannel = ref.read(selectedChannelProvider);
      if (activeChannel != null && activeChannel['type'] == 'text') {
        _selectChannel(activeChannel);
      }
    }
    // Cheap either way, and catches anything that changed server-side
    // while backgrounded that push didn't cover (e.g. read state from
    // another device) even when the socket never actually dropped.
    // Deliberately NOT _loadServers() -- it unconditionally jumps to
    // servers.first (see its own body), which would yank the user back
    // to their first server on every resume regardless of what they
    // were actually looking at.
    _loadUnreadCounts();
    ref.read(notificationsProvider.notifier).load();
  }

  // A tapped OS push notification should land on the same screen a live
  // in-app notification tap would -- see _routeToNotification. Cold-start
  // (app was killed) and warm-resume (app was backgrounded) taps arrive
  // through two different PushNotifications APIs; see its doc comments
  // for why they can't share one code path.
  Future<void> _subscribePushTaps() async {
    _pushTapSub = PushNotifications.instance.onNotificationTap.listen(
        (msg) => _routeToNotification(msg.data['type'] as String?, msg.data));
    await PushNotifications.instance.init();
    final pending = PushNotifications.instance.consumePendingTap();
    if (pending != null) {
      _routeToNotification(pending.data['type'] as String?, pending.data);
    }
  }

  // Reaching HomeScreen means the user is authenticated (see main.dart's
  // AuthGate), so this is the one place that both (a) can actually show
  // the invite preview dialog and (b) needs to pick up a link that arrived
  // before login and was held by DeepLinks.consumePendingInviteCode().
  Future<void> _subscribeDeepLinks() async {
    await DeepLinks.instance.init();
    _deepLinkSub = DeepLinks.instance.inviteCodes.listen(_handleInviteDeepLink);
    final pending = DeepLinks.instance.consumePendingInviteCode();
    if (pending != null) _handleInviteDeepLink(pending);
  }

  Future<void> _handleInviteDeepLink(String code) async {
    if (!mounted) return;
    final joined = await showInvitePreviewDialog(context, code);
    if (joined && mounted) _loadServers();
  }

  // Routes a tapped push notification (see push_notifications.dart's
  // onTap wiring) or a live in-app notification tap to the screen it's
  // actually about, using the same `data` shape _isCurrentlyViewing
  // already reads (channel_id/server_id for mention/role_mention,
  // conversation_id for dm_message). Anything else (payment
  // confirmations, etc.) has no single screen to jump to, so it's left
  // as a no-op -- tapping those just opens the app to wherever it was.
  Future<void> _routeToNotification(String? type, Map<String, dynamic>? data) async {
    if (data == null || !mounted) return;
    switch (type) {
      case 'mention':
      case 'role_mention':
        final serverId = data['server_id'] as String?;
        final channelId = data['channel_id'] as String?;
        if (serverId == null || channelId == null) return;
        var server = _servers.cast<Map<String, dynamic>?>().firstWhere(
            (s) => s?['id'] == serverId, orElse: () => null);
        if (server == null) {
          await _loadServers();
          if (!mounted) return;
          server = _servers.cast<Map<String, dynamic>?>().firstWhere(
              (s) => s?['id'] == serverId, orElse: () => null);
        }
        if (server == null) return;
        await _selectServer(server);
        if (!mounted) return;
        final channel = _channels.cast<Map<String, dynamic>?>().firstWhere(
            (c) => c?['id'] == channelId, orElse: () => null);
        if (channel != null) _selectChannel(channel);
        break;

      case 'dm_message':
        final conversationId = data['conversation_id'] as String?;
        if (conversationId == null) return;
        setState(() {
          _showingDms = true;
          _pendingDmConversationId = conversationId;
        });
        break;
    }
  }

  // A standard account's personal hide/warn/show preferences (see
  // content_filters_screen.dart) -- irrelevant for a child session,
  // whose labeled channels are already hard-blocked server-side and
  // simply never appear in _channels to begin with.
  Future<void> _loadContentFilters() async {
    final settings = await KodaApi.instance.getSettings();
    if (!mounted) return;
    setState(() {
      _contentFilters = Map<String, dynamic>.from(settings['content_filters'] as Map? ?? {});
    });
  }

  String _labelSettingFor(Map<String, dynamic> channel) => effectiveFilterSetting(
      List<String>.from(channel['content_labels'] as List? ?? []), _contentFilters);

  String _announcementTooltip(Map<String, dynamic> channel) {
    const base = 'Announcement channel -- only staff may post';
    final roleIds = List<String>.from(channel['announcement_role_ids'] as List? ?? []);
    if (roleIds.isEmpty) return base;
    final names = roleIds
        .map((id) => _roles.cast<Map<String, dynamic>?>().firstWhere(
              (r) => r?['id'] == id, orElse: () => null)?['name'] as String?)
        .whereType<String>()
        .toList();
    if (names.isEmpty) return base;
    return '$base. Posting here notifies ${names.map((n) => '@$n').join(', ')}.';
  }

  Future<void> _loadUnreadCounts() async {
    final counts = await KodaApi.instance.getUnreadCounts();
    if (!mounted) return;
    setState(() => _channelUnread = Map<String, int>.from(counts['channels'] ?? {}));
  }


  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    if (_activeChannelId != null) {
      KodaSocket.instance.leave('channel:$_activeChannelId');
    }
    for (final topic in _voiceTopics) {
      KodaSocket.instance.leave(topic);
    }
    _deepLinkSub?.cancel();
    _pushTapSub?.cancel();
    _messageController.dispose();
    _scroll.dispose();
    super.dispose();
  }
  Future<void> _subscribeToUserNotifications() async {
    final user = ref.read(authProvider).user;
    if (user == null) return;
    final ch = await KodaSocket.instance.channelAsync('user:${user.id}');
    ch?.messages.listen((msg) {
      if (!mounted) return;
      if (msg.event == const PhoenixChannelEvent.custom('notification')) {
        final payload = msg.payload as Map<String, dynamic>?;
        if (payload != null) {
          ref.read(notificationsProvider.notifier).addNotification(payload);

          // Don't pop a toast/tray notification for something the user is
          // already looking at right now -- a mention in the channel
          // that's open, or a message in the DM conversation that's open.
          // Other notification types (payments, etc.) have no "currently
          // viewing" concept, so they're never suppressed.
          if (!_isCurrentlyViewing(payload)) {
            // Show system tray notification (location only, no content)
            _showTrayNotification(payload);
            // In-app toast -- title only (e.g. "Mentioned in #general" /
            // "Alex sent you a message"), never the notification body, so
            // it can never leak message content to anyone glancing at the
            // screen.
            _showNotificationToast(payload);
          }

          // A mention/role-mention (as opposed to plain channel activity)
          // gets its own distinct badge in the sidebar -- see
          // _channelsWithMentions' doc comment.
          final type = payload['type'] as String?;
          final data = payload['data'] as Map<String, dynamic>?;
          final channelId = data?['channel_id'] as String?;
          if (channelId != null && (type == 'mention' || type == 'role_mention')) {
            setState(() => _channelsWithMentions.add(channelId));
          }
        }
      } else if (msg.event == const PhoenixChannelEvent.custom('unread_bump')) {
        // A channel this user can see got a new message while they
        // weren't viewing it -- bump its sidebar badge live instead of
        // only ever refreshing once at startup (see
        // Koda.Chat.broadcast_unread_bump/2 server-side).
        final payload = msg.payload as Map<String, dynamic>?;
        final channelId = payload?['channel_id'] as String?;
        if (channelId != null && channelId != _activeChannelId) {
          setState(() => _channelUnread = {
                ..._channelUnread,
                channelId: (_channelUnread[channelId] ?? 0) + 1,
              });
        }
      }
    });
  }

  void _showTrayNotification(Map<String, dynamic> notif) {
    // local_notifier only ships Windows/macOS/Linux implementations --
    // mobile push is a separate roadmap item (APNs/FCM), not this.
    if (!isDesktop) return;
    final title = notif['title'] as String? ?? 'Koda';
    final notification = LocalNotification(
      title: 'Koda',
      body: title,
    );
    notification.show();
  }

  bool _isCurrentlyViewing(Map<String, dynamic> notif) {
    final type = notif['type'] as String?;
    final data = notif['data'] as Map<String, dynamic>?;
    switch (type) {
      case 'mention':
      case 'role_mention':
        final channelId = data?['channel_id'] as String?;
        return channelId != null && channelId == _activeChannelId;
      case 'dm_message':
        final conversationId = data?['conversation_id'] as String?;
        return _showingDms &&
            conversationId != null &&
            conversationId == ref.read(activeConversationProvider);
      default:
        return false;
    }
  }

  IconData _iconForNotificationType(String? type) {
    switch (type) {
      case 'mention':
      case 'role_mention':
        return Icons.alternate_email;
      case 'dm_message':
        return Icons.mail_outline;
      default:
        return Icons.notifications_none;
    }
  }

  void _showNotificationToast(Map<String, dynamic> notif) {
    final title = notif['title'] as String?;
    if (title == null || title.isEmpty) return;
    showKodaToast(context, title: title, icon: _iconForNotificationType(notif['type'] as String?));
  }









  Future<void> _loadServers() async {
    setState(() => _loadingServers = true);
    final servers = await KodaApi.instance.getServers();
    if (!mounted) return;
    setState(() {
      _servers = servers;
      _loadingServers = false;
    });
    // Load notifications and subscribe to real-time updates
    ref.read(notificationsProvider.notifier).load();
    _subscribeToUserNotifications();
    if (servers.isNotEmpty) _selectServer(servers.first);

  }

  Future<void> _selectServer(Map<String, dynamic> server) async {
    setState(() { _showingDms = false; _showingMarketplace = false; });
    ref.read(selectedServerProvider.notifier).state = server;
    ref.read(selectedChannelProvider.notifier).state = null;
    final results = await Future.wait([
      KodaApi.instance.getChannels(server['id']),
      KodaApi.instance.getCategories(server['id']),
    ]);
    if (!mounted) return;
    setState(() {
      _channels = results[0];
      _categories = results[1];
    });
    // _channels only ever contains channels this user can currently
    // view (server-side filtered, see ChannelController.index/2) --
    // the remembered id is looked up against that already-scoped list,
    // so a channel access lost since last visiting simply won't match
    // and this falls back to the old first-text-channel behavior.
    final lastChannelId = await LastChannelPrefs.get(server['id'] as String);
    final remembered = lastChannelId == null
        ? <String, dynamic>{}
        : _channels.firstWhere((c) => c['id'] == lastChannelId, orElse: () => {});
    final target = remembered.isNotEmpty
        ? remembered
        : _channels.firstWhere((c) => c['type'] == 'text', orElse: () => {});
    if (target.isNotEmpty) _selectChannel(target);
    _subscribeVoicePresence();
    _loadMyPermissions(server);
  }

  /// What the current user can do in [server] -- computed client-side
  /// from their roles' permissions (or owner/admin bypass), purely to
  /// decide what moderation UI to show. The server re-checks everything
  /// independently; this is about not showing a Kick/Ban/Edit Channel
  /// button to someone who'd just get a 403, not a security boundary.
  Future<void> _loadMyPermissions(Map<String, dynamic> server) async {
    final serverId = server['id'] as String;
    final me = ref.read(authProvider).user;
    final isOwner = server['owner_id'] == me?.id || (me?.isAdmin ?? false);

    final results = await Future.wait([
      KodaApi.instance.getMembers(serverId),
      KodaApi.instance.getRoles(serverId),
    ]);
    if (!mounted || ref.read(selectedServerProvider)?['id'] != serverId) return;
    final members = results[0];
    final roles = results[1];

    final myMember = members
        .where((m) => m['user_id'] == me?.id)
        .cast<Map<String, dynamic>?>()
        .firstOrNull;
    final myRoleIds = <String>{
      for (final r in (myMember?['roles'] as List? ?? [])) r['id'] as String,
    };
    final permissions = <String, bool>{};
    for (final role in roles) {
      if (!myRoleIds.contains(role['id'])) continue;
      final perms = role['permissions'] as Map<String, dynamic>? ?? {};
      perms.forEach((k, v) { if (v == true) permissions[k] = true; });
    }

    setState(() {
      _roles = roles;
      _members = members;
      _myPermissions = permissions;
      _isServerOwnerOrAdmin = isOwner;
    });
  }

  bool _can(String permission) =>
      _isServerOwnerOrAdmin || (_myPermissions[permission] ?? false);

  // "Who's in this voice channel" for every voice channel in the current
  // server -- separate from actually joining one via LiveKit.
  Future<void> _subscribeVoicePresence() async {
    for (final topic in _voiceTopics) {
      KodaSocket.instance.leave(topic);
    }
    _voiceTopics.clear();
    if (mounted) setState(() => _voiceOccupants.clear());

    for (final c in _channels.where((c) => c['type'] == 'voice')) {
      final channelId = c['id'] as String;
      final topic = 'voice:$channelId';
      _voiceTopics.add(topic);
      final ch = await KodaSocket.instance.channelAsync(topic);
      ch?.messages.listen((msg) {
        if (!mounted) return;
        if (msg.event == const PhoenixChannelEvent.custom('voice_state')) {
          final payload = msg.payload as Map<String, dynamic>?;
          final participants = List<Map<String, dynamic>>.from(payload?['participants'] ?? []);
          setState(() => _voiceOccupants[channelId] = participants);
        } else if (msg.event == const PhoenixChannelEvent.custom('voice_participant_joined')) {
          final payload = msg.payload as Map<String, dynamic>?;
          if (payload == null) return;
          setState(() {
            final existing = _voiceOccupants[channelId] ?? [];
            if (!existing.any((p) => p['user_id'] == payload['user_id'])) {
              _voiceOccupants[channelId] = [...existing, payload];
            }
          });
        } else if (msg.event == const PhoenixChannelEvent.custom('voice_participant_left')) {
          final payload = msg.payload as Map<String, dynamic>?;
          final userId = payload?['user_id'];
          if (userId == null) return;
          setState(() {
            _voiceOccupants[channelId] =
                (_voiceOccupants[channelId] ?? []).where((p) => p['user_id'] != userId).toList();
          });
        }
      });
    }
  }



  /// Entry point for tapping a channel in the sidebar -- interposes the
  /// content-warning interstitial (every visit, for v1 -- see
  /// content_filters_screen.dart) ahead of the normal open flow when the
  /// viewer's own preference for this channel's labels is "warn".
  Future<void> _openChannel(Map<String, dynamic> channel) async {
    if (_labelSettingFor(channel) == 'warn') {
      final proceed = await _showContentWarningDialog(channel);
      if (proceed != true) return;
    }
    if (channel['type'] == 'voice') {
      _joinVoice(channel);
    } else {
      _selectChannel(channel);
    }
  }

  Future<bool?> _showContentWarningDialog(Map<String, dynamic> channel) {
    final labels = List<String>.from(channel['content_labels'] as List? ?? []);
    final names = labels.map((l) => kContentLabelNames[l] ?? l).join(', ');
    return showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: Row(children: [
          Icon(Icons.warning_amber_rounded, color: KodaColors.gold, size: 20),
          SizedBox(width: 8),
          Text('Content Warning', style: TextStyle(color: KodaColors.text1)),
        ]),
        content: Text(
          'This channel is flagged for: $names.\n\nChange this in Settings > Security > Content Filters.',
          style: TextStyle(color: KodaColors.text2, fontSize: 13),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text('View Anyway', style: TextStyle(color: KodaColors.koda)),
          ),
        ],
      ),
    );
  }

  Future<void> _selectChannel(Map<String, dynamic> channel) async {
    final channelId = channel['id'] as String;
    if (_showingMarketplace) setState(() => _showingMarketplace = false);
    ref.read(selectedChannelProvider.notifier).state = channel;

    // Leave the previous channel's socket topic
    if (_activeChannelId != null && _activeChannelId != channelId) {
      KodaSocket.instance.leave('channel:$_activeChannelId');
    }


    // Rules channel -- show rules screen
    if (channel['type'] == 'rules') {
      final server = ref.read(selectedServerProvider);
      if (server == null) return;
      final rules = await KodaApi.instance.getServerRules(server['id'] as String);
      if (!mounted) return;
      if (rules != null && rules['accepted'] != true && rules['rules'] != null) {
        await Navigator.push(context, MaterialPageRoute(
          builder: (_) => RulesScreen(
            serverId: server['id'] as String,
            serverName: server['name'] as String? ?? '',
            rulesContent: rules['rules'] as String,
            onAccepted: () => Navigator.pop(context),
          ),
        ));
      }
      return;
    }

    // Role-select channel
    if (channel['type'] == 'role-select') {
      final server = ref.read(selectedServerProvider);
      if (server == null) return;
      await Navigator.push(context, MaterialPageRoute(
        builder: (_) => RoleSelectScreen(
          serverId: server['id'] as String,
          channelName: channel['name'] as String? ?? 'Role Selection',
        ),
      ));
      return;
    }

    // Stage channels push a route -- handled separately from text
    // Rules channel -- show rules content
    if (channel['type'] == 'rules') {
      final server = ref.read(selectedServerProvider);
      if (server == null) return;
      final rules = await KodaApi.instance.getServerRules(server['id'] as String);
      if (!mounted) return;
      if (rules != null && rules['rules'] != null) {
        final accepted = rules['accepted'] == true;
        await Navigator.push(context, MaterialPageRoute(
          builder: (_) => RulesScreen(
            serverId: server['id'] as String,
            serverName: server['name'] as String? ?? '',
            rulesContent: rules['rules'] as String,
            onAccepted: () => Navigator.pop(context),
            alreadyAccepted: accepted,
          ),
        ));
      }
      return;
    }

    // Role-select channel
    if (channel['type'] == 'role-select') {
      final server = ref.read(selectedServerProvider);
      if (server == null) return;
      await Navigator.push(context, MaterialPageRoute(
        builder: (_) => RoleSelectScreen(
          serverId: server['id'] as String,
          channelName: channel['name'] as String? ?? 'Role Selection',
        ),
      ));
      return;
    }

    if (channel['type'] == 'stage') {
      ref.read(selectedChannelProvider.notifier).state = channel;
      await Navigator.push(context, MaterialPageRoute(
        builder: (_) => StageScreen(channel: channel),
      ));
      if (mounted) _returnToTextChannel();
      return;
    }

    if (channel['type'] == 'text') {
      final myUserId = ref.read(authProvider).user?.id;
      if (myUserId == null) return;

      final messages = await KodaApi.instance.getMessages(channelId);
      if (!mounted) return;
      final stillSelected =
          ref.read(selectedChannelProvider)?['id'] == channelId;
      if (!stillSelected) return;

      // Fire-and-forget: if this device already holds the current epoch
      // key, top up delivery to anyone who's missing it (a new joiner,
      // or someone who was offline the first time around) -- without
      // this, a channel only onboards new members the next time someone
      // happens to send a message rather than the moment anyone opens it.
      // serverId (when known) also drives Tier 3 threshold-share
      // distribution -- see ChannelKeyManager.ensureReady.
      unawaited(ChannelKeyManager.instance.ensureReady(channelId,
          myUserId: myUserId, serverId: ref.read(selectedServerProvider)?['id'] as String?));

      final decrypted = await _decryptMessages(messages.reversed.toList(),
          channelId: channelId, myUserId: myUserId);
      if (!mounted) return;
      setState(() {
        _messages = decrypted;
        _activeChannelId = channelId;
        _channelUnread = {..._channelUnread, channelId: 0};
        _channelsWithMentions.remove(channelId);
      });
      KodaApi.instance.markChannelRead(channelId);
      final currentServerId = ref.read(selectedServerProvider)?['id'] as String?;
      if (currentServerId != null) {
        unawaited(LastChannelPrefs.set(currentServerId, channelId));
      }

      // Subscribe to real-time messages for this channel
      final ch = await KodaSocket.instance.channelAsync('channel:$channelId');
      ch?.messages.listen((msg) {
        if (!mounted) return;
        if (msg.event == const PhoenixChannelEvent.custom('new_message')) {
          final payload = msg.payload as Map<String, dynamic>?;
          if (payload != null) {
            decryptMessages([payload], channelId: channelId, myUserId: myUserId).then((decoded) {
              if (mounted) setState(() => _messages.add(decoded.first));
            });
            // This channel is open and visible -- the message is immediately read.
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
              // The edit ciphertext replaces whatever plaintext was
              // cached for the pre-edit content -- invalidate that cache
              // entry first so decryptMessages actually decrypts the new
              // ciphertext instead of returning the stale cache hit.
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
  }

  // Resolves @everyone/@roleName/@username tokens in [text] against
  // already-loaded server roles/members, mirroring what the server used
  // to do itself by regex-scanning plaintext content -- now done here
  // instead, since an encrypted message's content isn't something the
  // server can read. Role matches take priority over username matches
  // for the same token, same as the old server-side behavior.
  ({bool everyone, List<String> userIds, List<String> roleIds}) _resolveMentions(String text) {
    final everyone = text.contains('@everyone') && _can('mention_everyone');
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
    final channel = ref.read(selectedChannelProvider);
    final text = _messageController.text.trim();
    final attachment = _pendingAttachment;
    if (channel == null || (text.isEmpty && attachment == null)) return;
    final replyToId = _replyingTo?['id'] as String?;
    setState(() { _replyingTo = null; _pendingAttachment = null; });
    _messageController.clear();

    final channelId = channel['id'] as String;
    final myUserId = ref.read(authProvider).user?.id;
    if (myUserId == null) return;

    // Every text channel is now end-to-end encrypted using a shared
    // per-channel key (see lib/core/crypto/channel_key_manager.dart) --
    // this bootstraps/rotates/distributes that key as needed and only
    // returns null if the channel genuinely isn't ready yet (e.g. still
    // waiting on another member's device to deliver the current key).
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
      setState(() => _messages.add({...msg, 'content': text}));
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

  // Fetches the OG preview for a just-sent message's URL on this (the
  // sender's) device and attaches it once ready -- fire-and-forget, a
  // failed or slow preview must never block the message that already sent.
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

  // Matches Koda.Upload's allowed_content_types server-side -- anything
  // else would upload fine here and then 422 on send.
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

  Future<List<Map<String, dynamic>>> _decryptMessages(
      List<Map<String, dynamic>> msgs,
      {required String channelId, required String myUserId}) =>
      decryptMessages(msgs, channelId: channelId, myUserId: myUserId);

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
    final ok = await ref.read(voiceSessionProvider.notifier).join(
      url:         result['url'] as String,
      token:       result['token'] as String,
      channelId:   channel['id'] as String,
      channelName: channel['name'] as String,
    );
    if (!ok && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not connect to voice.')));
    }
  }

  Future<void> _showAddServerMenu() async {
    final action = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(72, MediaQuery.of(context).size.height - 120,
          72, 120),
      color: KodaColors.card,
      items: const [
        PopupMenuItem(value: 'create', child: Text('Create Server')),
        PopupMenuItem(value: 'join',   child: Text('Join Server')),
        PopupMenuItem(value: 'redeem', child: Text('Redeem Code')),
      ],
    );
    if (action == 'create') _showCreateServerDialog();
    if (action == 'join')   _showJoinServerDialog();
    if (action == 'redeem') _showRedeemCodeDialog();
  }

  Future<void> _showJoinServerDialog() async {
    final ctrl = TextEditingController();
    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: Text('Join Server', style: TextStyle(color: KodaColors.text1)),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Text('Enter an invite code or URL:',
              style: TextStyle(color: KodaColors.text3, fontSize: 12)),
          const SizedBox(height: 10),
          KodaTextField(controller: ctrl, hintText: 'e.g. XK9MP2'),
        ]),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          TextButton(
            onPressed: () async {
              final raw = ctrl.text.trim();
              // Extract code from URL if pasted as full URL
              final code = raw.contains('/invite/')
                  ? raw.split('/invite/').last.trim()
                  : raw.toUpperCase();
              if (code.isEmpty) return;
              Navigator.pop(context);
              final result = await KodaApi.instance.redeemInvite(code);
              if (!mounted) return;
              if (result != null && result['ok'] == true) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Joined!')));
                _loadServers();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Invalid or expired invite code.')));
              }
            },
            child: const Text('Join'),
          ),
        ],
      ),
    );
  }

  Future<void> _showRedeemCodeDialog() async {
    final ctrl = TextEditingController();
    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: Text('Redeem Code', style: TextStyle(color: KodaColors.text1)),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Text('Enter your backer or reward code:',
              style: TextStyle(color: KodaColors.text3, fontSize: 12)),
          const SizedBox(height: 10),
          KodaTextField(controller: ctrl, hintText: 'Reward code'),
        ]),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          TextButton(
            onPressed: () async {
              final code = ctrl.text.trim().toUpperCase();
              if (code.isEmpty) return;
              Navigator.pop(context);
              final result = await KodaApi.instance.redeemBackerCode(code);
              if (!mounted) return;
              if (result != null && result['ok'] == true) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Code redeemed! Your rewards have been applied.')));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Invalid, expired, or already redeemed code.')));
              }
            },
            child: const Text('Redeem'),
          ),
        ],
      ),
    );
  }

  Future<void> _showUserProfile(BuildContext context, Map<String, dynamic>? author) async {
    if (author == null) return;
    final me = ref.read(authProvider).user;
    final userId = author['id'] as String? ?? '';
    if (userId == me?.id) return; // don't show profile for self
    final username = author['username'] as String? ?? 'Unknown';
    final avatarUrl = author['avatar_url'] as String?;

    // Check friendship status
    final status = await KodaApi.instance.getFriendStatus(userId);
    if (!context.mounted) return;
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
              Text('You are friends',
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
                  label: const Text('Add Friend'),
                  onPressed: () async {
                    Navigator.pop(context);
                    final ok = await KodaApi.instance.sendFriendRequest(userId);
                    if (ok && context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Friend request sent to $username!')));
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
                  label: const Text('Message'),
                  onPressed: () async {
                    Navigator.pop(context);
                    final convo = await KodaApi.instance.getOrCreateConversation(userId);
                    if (convo != null && context.mounted) {
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
              label: const Text('Send Tip'),
              onPressed: () {
                Navigator.pop(context);
                final server = ref.read(selectedServerProvider);
                showDialog(
                  context: context,
                  builder: (_) => TipDialog(
                    recipient: author,
                    serverId: server?['id'] as String?,
                  ),
                );
              },
            ),
          ]),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context),
              child: const Text('Close')),
        ],
      ),
    );
  }

  Future<void> _showServerContextMenu(
      Map<String, dynamic> server, Offset position) async {
    final user = ref.read(authProvider).user;
    final isOwner = server['owner_id'] == user?.id || (user?.isAdmin ?? false);
    // Permissions are only known for the currently-selected server (see
    // _loadMyPermissions) -- for any other server in the list this falls
    // back to owner-only, which is conservative rather than wrong.
    final isActiveServer = ref.read(selectedServerProvider)?['id'] == server['id'];
    final canModerate = isOwner || (isActiveServer && (
        _can('manage_server') || _can('manage_channels') || _can('manage_roles') ||
        _can('kick_members') || _can('ban_members')));
    final action = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
          position.dx, position.dy, position.dx, position.dy),
      color: KodaColors.card,
      items: [
        const PopupMenuItem(value: 'select',
            child: Text('Switch to Server')),
        const PopupMenuItem(value: 'invite',
            child: Text('Invite People')),
        if (canModerate)
          const PopupMenuItem(value: 'settings',
              child: Text('Server Settings')),
        PopupMenuItem(value: 'leave',
            child: Text('Leave Server',
                style: TextStyle(color: KodaColors.accent))),
      ],
    );
    if (!mounted) return;
    switch (action) {
      case 'select':
        _selectServer(server);
      case 'invite':
        _selectServer(server);
        // Open server settings to invites tab
        await Navigator.push(context, MaterialPageRoute(
            builder: (_) => const ServerSettingsScreen()));
      case 'settings':
        _selectServer(server);
        await Navigator.push(context, MaterialPageRoute(
            builder: (_) => const ServerSettingsScreen()));
      case 'leave':
        final confirmed = await showDialog<bool>(
          context: context,
          builder: (_) => AlertDialog(
            backgroundColor: KodaColors.card,
            content: Text('Leave ${server['name']}? You can rejoin with an invite.',
                style: TextStyle(color: KodaColors.text1)),
            actions: [
              TextButton(onPressed: () => Navigator.pop(context, false),
                  child: const Text('Cancel')),
              TextButton(onPressed: () => Navigator.pop(context, true),
                  child: Text('Leave',
                      style: TextStyle(color: KodaColors.accent))),
            ],
          ),
        );
        if (confirmed == true) {
          // Deliberately does NOT self-rotate encrypted channels here --
          // a leaving member generating their own "excluding" key would
          // still know it afterward, since they're the one who made it.
          // That only works when someone *else* does the rotating (see
          // the kick/ban flow in server_settings_screen.dart, where the
          // actor and the departing member are different people). A
          // voluntary leaver is cut off for real the next time any
          // remaining member's client rotates -- e.g. the next kick/ban,
          // or a future membership-diffing pass; not yet on leave itself.
          await KodaApi.instance.leaveServer(server['id'] as String);
          _loadServers();
        }
    }
  }

  Future<void> _showCreateServerDialog() async {
    final nameController = TextEditingController();
    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: Text('Create a server',
            style: TextStyle(color: KodaColors.text1)),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          KodaTextField(controller: nameController, hintText: 'Server name'),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton.icon(
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              onPressed: () {
                Navigator.pop(context);
                showVispSetupDialog(context, onApplied: (_) => _loadServers());
              },
              icon: Icon(Icons.auto_awesome, size: 14, color: KodaColors.koda),
              label: Text('Describe it to Visp instead',
                  style: TextStyle(color: KodaColors.koda, fontSize: 12)),
            ),
          ),
        ]),
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
            : parseServerTimestamp(raw.toString());
      }
      return DateFormat('MMM d, yyyy h:mm a').format(dt);
    } catch (_) {
      return '';
    }
  }

  Future<void> _showChannelContextMenu(
      Map<String, dynamic> channel, Offset position) async {
    final canManage = _can('manage_channels');
    final hasUnread = (_channelUnread[channel['id']] ?? 0) > 0;
    final action = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
          position.dx, position.dy, position.dx, position.dy),
      color: KodaColors.card,
      items: [
        if (hasUnread)
          const PopupMenuItem(value: 'mark_read', child: Text('Mark as Read')),
        if (canManage) ...[
          const PopupMenuItem(value: 'edit', child: Text('Edit Channel')),
          PopupMenuItem(value: 'delete',
              child: Text('Delete Channel', style: TextStyle(color: KodaColors.accent))),
        ],
      ],
    );
    if (!mounted || action == null) return;
    final channelId = channel['id'] as String;

    switch (action) {
      case 'mark_read':
        await KodaApi.instance.markChannelRead(channelId);
        if (mounted) {
          setState(() {
            _channelUnread = {..._channelUnread, channelId: 0};
            _channelsWithMentions.remove(channelId);
          });
        }

      case 'edit':
        await showChannelEditDialog(
          context,
          serverId: (ref.read(selectedServerProvider)?['id']) as String,
          categories: _categories,
          roles: _roles,
          existing: channel,
          onSaved: () {
            final server = ref.read(selectedServerProvider);
            if (server != null) _selectServer(server);
          },
        );

      case 'delete':
        final confirmed = await showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            backgroundColor: KodaColors.card,
            content: Text('Delete #${channel['name']}? This cannot be undone.',
                style: TextStyle(color: KodaColors.text1)),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(ctx, false),
                  child: const Text('Cancel')),
              TextButton(
                  onPressed: () => Navigator.pop(ctx, true),
                  child: Text('Delete',
                      style: TextStyle(color: KodaColors.accent))),
            ],
          ),
        );
        if (confirmed == true) {
          await KodaApi.instance.deleteChannel(channelId);
          final server = ref.read(selectedServerProvider);
          if (server != null) _selectServer(server);
        }
    }
  }

  Future<void> _showCategoryContextMenu(
      Map<String, dynamic> category, Offset position) async {
    if (!_can('manage_channels')) return;
    final action = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
          position.dx, position.dy, position.dx, position.dy),
      color: KodaColors.card,
      items: [
        PopupMenuItem(value: 'create_channel', child: Text('Create Channel Here')),
        PopupMenuItem(value: 'edit', child: Text('Edit Category')),
        PopupMenuItem(value: 'delete',
            child: Text('Delete Category', style: TextStyle(color: KodaColors.accent))),
      ],
    );
    if (!mounted || action == null) return;
    final serverId = ref.read(selectedServerProvider)?['id'] as String?;
    if (serverId == null) return;

    switch (action) {
      case 'create_channel':
        await showChannelEditDialog(
          context,
          serverId: serverId,
          categories: _categories,
          roles: _roles,
          categoryId: category['id'] as String,
          onSaved: () {
            final server = ref.read(selectedServerProvider);
            if (server != null) _selectServer(server);
          },
        );

      case 'edit':
        await showCategoryEditDialog(
          context,
          serverId: serverId,
          roles: _roles,
          existing: category,
          onSaved: () {
            final server = ref.read(selectedServerProvider);
            if (server != null) _selectServer(server);
          },
        );

      case 'delete':
        final confirmed = await showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            backgroundColor: KodaColors.card,
            content: Text(
                'Delete "${category['name']}"? Channels inside will become uncategorized.',
                style: TextStyle(color: KodaColors.text1)),
            actions: [
              TextButton(onPressed: () => Navigator.pop(ctx, false),
                  child: const Text('Cancel')),
              TextButton(onPressed: () => Navigator.pop(ctx, true),
                  child: Text('Delete', style: TextStyle(color: KodaColors.accent))),
            ],
          ),
        );
        if (confirmed == true) {
          await KodaApi.instance.deleteCategory(category['id']);
          final server = ref.read(selectedServerProvider);
          if (server != null) _selectServer(server);
        }
    }
  }

  Color _hexColor(String hex) {
    try {
      return Color(int.parse(hex.replaceFirst('#', '0xFF')));
    } catch (_) {
      return KodaColors.koda;
    }
  }

  List<Map<String, dynamic>> _currentServerEmoji() {
    final serverId = ref.read(selectedServerProvider)?['id'] as String?;
    if (serverId == null) return const [];
    return ref.watch(serverEmojiProvider(serverId)).value ?? const [];
  }

  Widget _buildReactions(Map<String, dynamic> m) {
    final reactions = m['reactions'] as List? ?? [];
    final me = ref.read(authProvider).user;
    final serverEmoji = _currentServerEmoji();
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
            return GestureDetector(
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
          GestureDetector(
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
    final serverEmoji = _currentServerEmoji();
    final emoji = await showDialog<String>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: Text('Add Reaction',
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
    final updated = await KodaApi.instance.addReaction(
        message['id'] as String, emoji);
    if (updated != null && mounted) {
      setState(() => message['reactions'] = updated);
    }
  }

  /// Looks at the text immediately before the cursor for an open,
  /// unterminated :name token (kOpenShortcodePattern) and updates
  /// _shortcodeMatches to whatever custom emoji currently match it as a
  /// prefix -- empty (hiding the suggestion row) once there's no such
  /// token, the token's too short, or nothing matches.
  void _updateShortcodeMatches(String text) {
    final cursor = _messageController.selection.baseOffset;
    if (cursor < 0) {
      if (_shortcodeMatches.isNotEmpty) setState(() => _shortcodeMatches = []);
      return;
    }
    final upToCursor = text.substring(0, cursor);
    final open = kOpenShortcodePattern.firstMatch(upToCursor);
    if (open == null) {
      if (_shortcodeMatches.isNotEmpty) setState(() => _shortcodeMatches = []);
      return;
    }
    final prefix = open.group(1)!.toLowerCase();
    final matches = _currentServerEmoji()
        .where((e) => (e['name'] as String).toLowerCase().startsWith(prefix))
        .take(8)
        .toList();
    setState(() => _shortcodeMatches = matches);
  }

  /// Replaces the open :name token the suggestion row is currently
  /// showing matches for with the full ":name: " (trailing space so the
  /// cursor lands ready to keep typing), then re-focuses the input.
  void _insertShortcode(Map<String, dynamic> emoji) {
    final text = _messageController.text;
    final cursor = _messageController.selection.baseOffset;
    if (cursor < 0) return;
    final upToCursor = text.substring(0, cursor);
    final open = kOpenShortcodePattern.firstMatch(upToCursor);
    if (open == null) return;

    final name = emoji['name'] as String;
    final newText = text.replaceRange(open.start, cursor, ':$name: ');
    final newCursor = open.start + name.length + 3;
    _messageController.value = TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newCursor),
    );
    setState(() => _shortcodeMatches = []);
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

  Future<void> _onReorderChannels(int oldIndex, int newIndex) async {
    if (newIndex > oldIndex) newIndex--;
    final server = ref.read(selectedServerProvider);
    if (server == null) return;
    final threads = _channels.where((c) => c['is_thread'] == true).toList();
    final regular = _channels.where((c) => c['is_thread'] != true).toList();
    final ordered = <Map<String, dynamic>>[];
    for (final c in regular.where((c) => c['category_id'] == null)) {
      ordered.add(c);
    }
    for (final cat in _categories) {
      ordered.addAll(regular.where((c) => c['category_id'] == cat['id']));
    }
    if (oldIndex >= ordered.length || newIndex >= ordered.length) return;
    final item = ordered.removeAt(oldIndex);
    ordered.insert(newIndex, item);
    final order = ordered.asMap().entries
        .map((e) => {'id': e.value['id'], 'position': e.key}).toList();
    setState(() {
      for (var i = 0; i < ordered.length; i++) {
        ordered[i]['position'] = i;
      }
      _channels = [...ordered, ...threads];
    });
    await KodaApi.instance.reorderChannels(server['id'] as String, order);
  }
  List<Widget> _buildChannelList(Map<String, dynamic>? selectedChannel) {
    // "Hide" is a personal preference applied purely client-side here --
    // a child account never sees a labeled channel in _channels to begin
    // with, since the server already omits those for them.
    final visible = _channels.where((c) => _labelSettingFor(c) != 'hide').toList();
    final threads = visible.where((c) => c['is_thread'] == true).toList();
    final regular = visible.where((c) => c['is_thread'] != true).toList();
    final result = <Widget>[];

    for (final c in regular.where((c) => c['category_id'] == null)) {
      result.add(_buildChannelTile(c, selectedChannel));
      final cThreads = threads.where((t) =>
          (t['parent_message_id'] ?? '') != '').toList();
      if (cThreads.isNotEmpty) {
        result.add(ListTile(
          dense: true,
          contentPadding: const EdgeInsets.only(left: 16),
          leading: Icon(
            _expandedThreads.contains(c['id'])
                ? Icons.expand_less : Icons.expand_more,
            size: 14, color: KodaColors.text3),
          title: Text('${cThreads.length} thread${cThreads.length == 1 ? '' : 's'}',
              style: TextStyle(color: KodaColors.text3, fontSize: 11)),
          onTap: () => setState(() {
            if (_expandedThreads.contains(c['id'])) {
              _expandedThreads.remove(c['id']);
            } else {
              _expandedThreads.add(c['id']);
            }
          }),
        ));
        if (_expandedThreads.contains(c['id'])) {
          result.addAll(cThreads.map((t) => _buildChannelTile(t, selectedChannel)));
        }
      }
    }

    for (final cat in _categories) {
      final catChannels = regular.where((c) => c['category_id'] == cat['id']).toList();
      if (catChannels.isEmpty) continue;
      result.add(GestureDetector(
        onSecondaryTapUp: (d) => _showCategoryContextMenu(cat, d.globalPosition),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 2),
          child: Text(
            (cat['name'] as String? ?? '').toUpperCase(),
            style: TextStyle(color: KodaColors.text3, fontSize: 10,
                fontWeight: FontWeight.w700, letterSpacing: 1),
          ),
        ),
      ));
      result.addAll(catChannels.map((c) => _buildChannelTile(c, selectedChannel)));
    }

    return result;
  }

  // Returns the correct content widget for the currently selected channel.
  // Keeping this as a method rather than inline in build() avoids the
  // "if statement as positional argument" Dart restriction entirely.
  Widget _buildChannelTile(Map<String, dynamic> c, Map<String, dynamic>? selectedChannel) {
    final selected = selectedChannel?['id'] == c['id'];
    final isVoice = c['type'] == 'voice';
    final isThread = c['is_thread'] == true;
    final unread = _channelUnread[c['id']] ?? 0;
    final isAnnouncement = c['is_read_only'] == true && c['type'] == 'text';
    final icon = switch (c['type'] as String? ?? 'text') {
      'voice'       => Icons.volume_up,
      'gallery'     => Icons.image_outlined,
      'stage'       => Icons.campaign_outlined,
      'rules'       => Icons.gavel_outlined,
      'role-select' => Icons.badge_outlined,
      'calendar'    => Icons.calendar_month_outlined,
      _             => isAnnouncement
          ? Icons.campaign_outlined
          : (isThread ? Icons.forum_outlined : Icons.tag),
    };
    final occupants = isVoice ? (_voiceOccupants[c['id']] ?? const []) : const [];
    final labelSetting = _labelSettingFor(c);
    final hasMention = _channelsWithMentions.contains(c['id']);
    final tile = GestureDetector(
      onSecondaryTapUp: (d) => _showChannelContextMenu(c, d.globalPosition),
      child: ListTile(
        dense: true,
        leading: Icon(icon, size: 16,
            color: selected ? KodaColors.text1 : KodaColors.text3),
        title: Row(mainAxisSize: MainAxisSize.min, children: [
          Flexible(
            child: Text(c['name'] as String? ?? '',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: isThread ? 12 : 13,
                    color: unread > 0 && !selected ? KodaColors.text1 : (selected ? KodaColors.text1 : KodaColors.text3),
                    fontWeight: unread > 0 ? FontWeight.w700 : FontWeight.w400,
                    fontStyle: isThread ? FontStyle.italic : FontStyle.normal)),
          ),
          if (labelSetting == 'warn') ...[
            const SizedBox(width: 4),
            Tooltip(
              message: 'Content warning',
              child: Icon(Icons.warning_amber_rounded, size: 12, color: KodaColors.gold),
            ),
          ],
        ]),
        subtitle: occupants.isEmpty ? null : Text(
            occupants.map((p) => p['username'] as String? ?? '?').join(', '),
            style: TextStyle(color: KodaColors.text3, fontSize: 11),
            maxLines: 1, overflow: TextOverflow.ellipsis),
        trailing: unread > 0
            ? Tooltip(
                message: hasMention ? 'Unread mention' : 'Unread messages',
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                  decoration: BoxDecoration(
                      // Mentions get the same red used for kick/ban/danger
                      // actions elsewhere -- deliberately distinct from
                      // plain unread's violet, matching Discord's
                      // red-for-mention convention.
                      color: hasMention ? KodaColors.accent : KodaColors.koda,
                      borderRadius: BorderRadius.circular(99)),
                  child: Text(unread > 99 ? '99+' : '$unread',
                      style: const TextStyle(color: Colors.white,
                          fontSize: 10, fontWeight: FontWeight.w700)),
                ),
              )
            : null,
        selected: selected,
        selectedTileColor: KodaColors.koda.withValues(alpha: 0.1),
        onTap: () => _openChannel(c),
      ),
    );
    if (isThread) {
      return Padding(
        padding: const EdgeInsets.only(left: 16),
        child: tile,
      );
    }
    return tile;
  }

  /// Slim, read-only progress banner for a server's connected Tiltify
  /// campaign (see server_settings_screen.dart's Charity tab for the
  /// owner-facing connect/select-campaign flow). Purely displays the
  /// snapshot already embedded in the server object -- refreshed
  /// server-side every 5 minutes by Koda.Tiltify.CampaignSweeper, so no
  /// extra request happens just from this rendering.
  Widget _buildTiltifyBanner(Map<String, dynamic> tiltify) {
    final title = tiltify['campaign_title'] as String? ?? 'Charity campaign';
    final raised = double.tryParse('${tiltify['raised_amount'] ?? 0}') ?? 0;
    final goal = double.tryParse('${tiltify['goal_amount'] ?? 0}') ?? 0;
    final currency = tiltify['currency'] as String? ?? 'USD';
    final progress = goal > 0 ? (raised / goal).clamp(0.0, 1.0) : 0.0;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: KodaColors.border))),
      child: Row(children: [
        Icon(Icons.favorite, size: 16, color: KodaColors.accent),
        const SizedBox(width: 10),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: TextStyle(
                color: KodaColors.text1, fontSize: 12, fontWeight: FontWeight.w600),
                overflow: TextOverflow.ellipsis),
            const SizedBox(height: 4),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: progress, minHeight: 5,
                backgroundColor: KodaColors.elevated,
                valueColor: AlwaysStoppedAnimation(KodaColors.mint),
              ),
            ),
          ]),
        ),
        const SizedBox(width: 10),
        Text('$currency ${raised.toStringAsFixed(0)} / ${goal.toStringAsFixed(0)}',
            style: TextStyle(color: KodaColors.text3, fontSize: 11)),
      ]),
    );
  }

  /// Boost-level-4 perk (Koda.Boosts.cosmetics_unlocked?/1) -- a custom
  /// image behind the channel content for everyone currently viewing
  /// this server, replacing the flat KodaColors.voidBg there. A dark
  /// scrim keeps message text readable regardless of the image.
  Widget _buildBackgroundedContent(
      Map<String, dynamic>? server, Map<String, dynamic>? selectedChannel) {
    final backgroundUrl = (server?['cosmetics'] as Map?)?['background_url'] as String?;
    final content = _buildContentArea(selectedChannel);
    if (backgroundUrl == null || backgroundUrl.isEmpty) return content;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(backgroundUrl),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.black.withValues(alpha: 0.55), BlendMode.darken),
        ),
      ),
      child: content,
    );
  }

  Widget _buildContentArea(Map<String, dynamic>? selectedChannel) {
    if (_showingMarketplace) {
      return Column(children: [
        Container(
          height: 52,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: KodaColors.border))),
          child: Row(children: [
            Icon(Icons.storefront_outlined, size: 16, color: KodaColors.text3),
            SizedBox(width: 6),
            Text('Marketplace',
                style: TextStyle(color: KodaColors.text1, fontWeight: FontWeight.w600)),
          ]),
        ),
        const Expanded(child: MarketplaceScreen(embedded: true)),
      ]);
    }

    if (selectedChannel == null) {
      return Center(
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

    if (type == 'calendar') {
      return CalendarScreen(channel: selectedChannel);
    }

    // Text channel (and anything else -- fallback to chat)
    return Column(children: [
      Container(
        height: 52,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: KodaColors.border))),
        child: Row(children: [
          Icon(
            type == 'voice' ? Icons.volume_up : Icons.tag,
            size: 16,
            color: KodaColors.text3,
          ),
          const SizedBox(width: 6),
          Text(selectedChannel['name'] as String? ?? '',
              style: TextStyle(
                  color: KodaColors.text1, fontWeight: FontWeight.w600)),
          const SizedBox(width: 8),

          if (selectedChannel['is_read_only'] == true) ...[
            const SizedBox(width: 8),
            Tooltip(
              message: _announcementTooltip(selectedChannel),
              child: Icon(Icons.campaign_outlined, size: 14, color: KodaColors.gold),
            ),
          ],
          const Spacer(),
          IconButton(
            icon: Icon(Icons.search, color: KodaColors.text3, size: 18),
            tooltip: 'Search',
            onPressed: () => _searchChannel(selectedChannel['id'] as String),
          ),
          IconButton(
            icon: Icon(Icons.push_pin_outlined, color: KodaColors.text3, size: 18),
            tooltip: 'Pinned Messages',
            onPressed: () => _showPinnedMessages(selectedChannel['id'] as String),
          ),
          const NotificationBell(),
          IconButton(
            icon: Icon(
              _showMemberPanel
                  ? Icons.people
                  : Icons.people_outline,
              color: _showMemberPanel
                  ? KodaColors.koda
                  : KodaColors.text3,
              size: 18,
            ),
            tooltip: _showMemberPanel ? 'Hide Members' : 'Show Members',
            onPressed: () => setState(() => _showMemberPanel = !_showMemberPanel),
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
            const canDelete = true; // server enforces permission
            final isMine = m['sender_id'] == ref.read(authProvider).user?.id;
            final isPinned = m['pinned_at'] != null;
            final isEdited = m['edited_at'] != null;
            return GestureDetector(
              onSecondaryTapUp: (d) async {
                final channelId = m['channel_id'] as String? ?? selectedChannel['id'] as String;
                final action = await showMenu<String>(
                  context: context,
                  position: RelativeRect.fromLTRB(d.globalPosition.dx,
                      d.globalPosition.dy, d.globalPosition.dx, d.globalPosition.dy),
                  color: KodaColors.card,
                  items: [
                    const PopupMenuItem(value: 'reply', child: Text('Reply')),
                    const PopupMenuItem(value: 'thread', child: Text('Create Thread')),
                    if (isMine && m['encrypted'] != true)
                      const PopupMenuItem(value: 'edit', child: Text('Edit Message')),
                    PopupMenuItem(value: isPinned ? 'unpin' : 'pin',
                        child: Text(isPinned ? 'Unpin Message' : 'Pin Message')),
                    if (canDelete) const PopupMenuItem(
                        value: 'delete', child: Text('Delete Message')),
                    if (!isMine)
                      PopupMenuItem(value: 'report',
                          child: Text('Report Message', style: TextStyle(color: KodaColors.accent))),
                  ],
                );
                if (action == 'reply' && mounted) {
                  setState(() => _replyingTo = m);
                }
                if (action == 'thread' && mounted) {
                  _showCreateThreadDialog(m);
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
                  final ok = await KodaApi.instance.deleteMessage(channelId,
                    m['id'] as String? ?? '',
                  );
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
                        const SnackBar(content: Text('Report submitted.')));
                  }
                }
              },
              child: Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                GestureDetector(
                  onTap: () => _showUserProfile(context, m['author'] as Map<String, dynamic>?),
                  child: KodaAvatar(
                  username: author,
                  size: 34,
                  avatarUrl: (m['author'] as Map<String, dynamic>?)?['avatar_url'] as String?,
                  ),
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
                        Text(withPronouns(author, m['author'] as Map<String, dynamic>?),
                            style: TextStyle(
                                color: KodaColors.koda,
                                fontSize: 13,
                                fontWeight: FontWeight.w600)),
                        if (time.isNotEmpty) ...[
                          const SizedBox(width: 6),
                          Text(time,
                              style: TextStyle(
                                  color: KodaColors.text3, fontSize: 11)),
                        ],
                        if (isEdited) ...[
                          const SizedBox(width: 4),
                          Text('(edited)',
                              style: TextStyle(color: KodaColors.text3, fontSize: 10)),
                        ],
                        if (isPinned) ...[
                          const SizedBox(width: 6),
                          Icon(Icons.push_pin, size: 11, color: KodaColors.gold),
                        ],
                      ],
                    ),

                    const SizedBox(height: 2),
                    if (m['reply_to'] != null)
                      _buildReplyPreview(m['reply_to'] as Map<String, dynamic>),
                    if (m['_decryptPending'] == true)
                      Text('Waiting for the encryption key to arrive...',
                          style: TextStyle(color: KodaColors.text3,
                              fontSize: 13, fontStyle: FontStyle.italic))
                    else if (m['_decryptFailed'] == true)
                      Text('Unable to decrypt this message.',
                          style: TextStyle(color: KodaColors.accent,
                              fontSize: 13, fontStyle: FontStyle.italic))
                    else if ((m['content'] as String? ?? '').isNotEmpty)
                      Text.rich(TextSpan(children: renderMessageWithEmoji(
                          m['content'] as String, _currentServerEmoji(),
                          TextStyle(color: KodaColors.text1, fontSize: 14)))),
                    if (m['attachment_url'] != null) ...[
                      const SizedBox(height: 4),
                      _buildAttachment(m),
                    ],
                    if (m['link_preview'] != null) ...[
                      const SizedBox(height: 4),
                      _buildLinkPreview(m['link_preview'] as Map<String, dynamic>),
                    ],
                      _buildReactions(m),
                  ]),
                ),
              ]),
            ),
            );
          }
        ),
      ),
      if (_replyingTo != null)
        Container(
          color: KodaColors.elevated,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: Row(children: [
            Icon(Icons.reply, size: 14, color: KodaColors.koda),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                'Replying to ${(_replyingTo!['author'] as Map<String, dynamic>?)?['username'] ?? 'Unknown'}',
                style: TextStyle(color: KodaColors.text3, fontSize: 12),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            IconButton(
              icon: Icon(Icons.close, size: 14, color: KodaColors.text3),
              onPressed: () => setState(() => _replyingTo = null),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ]),
        ),
      if (_pendingAttachment != null)
        Container(
          color: KodaColors.elevated,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: Row(children: [
            Icon(Icons.attach_file, size: 14, color: KodaColors.koda),
            const SizedBox(width: 6),
            Expanded(
              child: Text(_pendingAttachment!['fileName'] ?? 'Attachment',
                  style: TextStyle(color: KodaColors.text3, fontSize: 12),
                  overflow: TextOverflow.ellipsis),
            ),
            IconButton(
              icon: Icon(Icons.close, size: 14, color: KodaColors.text3),
              onPressed: () => setState(() => _pendingAttachment = null),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ]),
        ),
      if (_shortcodeMatches.isNotEmpty)
        Container(
          height: 40,
          color: KodaColors.elevated,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: _shortcodeMatches.map((e) => GestureDetector(
              onTap: () => _insertShortcode(e),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: KodaColors.card,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: KodaColors.border),
                ),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  EmojiGlyph(value: '$kCustomEmojiPrefix${e['id']}',
                      serverEmoji: _shortcodeMatches, size: 18),
                  const SizedBox(width: 6),
                  Text(':${e['name']}:',
                      style: TextStyle(color: KodaColors.text2, fontSize: 12)),
                ]),
              ),
            )).toList(),
          ),
        ),
      Padding(
        padding: const EdgeInsets.all(14),
        child: Row(children: [
          IconButton(
            icon: _uploadingAttachment
                ? SizedBox(width: 18, height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2, color: KodaColors.koda))
                : Icon(Icons.attach_file, color: KodaColors.text2),
            tooltip: 'Attach file',
            onPressed: _uploadingAttachment ? null : _pickAttachment,
          ),
          IconButton(
            icon: Icon(Icons.gif_box_outlined, color: KodaColors.text2),
            tooltip: 'GIF',
            onPressed: _pickGif,
          ),
          Expanded(
            child: KodaTextField(
              controller: _messageController,
              hintText: 'Message #${selectedChannel['name']}',
              onChanged: (text) {
                final channel = ref.read(selectedChannelProvider);
                if (channel != null) {
                  KodaSocket.instance.push(
                    'channel:${channel['id']}',
                    'typing',
                    {'typing': true},
                  );
                }
                _updateShortcodeMatches(text);
              },
              onSubmitted: (_) => _sendMessage(),

            ),
          ),
          const SizedBox(width: 10),
          IconButton(
            icon: Icon(Icons.send, color: KodaColors.koda),
            onPressed: _sendMessage,
          ),
        ]),
      ),
    ]);
  }

  Future<void> _editMessage(String channelId, Map<String, dynamic> message) async {
    final ctrl = TextEditingController(text: message['content'] as String? ?? '');
    final content = await showDialog<String>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: Text('Edit Message', style: TextStyle(color: KodaColors.text1)),
        content: KodaTextField(controller: ctrl, hintText: 'Message'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context),
              child: const Text('Cancel')),
          TextButton(onPressed: () => Navigator.pop(context, ctrl.text.trim()),
              child: const Text('Save')),
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
      // message's readability shouldn't shift out from under an edit
      // (see ChannelKeyManager.encryptForEpoch).
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

  Future<void> _searchChannel(String channelId) async {
    final myUserId = ref.read(authProvider).user?.id;
    if (myUserId == null) return;
    final result = await showDialog<MessageSearchResult>(
      context: context,
      builder: (_) => MessageSearchDialog(channelId: channelId, myUserId: myUserId),
    );
    if (result == null || !mounted) return;

    setState(() {
      _messages = result.context;
      _activeChannelId = channelId;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scroll.hasClients) return;
      final index = _messages.indexWhere((m) => m['id'] == result.message['id']);
      if (index == -1) return;
      // Rough position estimate -- there's no fixed item extent to compute
      // this exactly, but it's enough to land the target message on screen.
      final fraction = index / _messages.length;
      _scroll.jumpTo(fraction * _scroll.position.maxScrollExtent);
    });
  }

  Future<void> _showPinnedMessages(String channelId) async {
    final pins = await KodaApi.instance.getPinnedMessages(channelId);
    if (!mounted) return;
    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: Text('Pinned Messages', style: TextStyle(color: KodaColors.text1)),
        content: SizedBox(
          width: 360,
          height: 400,
          child: pins.isEmpty
              ? Center(child: Text('No pinned messages',
                  style: TextStyle(color: KodaColors.text3)))
              : ListView.separated(
                  itemCount: pins.length,
                  separatorBuilder: (_, __) => Divider(color: KodaColors.border),
                  itemBuilder: (_, i) {
                    final p = pins[i];
                    final author = (p['author'] as Map<String, dynamic>?)?['username']
                        as String? ?? 'Unknown';
                    return ListTile(
                      dense: true,
                      title: Text(author, style: TextStyle(
                          color: KodaColors.koda, fontSize: 12, fontWeight: FontWeight.w600)),
                      subtitle: Text(p['content'] as String? ?? '',
                          style: TextStyle(color: KodaColors.text1, fontSize: 13)),
                      trailing: IconButton(
                        icon: Icon(Icons.push_pin, size: 16, color: KodaColors.gold),
                        tooltip: 'Unpin',
                        onPressed: () async {
                          final ok = await KodaApi.instance.unpinMessage(
                              channelId, p['id'] as String? ?? '');
                          if (ok) {
                            setState(() {
                              final idx = _messages.indexWhere((m) => m['id'] == p['id']);
                              if (idx != -1) _messages[idx]['pinned_at'] = null;
                            });
                            if (mounted) Navigator.pop(context);
                          }
                        },
                      ),
                    );
                  },
                ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Close')),
        ],
      ),
    );
  }

  Future<void> _showCreateThreadDialog(Map<String, dynamic> message) async {
    final channel = ref.read(selectedChannelProvider);
    if (channel == null) return;
    final ctrl = TextEditingController();
    final name = await showDialog<String>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: Text('Create Thread',
            style: TextStyle(color: KodaColors.text1)),
        content: KodaTextField(controller: ctrl, hintText: 'Thread name'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context),
              child: const Text('Cancel')),
          TextButton(onPressed: () => Navigator.pop(context, ctrl.text.trim()),
              child: const Text('Create')),
        ],
      ),
    );
    if (name == null || name.isEmpty) return;
    final thread = await KodaApi.instance.createThread(
      channelId: channel['id'] as String,
      messageId: message['id'] as String,
      name: name,
    );
    if (thread != null && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Thread "$name" created!')));
      final server = ref.read(selectedServerProvider);
      if (server != null) _selectServer(server);
    }
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
                    _showingMarketplace = false;
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
                        // Boost-level-5 perk (Koda.Boosts.icon_border_unlocked?/1)
                        // -- visible in every member's own rail, not just
                        // while that server is open, same as Discord's
                        // boosted-server ring.
                        final borderHex =
                            (s['cosmetics'] as Map?)?['icon_border_color'] as String?;
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: GestureDetector(
                            onTap: () => _selectServer(s),
                            onSecondaryTapUp: (d) => _showServerContextMenu(s, d.globalPosition),

                            child: Container(
                              width: 48, height: 48,
                              margin: const EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                color: selected
                                    ? KodaColors.koda
                                    : KodaColors.elevated,
                                borderRadius:
                                    BorderRadius.circular(selected ? 14 : 24),
                                border: borderHex != null
                                    ? Border.all(color: _hexColor(borderHex), width: 2)
                                    : null,
                              ),
                              alignment: Alignment.center,
                              child: s['icon_url'] != null && (s['icon_url'] as String).isNotEmpty
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(selected ? 14 : 24),
                                      child: Image.network(
                                        s['icon_url'] as String,
                                        width: 48, height: 48, fit: BoxFit.cover,
                                        errorBuilder: (_, __, ___) => Text(
                                          (s['name'] as String).isNotEmpty
                                              ? (s['name'] as String)[0].toUpperCase() : '?',
                                          style: const TextStyle(color: Colors.white,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    )
                                  : Text(
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
              icon: Icon(Icons.add, color: KodaColors.text2),
              tooltip: 'Create or Join',
              onPressed: () => _showAddServerMenu(),
            ),
            if (ref.watch(authProvider).user?.isAdmin == true)
              IconButton(
                icon: Icon(Icons.admin_panel_settings_outlined,
                    color: KodaColors.koda),
                tooltip: 'Admin Panel',
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const AdminScreen())),
              ),
            const SizedBox(height: 10),
          ]),
        ),

        // ── Main content ─────────────────────────────────────────────
        if (_showingDms)
          Expanded(child: DmScreen(
            key: _pendingDmConversationId != null
                ? ValueKey(_pendingDmConversationId) : null,
            initialConversationId: _pendingDmConversationId,
          ))
        else ...[
          // Channel list
          Container(
            width: 220,
            color: KodaColors.card,
            child: Column(children: [
              Container(
                height: 52,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    border:
                        Border(bottom: BorderSide(color: KodaColors.border))),
                child: Row(children: [
                  Expanded(
                    child: Text(selectedServer?['name'] ?? 'Koda',
                        style: TextStyle(
                            color: KodaColors.text1,
                            fontWeight: FontWeight.w700),
                        overflow: TextOverflow.ellipsis),
                  ),
                  if (selectedServer != null)
                    IconButton(
                      icon: Icon(Icons.settings_outlined,
                          size: 16, color: KodaColors.text3),
                      tooltip: 'Server Settings',
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const ServerSettingsScreen())).then((_) {
                              final server = ref.read(selectedServerProvider);
                              if (server != null && mounted) _selectServer(server);
                            }),
                    ),
                ]),
              ),
              if (selectedServer != null)
                ListTile(
                  dense: true,
                  leading: Icon(Icons.storefront_outlined, size: 16,
                      color: _showingMarketplace ? KodaColors.text1 : KodaColors.text3),
                  title: Text('Marketplace',
                      style: TextStyle(fontSize: 13,
                          color: _showingMarketplace ? KodaColors.text1 : KodaColors.text3,
                          fontWeight: _showingMarketplace ? FontWeight.w600 : FontWeight.w400)),
                  selected: _showingMarketplace,
                  selectedTileColor: KodaColors.koda.withValues(alpha: 0.1),
                  onTap: () => setState(() {
                    _showingMarketplace = true;
                    ref.read(selectedChannelProvider.notifier).state = null;
                  }),
                ),
              if (selectedServer != null)
                Container(height: 1, color: KodaColors.border,
                    margin: const EdgeInsets.symmetric(vertical: 4)),
              Expanded(
                child: ReorderableListView(
                  onReorder: _onReorderChannels,
                  children: _buildChannelList(selectedChannel)
                      .asMap()
                      .entries
                      .map((e) => KeyedSubtree(
                            key: ValueKey('ch_${e.key}'),
                            child: e.value,
                          ))
                      .toList(),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),


                decoration: BoxDecoration(
                    border: Border(top: BorderSide(color: KodaColors.border))),
                child: Row(children: [
                  KodaAvatar(username: user?.username ?? '?', size: 30, avatarUrl: user?.avatarUrl),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(user?.username ?? '',
                        style: TextStyle(
                            color: KodaColors.text1, fontSize: 13),
                        overflow: TextOverflow.ellipsis),
                  ),
                  IconButton(
                    icon: Icon(Icons.settings_outlined,
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
          // Content area + optional member panel
          Expanded(child: Row(children: [
            Expanded(child: Column(children: [
              if (selectedServer?['tiltify']?['connected'] == true)
                _buildTiltifyBanner(selectedServer!['tiltify'] as Map<String, dynamic>),
              Expanded(child: _buildBackgroundedContent(selectedServer, selectedChannel)),
              const VoiceBar(),
            ])),
            if (_showMemberPanel && selectedServer != null)
              MemberPanel(
                server: selectedServer,
                canKick: _can('kick_members'),
                canBan: _can('ban_members'),
                onMemberTap: (member) => _showUserProfile(context, {
                  'id': member['user_id'],
                  'username': member['username'],
                  'avatar_url': member['avatar_url'],
                }),
              ),
          ])),  // closes content Row
        ],      // closes outer Row children
      ]),
    );
  }
}
