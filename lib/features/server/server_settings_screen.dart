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
import '../../core/uploader.dart';
import '../../shared/widgets.dart';
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
  bool _loading = true;

  // Matches the flat permission map used server-side on Koda.Servers.Role.
  static const List<String> _permissionKeys = [
    'view_channels', 'send_messages', 'connect_voice', 'manage_server',
    'manage_channels', 'manage_roles', 'manage_messages',
    'kick_members', 'ban_members', 'mention_everyone',
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
    'mention_everyone': 'Mention @everyone',
  };

  static const List<String> _colorSwatches = [
    '#6C63FF', '#FF6584', '#43D9AD', '#FFD166',
    '#5B8DEF', '#E85D75', '#8E7CFB', '#3FBF8F',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _loadAll();
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
    ]);
    if (!mounted) return;
    final roles = results[2]
      ..sort((a, b) => ((a['position'] ?? 0) as num).compareTo((b['position'] ?? 0) as num));
    setState(() {
      _categories = results[0];
      _channels   = results[1];
      _roles      = roles;
      _members    = results[3];
      _loading    = false;
    });
  }

  Color _parseColor(dynamic hex) {
    try {
      if (hex is int) return Color(0xFF000000 | hex);
      if (hex is String) return Color(int.parse(hex.replaceFirst('#', '0xFF')));
      return KodaColors.koda;
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

  Future<void> _showCategoryDialog({Map<String, dynamic>? existing}) async {
    final controller = TextEditingController(text: existing?['name'] ?? '');
    final result = await showDialog<String>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: Text(existing == null ? 'New Category' : 'Rename Category',
            style: const TextStyle(color: KodaColors.text1)),
        content: KodaTextField(controller: controller, hintText: 'Category name'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          TextButton(onPressed: () => Navigator.pop(context, controller.text.trim()),
              child: const Text('Save')),
        ],
      ),
    );
    if (result == null || result.isEmpty) return;
    if (existing == null) {
      await KodaApi.instance.createCategory(_serverId, result);
    } else {
      await KodaApi.instance.updateCategory(existing['id'], result);
    }
    _loadAll();
  }

  Future<void> _deleteCategory(Map<String, dynamic> category) async {
    final confirmed = await _confirm(
        'Delete "${category['name']}"? Channels inside will become uncategorized.');
    if (!confirmed) return;
    await KodaApi.instance.deleteCategory(category['id']);
    _loadAll();
  }

  // -- Channel dialogs -------------------------------------------------------

  Future<void> _showChannelDialog({Map<String, dynamic>? existing, String? categoryId}) async {
    final nameController = TextEditingController(text: existing?['name'] ?? '');
    String type = existing?['type'] ?? 'text';
    String? selectedCategoryId = existing?['category_id'] ?? categoryId;

    final saved = await showDialog<bool>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          backgroundColor: KodaColors.card,
          title: Text(existing == null ? 'New Channel' : 'Edit Channel',
              style: const TextStyle(color: KodaColors.text1)),
          content: SizedBox(
            width: 340,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              KodaTextField(controller: nameController, hintText: 'Channel name'),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: type,
                dropdownColor: KodaColors.card,
                decoration: const InputDecoration(labelText: 'Type'),
                items: const [
                  DropdownMenuItem(value: 'text', child: Text('Text')),
                  DropdownMenuItem(value: 'voice', child: Text('Voice')),
                  DropdownMenuItem(value: 'gallery', child: Text('Gallery')),
                  DropdownMenuItem(value: 'stage', child: Text('Stage')),
                  DropdownMenuItem(value: 'rules', child: Text('Rules')),
                  DropdownMenuItem(value: 'role-select', child: Text('Role Selection')),
                ],
                onChanged: (v) => setDialogState(() => type = v ?? 'text'),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String?>(
                value: selectedCategoryId,
                dropdownColor: KodaColors.card,
                decoration: const InputDecoration(labelText: 'Category'),
                items: [
                  const DropdownMenuItem(value: null, child: Text('No category')),
                  ..._categories.map((c) => DropdownMenuItem(
                      value: c['id'] as String, child: Text(c['name']))),
                ],
                onChanged: (v) => setDialogState(() => selectedCategoryId = v),
              ),
            ]),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
            TextButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Save')),
          ],
        ),
      ),
    );

    if (saved != true || nameController.text.trim().isEmpty) return;
    final name = nameController.text.trim();
    if (existing == null) {
      await KodaApi.instance.createChannel(
          serverId: _serverId, name: name, type: type, categoryId: selectedCategoryId);
    } else {
      await KodaApi.instance.updateChannel(existing['id'], {
        'name': name, 'type': type, 'category_id': selectedCategoryId,
      });
    }
    _loadAll();
  }

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
            child: _roles.isEmpty
                ? const Text('No roles yet.', style: TextStyle(color: KodaColors.text3))
                : Column(
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
          tabs: const [
            Tab(text: 'Channels'),
            Tab(text: 'Roles'),
            Tab(text: 'Members'),
            Tab(text: 'Invites'),
          ],
        ),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator(color: KodaColors.koda))
          : TabBarView(
              controller: _tabController,
              children: [_buildChannelsTab(), _buildRolesTab(), _buildMembersTab(), _buildInvitesTab()],
            ),
    );
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

  Widget _channelTile(Map<String, dynamic> ch) => ListTile(
        dense: true,
        leading: Icon(ch['type'] == 'voice' ? Icons.volume_up : Icons.tag,
            size: 16, color: KodaColors.text3),
        title: Text(ch['name'], style: const TextStyle(color: KodaColors.text1, fontSize: 13)),
        trailing: PopupMenuButton<String>(
          icon: const Icon(Icons.more_vert, size: 16, color: KodaColors.text3),
          color: KodaColors.card,
          onSelected: (v) => v == 'edit' ? _showChannelDialog(existing: ch) : _deleteChannel(ch),
          itemBuilder: (_) => const [
            PopupMenuItem(value: 'edit', child: Text('Edit')),
            PopupMenuItem(value: 'delete', child: Text('Delete')),
          ],
        ),
      );

  Widget _buildRolesTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Roles: ${_roles.length}', style: const TextStyle(color: KodaColors.text3, fontSize: 11)),
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
    return ListView(
      padding: const EdgeInsets.all(16),
      children: _members.map((m) {
        final roles = (m['roles'] as List? ?? []);
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
                          color: c.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(99),
                          border: Border.all(color: c.withOpacity(0.4)),
                        ),
                        child: Text(r['name'], style: TextStyle(color: c, fontSize: 10)),
                      );
                    }).toList(),
                  ),
            trailing: const Icon(Icons.edit, size: 16, color: KodaColors.text3),
            onTap: () => _showMemberRolesDialog(m),
          ),
        );
      }).toList(),
    );
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




