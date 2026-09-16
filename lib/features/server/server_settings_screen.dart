// lib/features/server/server_settings_screen.dart
//
// Server-level settings: channels & categories, roles, and member role
// assignment. Reachable from the settings icon next to the server name
// in the channel sidebar.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/api.dart';
import '../../core/theme.dart';
import '../../core/providers.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/uploader.dart';
import '../../core/crypto/channel_key_manager.dart';
import '../../core/time_utils.dart';
import '../../shared/widgets.dart';
import '../../shared/channel_edit_dialog.dart';
import '../../shared/category_edit_dialog.dart';
import '../../shared/custom_emoji.dart';
import 'discord_import_dialog.dart';

class ServerSettingsScreen extends ConsumerStatefulWidget {
  const ServerSettingsScreen({super.key});
  @override
  ConsumerState<ServerSettingsScreen> createState() => _ServerSettingsScreenState();
}

class _ServerSettingsScreenState extends ConsumerState<ServerSettingsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Map<String, dynamic>> _categories = [];
  List<Map<String, dynamic>> _channels = [];
  List<Map<String, dynamic>> _roles = [];
  List<Map<String, dynamic>> _members = [];
  List<Map<String, dynamic>> _bans = [];
  List<Map<String, dynamic>> _auditActions = [];
  bool _loading = true;
  bool _showBans = false;
  bool _printfulConnected = false;
  bool _loadingPrintful = true;
  bool _connectingPrintful = false;
  List<Map<String, dynamic>> _emoji = [];
  bool _loadingEmoji = true;
  Map<String, dynamic>? _boostStatus;
  bool _uploadingEmoji = false;
  bool _uploadingBackground = false;

  // Matches the flat permission map used server-side on Koda.Servers.Role.
  static const List<String> _permissionKeys = [
    'view_channels', 'send_messages', 'connect_voice', 'manage_server',
    'manage_channels', 'manage_roles', 'manage_messages',
    'kick_members', 'ban_members', 'mute_members', 'mention_everyone', 'manage_marketplace',
  ];

  static const Map<String, String> _permissionLabels = {
    'view_channels':    'View Channels',
    'send_messages':    'Send Messages',
    'connect_voice':    'Connect to Voice',
    'manage_server':    'Manage Server',
    'manage_channels':  'Manage Channels',
    'manage_roles':     'Manage Roles',
    'manage_messages':  'Manage Messages',
    'kick_members':     'Kick Members',
    'ban_members':      'Ban Members',
    'mute_members':     'Mute Members',
    'mention_everyone': 'Mention @everyone',
    'manage_marketplace': 'Manage Marketplace',
  };

  static const List<String> _colorSwatches = [
    '#6C63FF', '#FF6584', '#43D9AD', '#FFD166',
    '#5B8DEF', '#E85D75', '#8E7CFB', '#3FBF8F',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 8, vsync: this);
    _loadAll();
    _loadPrintfulStatus();
    _loadEmoji();
    _loadBoostStatus();
  }

  Future<void> _loadEmoji() async {
    final serverId = _serverId;
    if (serverId.isEmpty) {
      if (mounted) setState(() => _loadingEmoji = false);
      return;
    }
    final emoji = await KodaApi.instance.getServerEmoji(serverId);
    if (!mounted) return;
    setState(() { _emoji = emoji; _loadingEmoji = false; });
  }

  Future<void> _loadBoostStatus() async {
    final serverId = _serverId;
    if (serverId.isEmpty) return;
    final status = await KodaApi.instance.getServerBoostStatus(serverId);
    if (!mounted) return;
    setState(() => _boostStatus = status);
  }

  Future<void> _loadPrintfulStatus() async {
    final serverId = _serverId;
    if (serverId.isEmpty) {
      if (mounted) setState(() => _loadingPrintful = false);
      return;
    }
    final connected = await KodaApi.instance.getPrintfulStatus(serverId);
    if (!mounted) return;
    setState(() { _printfulConnected = connected; _loadingPrintful = false; });
  }

  Future<void> _connectPrintful() async {
    setState(() => _connectingPrintful = true);
    final url = await KodaApi.instance.connectPrintful(_serverId);
    if (!mounted) return;
    setState(() => _connectingPrintful = false);
    if (url == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not start Printful connection.')));
      return;
    }
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text(
          'Finish connecting in your browser, then come back and refresh.')));
    }
  }

  Future<void> _disconnectPrintful() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: const Text('Disconnect Printful?', style: TextStyle(color: KodaColors.text1)),
        content: const Text(
            'This server will no longer be able to fulfill merch orders until reconnected.',
            style: TextStyle(color: KodaColors.text2)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Disconnect', style: TextStyle(color: KodaColors.accent)),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    final ok = await KodaApi.instance.disconnectPrintful(_serverId);
    if (ok && mounted) setState(() => _printfulConnected = false);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  String get _serverId => (ref.read(selectedServerProvider)?['id'] ?? '') as String;

  Future<void> _loadAll() async {
    setState(() => _loading = true);
    final serverId = _serverId;
    if (serverId.isEmpty) {
      if (mounted) setState(() => _loading = false);
      return;
    }
    final results = await Future.wait([
      KodaApi.instance.getCategories(serverId),
      KodaApi.instance.getChannels(serverId),
      KodaApi.instance.getRoles(serverId),
      KodaApi.instance.getMembers(serverId),
      KodaApi.instance.listBans(serverId),
      KodaApi.instance.getAuditLog(serverId),
    ]);
    if (!mounted) return;
    final roles = results[2]
      ..sort((a, b) => ((a['position'] ?? 0) as num).compareTo((b['position'] ?? 0) as num));
    setState(() {
      _categories    = results[0];
      _channels      = results[1];
      _roles         = roles;
      _members       = results[3];
      _bans          = results[4];
      _auditActions  = results[5];
      _loading       = false;
    });
  }

  Color _parseColor(dynamic hex) {
    try {
      return Color(int.parse((hex as String).replaceFirst('#', '0xFF')));
    } catch (_) {
      return KodaColors.koda;
    }
  }

  Future<bool> _confirm(String message) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: KodaColors.card,
        content: Text(message, style: const TextStyle(color: KodaColors.text1)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
          TextButton(onPressed: () => Navigator.pop(ctx, true),
              child: const Text('Delete', style: TextStyle(color: KodaColors.accent))),
        ],
      ),
    );
    return result ?? false;
  }

  // -- Category dialogs -----------------------------------------------------

  Future<void> _showCategoryDialog({Map<String, dynamic>? existing}) =>
      showCategoryEditDialog(
        context,
        serverId: _serverId,
        roles: _roles,
        existing: existing,
        onSaved: _loadAll,
      );
























  Future<void> _deleteCategory(Map<String, dynamic> category) async {
    final confirmed = await _confirm(
        'Delete "${category['name']}"? Channels inside will become uncategorized.');
    if (!confirmed) return;
    await KodaApi.instance.deleteCategory(category['id']);
    _loadAll();
  }

  // -- Channel dialogs -------------------------------------------------------

  Future<void> _showChannelDialog({Map<String, dynamic>? existing, String? categoryId}) =>
      showChannelEditDialog(
        context,
        serverId: _serverId,
        categories: _categories,
        roles: _roles,
        existing: existing,
        categoryId: categoryId,
        onSaved: _loadAll,
      );

  Future<void> _deleteChannel(Map<String, dynamic> channel) async {
    final confirmed = await _confirm('Delete #${channel['name']}? This cannot be undone.');
    if (!confirmed) return;
    await KodaApi.instance.deleteChannel(channel['id']);
    _loadAll();
  }

  // -- Role editor ------------------------------------------------------------

  Future<void> _showRoleEditor({Map<String, dynamic>? existing}) async {
    final nameController = TextEditingController(text: existing?['name'] ?? '');
    String color = (existing?['color'] as String?) ?? _colorSwatches.first;
    final permissions = <String, bool>{};
    final existingPerms = existing?['permissions'] as Map?;
    for (final key in _permissionKeys) {
      permissions[key] = existingPerms?[key] == true;
    }
    bool selfAssignable = existing?['self_assignable'] == true;

    final saved = await showDialog<bool>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          backgroundColor: KodaColors.card,
          title: Text(existing == null ? 'New Role' : 'Edit Role',
              style: const TextStyle(color: KodaColors.text1)),
          content: SizedBox(
            width: 360,
            child: SingleChildScrollView(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                KodaTextField(controller: nameController, hintText: 'Role name'),
                const SizedBox(height: 14),
                const Text('Color', style: TextStyle(color: KodaColors.text3, fontSize: 12)),
                const SizedBox(height: 6),
                Wrap(spacing: 8, runSpacing: 8, children: _colorSwatches.map((hex) {
                  final selected = color == hex;
                  return GestureDetector(
                    onTap: () => setDialogState(() => color = hex),
                    child: Container(
                      width: 28, height: 28,
                      decoration: BoxDecoration(
                        color: _parseColor(hex),
                        shape: BoxShape.circle,
                        border: selected ? Border.all(color: Colors.white, width: 2) : null,
                      ),
                    ),
                  );
                }).toList()),
                const SizedBox(height: 16),
                const Text('Permissions', style: TextStyle(color: KodaColors.text3, fontSize: 12)),
                ..._permissionKeys.map((key) => CheckboxListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      title: Text(_permissionLabels[key] ?? key,
                          style: const TextStyle(color: KodaColors.text1, fontSize: 13)),
                      value: permissions[key],
                      activeColor: KodaColors.koda,
                      onChanged: (v) => setDialogState(() => permissions[key] = v ?? false),
                                        )),
                const SizedBox(height: 12),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Self-assignable',
                      style: TextStyle(color: KodaColors.text1, fontSize: 13)),
                  subtitle: const Text('Members can assign this role themselves',
                      style: TextStyle(color: KodaColors.text3, fontSize: 11)),
                  value: selfAssignable,
                  activeThumbColor: KodaColors.koda,
                  onChanged: (v) => setDialogState(() => selfAssignable = v),
                ),
              ]),
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
            TextButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Save')),
          ],
        ),
      ),
    );

    if (saved != true || nameController.text.trim().isEmpty) return;
    final data = {
      'name': nameController.text.trim(),
      'color': color,
      'permissions': permissions,
      'self_assignable': selfAssignable,
    };
    if (existing == null) {
      await KodaApi.instance.createRole(_serverId, data);
    } else {
      await KodaApi.instance.updateRole(existing['id'], data);
    }
    _loadAll();
  }

  Future<void> _deleteRole(Map<String, dynamic> role) async {
    if (role['is_default'] == true) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('The default role cannot be deleted.')));
      return;
    }
    final confirmed = await _confirm('Delete role "${role['name']}"?');
    if (!confirmed) return;
    final ok = await KodaApi.instance.deleteRole(role['id']);
    if (!ok && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not delete that role.')));
    }
    _loadAll();
  }

  // -- Member role assignment --------------------------------------------------

  Future<void> _showMemberRolesDialog(Map<String, dynamic> member) async {
    final memberRoleIds = <String>{
      for (final r in (member['roles'] as List? ?? [])) r['id'] as String,
    };

    await showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          backgroundColor: KodaColors.card,
          title: Text(member['username'] ?? 'Member',
              style: const TextStyle(color: KodaColors.text1)),
          content: SizedBox(
            width: 320,
            height: 400,
            child: _roles.isEmpty
                ? const Text('No roles yet.', style: TextStyle(color: KodaColors.text3))
                : SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: _roles.map((role) {
                        final has = memberRoleIds.contains(role['id']);
                        return CheckboxListTile(
                          dense: true,
                          title: Text(role['name'],
                              style: const TextStyle(color: KodaColors.text1, fontSize: 13)),
                          value: has,
                          activeColor: KodaColors.koda,
                          onChanged: (v) async {
                            if (v == true) {
                              await KodaApi.instance.assignRole(member['member_id'], role['id']);
                              memberRoleIds.add(role['id']);
                            } else {
                              await KodaApi.instance.unassignRole(member['member_id'], role['id']);
                              memberRoleIds.remove(role['id']);
                            }
                            setDialogState(() {});
                          },
                        );
                      }).toList(),
                    ),
                  ),
          ),

          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Done')),
          ],
        ),
      ),
    );
    _loadAll();
  }

  // -- Build --------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final server = ref.watch(selectedServerProvider);

    return Scaffold(
      backgroundColor: KodaColors.voidBg,
      appBar: AppBar(
        backgroundColor: KodaColors.bg2,
        title: Row(children: [
          GestureDetector(
            onTap: () => _uploadServerIcon(server),
            child: Container(
              width: 36, height: 36,
              decoration: BoxDecoration(
                color: KodaColors.elevated,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: KodaColors.border),
              ),
              child: server?['icon_url'] != null && (server!['icon_url'] as String).isNotEmpty
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(server['icon_url'] as String,
                          width: 36, height: 36, fit: BoxFit.cover))
                  : const Icon(Icons.add_photo_alternate_outlined,
                      color: KodaColors.text3, size: 18),
            ),
          ),
          const SizedBox(width: 10),
          Text('${server?['name'] ?? 'Server'} Settings',
              style: const TextStyle(color: KodaColors.text1, fontSize: 16)),
        ]),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: KodaColors.koda,
          labelColor: KodaColors.text1,
          unselectedLabelColor: KodaColors.text3,
          isScrollable: true,
          tabs: const [
            Tab(text: 'Channels'),
            Tab(text: 'Roles'),
            Tab(text: 'Members'),
            Tab(text: 'Invites'),
            Tab(text: 'Merch'),
            Tab(text: 'Emoji'),
            Tab(text: 'Customize'),
            Tab(text: 'Audit Log'),
          ],
        ),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator(color: KodaColors.koda))
          : TabBarView(
              controller: _tabController,
              children: [_buildChannelsTab(), _buildRolesTab(), _buildMembersTab(),
                  _buildInvitesTab(), _buildMerchTab(), _buildEmojiTab(),
                  _buildCustomizeTab(), _buildAuditLogTab()],
            ),
    );
  }

  Widget _buildMerchTab() {
    if (_loadingPrintful) {
      return const Center(child: CircularProgressIndicator(color: KodaColors.koda));
    }
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: KodaColors.card,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: KodaColors.border),
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Icon(_printfulConnected ? Icons.check_circle : Icons.storefront_outlined,
                  color: _printfulConnected ? KodaColors.mint : KodaColors.text3, size: 22),
              const SizedBox(width: 10),
              Text(_printfulConnected ? 'Printful Connected' : 'Printful Not Connected',
                  style: const TextStyle(color: KodaColors.text1,
                      fontSize: 15, fontWeight: FontWeight.w600)),
            ]),
            const SizedBox(height: 8),
            const Text(
              'Connect this server\'s Printful account to fulfill merch orders '
              'placed through Koda. Each server connects its own store.',
              style: TextStyle(color: KodaColors.text3, fontSize: 12, height: 1.5),
            ),
            const SizedBox(height: 14),
            if (_printfulConnected)
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: KodaColors.accent,
                  side: const BorderSide(color: KodaColors.accent),
                  minimumSize: const Size(double.infinity, 40),
                ),
                onPressed: _disconnectPrintful,
                child: const Text('Disconnect'),
              )
            else
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: KodaColors.koda,
                  foregroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 40),
                ),
                icon: _connectingPrintful
                    ? const SizedBox(width: 14, height: 14,
                        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.black))
                    : const Icon(Icons.link, size: 16),
                label: Text(_connectingPrintful ? 'Connecting...' : 'Connect Printful'),
                onPressed: _connectingPrintful ? null : _connectPrintful,
              ),
            if (!_printfulConnected) ...[
              const SizedBox(height: 8),
              TextButton(
                onPressed: _loadPrintfulStatus,
                child: const Text('Already connected in your browser? Refresh status',
                    style: TextStyle(color: KodaColors.text3, fontSize: 11)),
              ),
            ],
          ]),
        ),
      ],
    );
  }

  // -- Emoji ----------------------------------------------------------------

  Widget _buildEmojiTab() {
    if (_loadingEmoji) {
      return const Center(child: CircularProgressIndicator(color: KodaColors.koda));
    }
    final limit = _boostStatus?['emoji_slot_limit'] as int? ?? 10;
    final level = _boostStatus?['level'] as int? ?? 0;
    final full = _emoji.length >= limit;
    return Column(children: [
      Container(
        width: double.infinity,
        padding: const EdgeInsets.all(14),
        color: KodaColors.elevated,
        child: Row(children: [
          Icon(Icons.emoji_emotions_outlined, size: 18,
              color: full ? KodaColors.accent : KodaColors.koda),
          const SizedBox(width: 10),
          Expanded(
            child: Text('${_emoji.length} / $limit slots used -- boost level $level',
                style: const TextStyle(color: KodaColors.text2, fontSize: 12)),
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                backgroundColor: KodaColors.koda, foregroundColor: Colors.black),
            icon: _uploadingEmoji
                ? const SizedBox(width: 14, height: 14,
                    child: CircularProgressIndicator(strokeWidth: 2, color: Colors.black))
                : const Icon(Icons.add, size: 16),
            label: const Text('Upload'),
            onPressed: (_uploadingEmoji || full) ? null : _uploadEmoji,
          ),
        ]),
      ),
      Expanded(
        child: _emoji.isEmpty
            ? const Center(child: Text('No custom emoji yet.',
                style: TextStyle(color: KodaColors.text3, fontSize: 13)))
            : GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 96, mainAxisSpacing: 12, crossAxisSpacing: 12,
                  childAspectRatio: 0.85,
                ),
                itemCount: _emoji.length,
                itemBuilder: (_, i) {
                  final e = _emoji[i];
                  return Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: KodaColors.card,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: KodaColors.border),
                    ),
                    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                      EmojiGlyph(value: '$kCustomEmojiPrefix${e['id']}', serverEmoji: _emoji, size: 36),
                      const SizedBox(height: 4),
                      Text(e['name'] as String, overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: KodaColors.text2, fontSize: 10)),
                      IconButton(
                        icon: const Icon(Icons.delete_outline, size: 14, color: KodaColors.accent),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () => _deleteEmoji(e['id'] as String),
                      ),
                    ]),
                  );
                },
              ),
      ),
    ]);
  }

  Future<void> _uploadEmoji() async {
    final nameCtrl = TextEditingController();
    final name = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: const Text('Upload Emoji', style: TextStyle(color: KodaColors.text1)),
        content: KodaTextField(controller: nameCtrl, hintText: 'name (letters, numbers, _)'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          TextButton(onPressed: () => Navigator.pop(ctx, nameCtrl.text.trim()),
              child: const Text('Choose Image')),
        ],
      ),
    );
    if (name == null || name.isEmpty || !mounted) return;

    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['png', 'jpg', 'jpeg', 'gif', 'webp'],
    );
    if (result == null || result.files.single.path == null) return;
    final path = result.files.single.path!;
    final ext = path.split('.').last.toLowerCase();
    final contentType = ext == 'png' ? 'image/png'
        : ext == 'gif' ? 'image/gif'
        : ext == 'webp' ? 'image/webp'
        : 'image/jpeg';

    setState(() => _uploadingEmoji = true);
    try {
      final uploaded = await KodaUploader.instance.upload(
          file: File(path), uploadType: 'server_emoji', contentType: contentType);
      final error = await KodaApi.instance.createServerEmoji(_serverId, name, uploaded.cdnUrl);
      if (!mounted) return;
      setState(() => _uploadingEmoji = false);
      if (error != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
        return;
      }
      ref.invalidate(serverEmojiProvider(_serverId));
      await _loadEmoji();
    } on UploadException catch (e) {
      if (mounted) {
        setState(() => _uploadingEmoji = false);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
      }
    }
  }

  Future<void> _deleteEmoji(String id) async {
    final ok = await KodaApi.instance.deleteServerEmoji(_serverId, id);
    if (ok && mounted) {
      ref.invalidate(serverEmojiProvider(_serverId));
      await _loadEmoji();
    }
  }

  // -- Customize (boost-level-gated cosmetics) -------------------------------

  Widget _buildCustomizeTab() {
    final level = _boostStatus?['level'] as int? ?? 0;
    final cosmeticsUnlocked = _boostStatus?['cosmetics_unlocked'] as bool? ?? false;
    final iconBorderUnlocked = _boostStatus?['icon_border_unlocked'] as bool? ?? false;
    final server = ref.watch(selectedServerProvider);
    final cosmetics = (server?['cosmetics'] as Map?) ?? {};

    return ListView(padding: const EdgeInsets.all(20), children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Text('Current boost level: $level',
            style: const TextStyle(color: KodaColors.text2, fontSize: 12, fontWeight: FontWeight.w600)),
      ),
      _customizeCard(
        title: 'Server Background',
        description: 'A custom background shown behind the channel view to '
            'everyone in this server.',
        unlocked: cosmeticsUnlocked,
        lockedHint: 'Reach boost level 4 to unlock a custom background.',
        child: cosmeticsUnlocked
            ? Row(children: [
                if ((cosmetics['background_url'] as String?)?.isNotEmpty == true)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(cosmetics['background_url'] as String,
                        width: 64, height: 40, fit: BoxFit.cover),
                  ),
                const SizedBox(width: 10),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: KodaColors.koda, foregroundColor: Colors.black),
                  icon: _uploadingBackground
                      ? const SizedBox(width: 14, height: 14,
                          child: CircularProgressIndicator(strokeWidth: 2, color: Colors.black))
                      : const Icon(Icons.image_outlined, size: 16),
                  label: const Text('Choose Image'),
                  onPressed: _uploadingBackground ? null : _pickBackground,
                ),
              ])
            : null,
      ),
      const SizedBox(height: 16),
      _customizeCard(
        title: 'Server Icon Border',
        description: "An accent border around this server's icon in every "
            "member's server list.",
        unlocked: iconBorderUnlocked,
        lockedHint: 'Reach boost level 5 to unlock a custom icon border.',
        child: iconBorderUnlocked
            ? Wrap(spacing: 8, runSpacing: 8, children: _colorSwatches.map((hex) {
                final selected = cosmetics['icon_border_color'] == hex;
                return GestureDetector(
                  onTap: () => _setIconBorderColor(hex),
                  child: Container(
                    width: 32, height: 32,
                    decoration: BoxDecoration(
                      color: _parseColor(hex),
                      shape: BoxShape.circle,
                      border: selected ? Border.all(color: Colors.white, width: 2) : null,
                    ),
                  ),
                );
              }).toList())
            : null,
      ),
      if (!cosmeticsUnlocked || !iconBorderUnlocked) ...[
        const SizedBox(height: 16),
        Text('Boost this server from the Server Bank in Marketplace to raise its level.',
            style: const TextStyle(color: KodaColors.text3, fontSize: 11)),
      ],
    ]);
  }

  Widget _customizeCard({
    required String title,
    required String description,
    required bool unlocked,
    required String lockedHint,
    required Widget? child,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: KodaColors.card,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: KodaColors.border),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Icon(unlocked ? Icons.auto_awesome : Icons.lock_outline, size: 18,
              color: unlocked ? KodaColors.koda : KodaColors.text3),
          const SizedBox(width: 8),
          Text(title, style: const TextStyle(color: KodaColors.text1,
              fontSize: 14, fontWeight: FontWeight.w600)),
        ]),
        const SizedBox(height: 6),
        Text(description, style: const TextStyle(color: KodaColors.text3, fontSize: 12)),
        const SizedBox(height: 12),
        if (unlocked && child != null)
          child
        else
          Text(lockedHint, style: const TextStyle(
              color: KodaColors.text3, fontSize: 12, fontStyle: FontStyle.italic)),
      ]),
    );
  }

  Future<void> _pickBackground() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['png', 'jpg', 'jpeg', 'webp'],
    );
    if (result == null || result.files.single.path == null) return;
    final path = result.files.single.path!;
    final ext = path.split('.').last.toLowerCase();
    final contentType = ext == 'png' ? 'image/png'
        : ext == 'webp' ? 'image/webp'
        : 'image/jpeg';

    setState(() => _uploadingBackground = true);
    try {
      final uploaded = await KodaUploader.instance.upload(
          file: File(path), uploadType: 'server_cosmetic', contentType: contentType);
      final updated = await KodaApi.instance.updateServerCosmetics(
          _serverId, backgroundUrl: uploaded.cdnUrl);
      if (!mounted) return;
      setState(() => _uploadingBackground = false);
      if (updated != null) {
        ref.read(selectedServerProvider.notifier).state = updated;
      }
    } on UploadException catch (e) {
      if (mounted) {
        setState(() => _uploadingBackground = false);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
      }
    }
  }

  Future<void> _setIconBorderColor(String hex) async {
    final updated = await KodaApi.instance.updateServerCosmetics(
        _serverId, iconBorderColor: hex);
    if (updated != null && mounted) {
      ref.read(selectedServerProvider.notifier).state = updated;
    }
  }

  Future<void> _uploadServerIcon(Map<String, dynamic>? server) async {
    if (server == null) return;
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['png', 'jpg', 'jpeg', 'gif', 'webp'],
    );
    if (result == null || result.files.single.path == null) return;
    final path = result.files.single.path!;
    final ext = path.split('.').last.toLowerCase();
    final contentType = ext == 'png' ? 'image/png'
        : ext == 'gif' ? 'image/gif'
        : ext == 'webp' ? 'image/webp'
        : 'image/jpeg';
    try {
      final uploaded = await KodaUploader.instance.upload(
        file: File(path), uploadType: 'avatar', contentType: contentType);
      await KodaApi.instance.updateServer(
        server['id'] as String, {'icon_url': uploaded.cdnUrl});
      // Refresh server list so the rail updates
      if (mounted) {
        ref.read(selectedServerProvider.notifier).state = {
          ...server, 'icon_url': uploaded.cdnUrl};
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Server icon updated!')));
      }
    } on UploadException catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message)));
    }
  }

  Widget _buildChannelsTab() {
    final uncategorized = _channels.where((c) => c['category_id'] == null).toList();

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
               Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton.icon(
              onPressed: () {
                final server = ref.read(selectedServerProvider);
                if (server == null) return;
                showDialog(
                  context: context,
                  builder: (_) => DiscordImportDialog(
                    serverId: server['id'] as String,
                    onImported: () {
                      _loadAll();
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Template imported!')));
                    },
                  ),
                );
              },
              icon: const Icon(Icons.download_outlined, size: 16, color: KodaColors.text3),
              label: const Text('Import from Discord',
                  style: TextStyle(color: KodaColors.text3)),
            ),
            TextButton.icon(
              onPressed: () => _showCategoryDialog(),
              icon: const Icon(Icons.add, size: 16, color: KodaColors.koda),
              label: const Text('Add Category', style: TextStyle(color: KodaColors.koda)),
            ),
          ],
        ),
        ..._categories.map((cat) {
          final channelsInCat = _channels.where((c) => c['category_id'] == cat['id']).toList();
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: KodaColors.card,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: KodaColors.border),
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ListTile(
                dense: true,
                title: Text(cat['name'].toString().toUpperCase(),
                    style: const TextStyle(
                        color: KodaColors.text2, fontSize: 12, fontWeight: FontWeight.w700)),
                trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                  IconButton(
                    icon: const Icon(Icons.add, size: 16, color: KodaColors.text3),
                    tooltip: 'Add channel here',
                    onPressed: () => _showChannelDialog(categoryId: cat['id'] as String),
                  ),
                  PopupMenuButton<String>(
                    icon: const Icon(Icons.more_vert, size: 16, color: KodaColors.text3),
                    color: KodaColors.card,
                    onSelected: (v) =>
                        v == 'rename' ? _showCategoryDialog(existing: cat) : _deleteCategory(cat),
                    itemBuilder: (_) => const [
                      PopupMenuItem(value: 'rename', child: Text('Rename')),
                      PopupMenuItem(value: 'delete', child: Text('Delete')),
                    ],
                  ),
                ]),
              ),
              ...channelsInCat.map(_channelTile),
            ]),
          );
        }),
        if (uncategorized.isNotEmpty) ...[
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text('UNCATEGORIZED',
                style: TextStyle(color: KodaColors.text3, fontSize: 12, fontWeight: FontWeight.w700)),
          ),
          ...uncategorized.map(_channelTile),
        ],
        const SizedBox(height: 12),
        OutlinedButton.icon(
          onPressed: () => _showChannelDialog(),
          icon: const Icon(Icons.add, size: 16),
          label: const Text('Add Channel'),
        ),
      ],
    );
  }

  Widget _channelTile(Map<String, dynamic> ch) {
    final type = ch['type'] as String? ?? 'text';
    final icon = switch (type) {
      'voice'       => Icons.volume_up,
      'gallery'     => Icons.image_outlined,
      'stage'       => Icons.campaign_outlined,
      'rules'       => Icons.gavel_outlined,
      'role-select' => Icons.badge_outlined,
      _             => Icons.tag,
    };
    return ListTile(
      dense: true,
      leading: Icon(icon, size: 16, color: KodaColors.text3),
      title: Text(ch['name'], style: const TextStyle(color: KodaColors.text1, fontSize: 13)),
      trailing: PopupMenuButton<String>(
        icon: const Icon(Icons.more_vert, size: 16, color: KodaColors.text3),
        color: KodaColors.card,
        onSelected: (v) {
          if (v == 'edit') _showChannelDialog(existing: ch);
          else if (v == 'edit_rules') _showRulesContentDialog(ch);
          else _deleteChannel(ch);
        },
        itemBuilder: (_) => [
          const PopupMenuItem(value: 'edit', child: Text('Edit')),
          if (type == 'rules')
            const PopupMenuItem(value: 'edit_rules',
                child: Text('Edit Rules Content')),
          const PopupMenuItem(value: 'delete', child: Text('Delete')),
        ],
      ),
    );
  }


  Future<void> _showRulesContentDialog(Map<String, dynamic> ch) async {
    final server = ref.read(selectedServerProvider);
    if (server == null) return;
    final contentController = TextEditingController(
        text: ch['rules_content'] as String? ?? '');
    final saved = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: const Text('Edit Rules Content',
            style: TextStyle(color: KodaColors.text1)),
        content: SizedBox(
          width: 480,
          height: 320,
          child: TextField(
            controller: contentController,
            maxLines: 12,
            style: const TextStyle(color: KodaColors.text1, fontSize: 13),
            decoration: InputDecoration(
              hintText: 'Enter your server rules here...',
              contentPadding: const EdgeInsets.all(12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: KodaColors.border),
              ),
            ),
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Cancel')),
          TextButton(onPressed: () => Navigator.pop(ctx, true),
              child: const Text('Save',
                  style: TextStyle(color: KodaColors.koda))),
        ],
      ),
    );
    if (saved != true) return;
    await KodaApi.instance.updateRules(
        server['id'] as String, contentController.text.trim());
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Rules updated!')));
    _loadAll();
  }

  Widget _buildRolesTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: TextButton.icon(
            onPressed: () => _showRoleEditor(),
            icon: const Icon(Icons.add, size: 16, color: KodaColors.koda),
            label: const Text('Add Role', style: TextStyle(color: KodaColors.koda)),
          ),
        ),
        ..._roles.map((role) {
          final roleColor = _parseColor(role['color']);
          return Container(
            margin: const EdgeInsets.only(bottom: 6),
            decoration: BoxDecoration(
              color: KodaColors.card,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: KodaColors.border),
            ),
            child: ListTile(
              leading: Container(
                  width: 12, height: 12,
                  decoration: BoxDecoration(color: roleColor, shape: BoxShape.circle)),
              title: Text(role['name'], style: const TextStyle(color: KodaColors.text1, fontSize: 13)),
              subtitle: role['is_default'] == true
                  ? const Text('Default role', style: TextStyle(color: KodaColors.text3, fontSize: 11))
                  : null,
              trailing: PopupMenuButton<String>(
                icon: const Icon(Icons.more_vert, size: 16, color: KodaColors.text3),
                color: KodaColors.card,
                onSelected: (v) => v == 'edit' ? _showRoleEditor(existing: role) : _deleteRole(role),
                itemBuilder: (_) => [
                  const PopupMenuItem(value: 'edit', child: Text('Edit')),
                  if (role['is_default'] != true)
                    const PopupMenuItem(value: 'delete', child: Text('Delete')),
                ],
              ),
              onTap: () => _showRoleEditor(existing: role),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildMembersTab() {
    final me = ref.read(authProvider).user;
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        ..._members.map((m) {
          final roles = (m['roles'] as List? ?? []);
          final isSelf = m['user_id'] == me?.id;
          return Container(
            margin: const EdgeInsets.only(bottom: 6),
            decoration: BoxDecoration(
              color: KodaColors.card,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: KodaColors.border),
            ),
            child: ListTile(
              leading: KodaAvatar(username: m['username'] ?? '?', size: 32),
              title: Text(m['username'] ?? '', style: const TextStyle(color: KodaColors.text1, fontSize: 13)),
              subtitle: roles.isEmpty
                  ? null
                  : Wrap(
                      spacing: 4,
                      children: roles.map<Widget>((r) {
                        final c = _parseColor(r['color']);
                        return Container(
                          margin: const EdgeInsets.only(top: 4),
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: c.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(99),
                            border: Border.all(color: c.withValues(alpha: 0.4)),
                          ),
                          child: Text(r['name'], style: TextStyle(color: c, fontSize: 10)),
                        );
                      }).toList(),
                    ),
              trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                IconButton(
                  icon: const Icon(Icons.edit, size: 16, color: KodaColors.text3),
                  tooltip: 'Manage Roles',
                  onPressed: () => _showMemberRolesDialog(m),
                ),
                if (_isCurrentlyMuted(m))
                  const Padding(
                    padding: EdgeInsets.only(right: 4),
                    child: Icon(Icons.volume_off, size: 14, color: KodaColors.gold),
                  ),
                if (!isSelf)
                  PopupMenuButton<String>(
                    icon: const Icon(Icons.more_vert, size: 16, color: KodaColors.text3),
                    color: KodaColors.card,
                    itemBuilder: (_) => [
                      if (_isCurrentlyMuted(m))
                        const PopupMenuItem(value: 'unmute', child: Text('Unmute'))
                      else
                        const PopupMenuItem(value: 'mute', child: Text('Mute')),
                      const PopupMenuItem(value: 'kick', child: Text('Kick')),
                      const PopupMenuItem(value: 'ban',
                          child: Text('Ban', style: TextStyle(color: KodaColors.accent))),
                    ],
                    onSelected: (action) => action == 'mute'
                        ? _muteMember(m)
                        : action == 'unmute'
                            ? _unmuteMember(m)
                            : _kickOrBanMember(m, action),
                  ),
              ]),
              onTap: () => _showMemberRolesDialog(m),
            ),
          );
        }),
        const SizedBox(height: 8),
        InkWell(
          onTap: () => setState(() => _showBans = !_showBans),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(children: [
              Icon(_showBans ? Icons.expand_more : Icons.chevron_right,
                  size: 16, color: KodaColors.text3),
              const SizedBox(width: 4),
              Text('BANNED USERS — ${_bans.length}',
                  style: const TextStyle(color: KodaColors.text3, fontSize: 11,
                      fontWeight: FontWeight.w700, letterSpacing: 0.5)),
            ]),
          ),
        ),
        if (_showBans)
          if (_bans.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text('No banned users.', style: TextStyle(color: KodaColors.text3, fontSize: 12)),
            )
          else
            ..._bans.map((b) => Container(
                  margin: const EdgeInsets.only(bottom: 6),
                  decoration: BoxDecoration(
                    color: KodaColors.card,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: KodaColors.border),
                  ),
                  child: ListTile(
                    leading: KodaAvatar(username: b['username'] ?? '?', size: 28),
                    title: Text(b['username'] ?? '',
                        style: const TextStyle(color: KodaColors.text1, fontSize: 13)),
                    trailing: TextButton(
                      onPressed: () async {
                        final ok = await KodaApi.instance
                            .unbanMember(_serverId, b['user_id'] as String);
                        if (ok) _loadAll();
                      },
                      child: const Text('Unban'),
                    ),
                  ),
                )),
      ],
    );
  }

  Future<void> _kickOrBanMember(Map<String, dynamic> member, String action) async {
    final server = ref.read(selectedServerProvider);
    final username = member['username'] as String? ?? 'this member';
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: KodaColors.card,
        content: Text(
            action == 'ban'
                ? 'Ban $username from ${server?['name']}? They will not be able to rejoin without being unbanned.'
                : 'Kick $username from ${server?['name']}? They can rejoin with an invite.',
            style: const TextStyle(color: KodaColors.text1)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
          TextButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: Text(action == 'ban' ? 'Ban' : 'Kick',
                  style: const TextStyle(color: KodaColors.accent))),
        ],
      ),
    );
    if (confirmed != true) return;
    final userId = member['user_id'] as String;
    final ok = action == 'ban'
        ? await KodaApi.instance.banMember(_serverId, userId)
        : await KodaApi.instance.kickMember(_serverId, userId);
    if (ok) {
      // A departed member must not be able to read anything sent after
      // they're gone -- rotate every encrypted channel's key and
      // redistribute to whoever's left. Best-effort/fire-and-forget:
      // this doesn't block the kick/ban itself, and ensureReady's
      // opportunistic top-up covers anything that doesn't land here.
      final myUserId = ref.read(authProvider).user?.id;
      if (myUserId != null) {
        for (final channel in _channels) {
          if (channel['type'] == 'text') {
            ChannelKeyManager.instance
                .rotateAfterDeparture(channel['id'] as String, myUserId: myUserId);
          }
        }
      }
      _loadAll();
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not ${action == 'ban' ? 'ban' : 'kick'} $username.')));
    }
  }

  bool _isCurrentlyMuted(Map<String, dynamic> member) {
    final raw = member['muted_until'] as String?;
    if (raw == null) return false;
    final until = DateTime.tryParse(raw);
    return until != null && until.isAfter(DateTime.now().toUtc());
  }

  static const _muteDurations = <String, int>{
    '60 seconds': 60,
    '5 minutes': 300,
    '10 minutes': 600,
    '1 hour': 3600,
    '1 day': 86400,
    '1 week': 604800,
  };

  Future<void> _muteMember(Map<String, dynamic> member) async {
    final username = member['username'] as String? ?? 'this member';
    var selected = '10 minutes';
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          backgroundColor: KodaColors.card,
          title: Text('Mute $username', style: const TextStyle(color: KodaColors.text1)),
          content: Column(mainAxisSize: MainAxisSize.min, children: [
            DropdownButton<String>(
              value: selected,
              dropdownColor: KodaColors.card,
              isExpanded: true,
              style: const TextStyle(color: KodaColors.text1, fontSize: 13),
              onChanged: (v) => setDialogState(() => selected = v!),
              items: _muteDurations.keys
                  .map((k) => DropdownMenuItem(value: k, child: Text(k)))
                  .toList(),
            ),
          ]),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
            TextButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: const Text('Mute', style: TextStyle(color: KodaColors.gold)),
            ),
          ],
        ),
      ),
    );
    if (confirmed != true) return;
    final ok = await KodaApi.instance.muteMember(
        _serverId, member['user_id'] as String,
        durationSeconds: _muteDurations[selected]!);
    if (ok) {
      _loadAll();
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not mute $username.')));
    }
  }

  Future<void> _unmuteMember(Map<String, dynamic> member) async {
    final ok = await KodaApi.instance.unmuteMember(_serverId, member['user_id'] as String);
    if (ok) _loadAll();
  }

  String? _usernameFor(String? userId) {
    if (userId == null) return null;
    return _members.cast<Map<String, dynamic>?>().firstWhere(
        (m) => m?['user_id'] == userId, orElse: () => null)?['username'] as String?;
  }

  static const Map<String, String> _actionLabels = {
    'kick': 'kicked', 'ban': 'banned', 'unban': 'unbanned',
    'mute': 'muted', 'unmute': 'unmuted',
    'flood_detected': 'auto-muted for flooding',
    'raid_lockdown_enabled': 'locked invites (raid protection)',
    'raid_lockdown_disabled': 'unlocked invites',
  };

  Widget _buildAuditLogTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Row(children: [
          const Expanded(
            child: Text(
              'Tier 1 moderation activity -- kicks, bans, mutes, and automated '
              'flood/raid protection. Metadata only; never message content.',
              style: TextStyle(color: KodaColors.text3, fontSize: 12),
            ),
          ),
          const SizedBox(width: 8),
          OutlinedButton.icon(
            icon: const Icon(Icons.lock_open, size: 14),
            label: const Text('Unlock Invites'),
            onPressed: () async {
              final ok = await KodaApi.instance.unlockInvites(_serverId);
              if (ok && mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Invites unlocked.')));
                _loadAll();
              }
            },
          ),
        ]),
        const SizedBox(height: 16),
        if (_auditActions.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Text('No moderation activity yet.',
                style: TextStyle(color: KodaColors.text3, fontSize: 13)),
          )
        else
          ..._auditActions.map((a) {
            final actor = _usernameFor(a['actor_id'] as String?) ?? 'System';
            final target = _usernameFor(a['target_user_id'] as String?);
            final label = _actionLabels[a['action']] ?? a['action'] as String? ?? 'unknown action';
            final reason = a['reason'] as String?;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Icon(Icons.shield_outlined, size: 14, color: KodaColors.text3),
                const SizedBox(width: 8),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(color: KodaColors.text2, fontSize: 12.5),
                      children: [
                        TextSpan(text: actor, style: const TextStyle(
                            color: KodaColors.text1, fontWeight: FontWeight.w600)),
                        TextSpan(text: ' $label'),
                        if (target != null) TextSpan(text: ' $target',
                            style: const TextStyle(
                                color: KodaColors.text1, fontWeight: FontWeight.w600)),
                        if (reason != null && reason.isNotEmpty)
                          TextSpan(text: ' -- $reason',
                              style: const TextStyle(fontStyle: FontStyle.italic)),
                      ],
                    ),
                  ),
                ),
                Text(_formatAuditTime(a['inserted_at'] as String?),
                    style: const TextStyle(color: KodaColors.text3, fontSize: 11)),
              ]),
            );
          }),
      ],
    );
  }

  String _formatAuditTime(String? iso) {
    if (iso == null) return '';
    try {
      final dt = parseServerTimestamp(iso);
      return '${dt.month}/${dt.day} ${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
    } catch (_) { return ''; }
  }

  Widget _buildInvitesTab() {
    final server = ref.read(selectedServerProvider);
    if (server == null) return const SizedBox();
    final serverId = server['id'] as String;

    return FutureBuilder<List<Map<String, dynamic>>>(
      future: KodaApi.instance.listInvites(serverId),
      builder: (context, snapshot) {
        final invites = snapshot.data ?? [];
        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: KodaColors.koda),
                icon: const Icon(Icons.add_link, size: 16, color: Colors.white),
                label: const Text('Create Invite', style: TextStyle(color: Colors.white)),
                onPressed: () async {
                  final invite = await KodaApi.instance.createInvite(serverId);
                  if (invite != null && context.mounted) {
                    setState(() {});
                    final url = invite['url'] as String? ?? '';
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        backgroundColor: KodaColors.card,
                        title: const Text('Invite Created',
                            style: TextStyle(color: KodaColors.text1)),
                        content: SelectableText(url,
                            style: const TextStyle(color: KodaColors.koda)),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Done')),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
            const SizedBox(height: 16),
            if (invites.isEmpty)
              const Center(child: Text('No active invites',
                  style: TextStyle(color: KodaColors.text3)))
            else
              ...invites.map((inv) {
                final uses    = inv['uses'] as int? ?? 0;
                final maxUses = inv['max_uses'] as int?;
                final usesStr = maxUses != null ? '$uses / $maxUses' : '$uses';
                return Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: KodaColors.elevated,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: KodaColors.border),
                  ),
                  child: Row(children: [
                    Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        SelectableText(
                          inv['url'] as String? ?? '',
                          style: const TextStyle(color: KodaColors.koda, fontSize: 13),
                        ),
                        Text('Uses: $usesStr',
                          style: const TextStyle(color: KodaColors.text3, fontSize: 11)),
                      ]),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete_outline, size: 16, color: KodaColors.accent),
                      onPressed: () async {
                        await KodaApi.instance.deleteInvite(
                            serverId, inv['code'] as String);
                        if (context.mounted) setState(() {});
                      },
                    ),
                  ]),
                );
              }).toList(),
          ],
        );
      },
    );
  }
}






