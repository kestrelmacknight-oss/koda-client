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
import '../../core/language_options.dart';
import '../../l10n/generated/app_localizations.dart';
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
import '../marketplace/printful_merch_screen.dart';
import 'discord_import_dialog.dart';
import 'threshold_moderation_tab.dart';
import '../visp/visp_setup_dialog.dart';

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
  List<Map<String, dynamic>> _reports = [];
  bool _loading = true;
  bool _showBans = false;
  bool _printfulConnected = false;
  bool _loadingPrintful = true;
  bool _connectingPrintful = false;
  Map<String, dynamic>? _tiltifyStatus;
  bool _loadingTiltify = true;
  bool _connectingTiltify = false;
  List<Map<String, dynamic>>? _tiltifyCampaigns;
  bool _loadingTiltifyCampaigns = false;
  List<Map<String, dynamic>> _emoji = [];
  bool _loadingEmoji = true;
  Map<String, dynamic>? _boostStatus;
  bool _uploadingEmoji = false;
  bool _uploadingBackground = false;
  final _marketplaceLinkCtrl = TextEditingController();

  // Matches the flat permission map used server-side on Koda.Servers.Role.
  static const List<String> _permissionKeys = [
    'view_channels', 'send_messages', 'connect_voice', 'manage_server',
    'manage_channels', 'manage_roles', 'manage_messages',
    'kick_members', 'ban_members', 'mute_members', 'mention_everyone', 'manage_marketplace',
    'announce_live', 'move_members',
  ];

  // Not static const -- labels are localized, which needs a BuildContext.
  Map<String, String> _permissionLabels(AppLocalizations t) => {
    'view_channels':    t.permViewChannels,
    'send_messages':    t.permSendMessages,
    'connect_voice':    t.permConnectVoice,
    'manage_server':    t.permManageServer,
    'manage_channels':  t.permManageChannels,
    'manage_roles':     t.permManageRoles,
    'manage_messages':  t.permManageMessages,
    'kick_members':     t.permKickMembers,
    'ban_members':      t.permBanMembers,
    'mute_members':     t.permMuteMembers,
    'mention_everyone': t.permMentionEveryone,
    'manage_marketplace': t.permManageMarketplace,
    'announce_live':    t.permAnnounceLive,
    'move_members':     t.permMoveMembers,
  };

  static const List<String> _colorSwatches = [
    '#6C63FF', '#FF6584', '#43D9AD', '#FFD166',
    '#5B8DEF', '#E85D75', '#8E7CFB', '#3FBF8F',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 11, vsync: this);
    _loadAll();
    _loadPrintfulStatus();
    _loadTiltifyStatus();
    _loadEmoji();
    _loadBoostStatus();
    _marketplaceLinkCtrl.text =
        ref.read(selectedServerProvider)?['marketplace_link'] as String? ?? '';
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
    final t = AppLocalizations.of(context);
    if (url == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(t.serverConnectError('Printful'))));
      return;
    }
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(
          t.settingsStreamingFinishInBrowser)));
    }
  }

  Future<void> _disconnectPrintful() async {
    final t = AppLocalizations.of(context);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: Text(t.serverDisconnectPrintfulTitle, style: TextStyle(color: KodaColors.text1)),
        content: Text(
            t.serverDisconnectPrintfulBody,
            style: TextStyle(color: KodaColors.text2)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: Text(t.commonCancel)),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(t.commonDisconnect, style: TextStyle(color: KodaColors.accent)),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    final ok = await KodaApi.instance.disconnectPrintful(_serverId);
    if (ok && mounted) setState(() => _printfulConnected = false);
  }

  Future<void> _loadTiltifyStatus() async {
    final serverId = _serverId;
    if (serverId.isEmpty) {
      if (mounted) setState(() => _loadingTiltify = false);
      return;
    }
    final status = await KodaApi.instance.getTiltifyStatus(serverId);
    if (!mounted) return;
    setState(() { _tiltifyStatus = status; _loadingTiltify = false; });
    if (status?['connected'] == true && status?['campaign_id'] == null) {
      _loadTiltifyCampaigns();
    }
  }

  Future<void> _connectTiltify() async {
    setState(() => _connectingTiltify = true);
    final url = await KodaApi.instance.connectTiltify(_serverId);
    if (!mounted) return;
    setState(() => _connectingTiltify = false);
    final t = AppLocalizations.of(context);
    if (url == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(t.serverConnectError('Tiltify'))));
      return;
    }
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(
          t.settingsStreamingFinishInBrowser)));
    }
  }

  Future<void> _loadTiltifyCampaigns() async {
    setState(() => _loadingTiltifyCampaigns = true);
    final campaigns = await KodaApi.instance.getTiltifyCampaigns(_serverId);
    if (!mounted) return;
    setState(() { _tiltifyCampaigns = campaigns; _loadingTiltifyCampaigns = false; });
  }

  Future<void> _selectTiltifyCampaign(String campaignId) async {
    final ok = await KodaApi.instance.selectTiltifyCampaign(_serverId, campaignId);
    if (ok && mounted) _loadTiltifyStatus();
  }

  Future<void> _disconnectTiltify() async {
    final t = AppLocalizations.of(context);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: Text(t.serverDisconnectTiltifyTitle, style: TextStyle(color: KodaColors.text1)),
        content: Text(
            t.serverDisconnectTiltifyBody,
            style: TextStyle(color: KodaColors.text2)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: Text(t.commonCancel)),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(t.commonDisconnect, style: TextStyle(color: KodaColors.accent)),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    final ok = await KodaApi.instance.disconnectTiltify(_serverId);
    if (ok && mounted) setState(() { _tiltifyStatus = null; _tiltifyCampaigns = null; });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _marketplaceLinkCtrl.dispose();
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
      KodaApi.instance.getServerReports(serverId),
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
      _reports       = results[6];
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
    final t = AppLocalizations.of(context);
    final result = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: KodaColors.card,
        content: Text(message, style: TextStyle(color: KodaColors.text1)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text(t.commonCancel)),
          TextButton(onPressed: () => Navigator.pop(ctx, true),
              child: Text(t.commonDelete, style: TextStyle(color: KodaColors.accent))),
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
    final t = AppLocalizations.of(context);
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
          title: Text(existing == null ? t.serverNewRoleTitle : t.serverEditRoleTitle,
              style: TextStyle(color: KodaColors.text1)),
          content: SizedBox(
            width: 360,
            child: SingleChildScrollView(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                KodaTextField(controller: nameController, hintText: t.serverRoleNameHint, autofocus: true),
                const SizedBox(height: 14),
                Text(t.serverColorLabel, style: TextStyle(color: KodaColors.text3, fontSize: 12)),
                const SizedBox(height: 6),
                Wrap(spacing: 8, runSpacing: 8, children: _colorSwatches.map((hex) {
                  final selected = color == hex;
                  return KodaTappable(
                    selected: selected,
                    semanticLabel: t.serverColorSwatchLabel(hex),
                    borderRadius: BorderRadius.circular(999),
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
                Text(t.serverPermissionsLabel, style: TextStyle(color: KodaColors.text3, fontSize: 12)),
                ..._permissionKeys.map((key) => CheckboxListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      title: Text(_permissionLabels(t)[key] ?? key,
                          style: TextStyle(color: KodaColors.text1, fontSize: 13)),
                      value: permissions[key],
                      activeColor: KodaColors.koda,
                      onChanged: (v) => setDialogState(() => permissions[key] = v ?? false),
                                        )),
                const SizedBox(height: 12),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(t.serverSelfAssignableTitle,
                      style: TextStyle(color: KodaColors.text1, fontSize: 13)),
                  subtitle: Text(t.serverSelfAssignableSubtitle,
                      style: TextStyle(color: KodaColors.text3, fontSize: 11)),
                  value: selfAssignable,
                  activeThumbColor: KodaColors.koda,
                  onChanged: (v) => setDialogState(() => selfAssignable = v),
                ),
              ]),
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text(t.commonCancel)),
            TextButton(onPressed: () => Navigator.pop(ctx, true), child: Text(t.commonSave)),
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
    final t = AppLocalizations.of(context);
    if (role['is_default'] == true) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(t.serverDefaultRoleUndeletable)));
      return;
    }
    final confirmed = await _confirm(t.serverDeleteRoleConfirm(role['name'] as String? ?? ''));
    if (!confirmed) return;
    final ok = await KodaApi.instance.deleteRole(role['id']);
    if (!ok && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(t.serverCouldNotDeleteRole)));
    }
    _loadAll();
  }

  // -- Member role assignment --------------------------------------------------

  Future<void> _showMemberRolesDialog(Map<String, dynamic> member) async {
    final t = AppLocalizations.of(context);
    final memberRoleIds = <String>{
      for (final r in (member['roles'] as List? ?? [])) r['id'] as String,
    };

    await showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          backgroundColor: KodaColors.card,
          title: Text(member['username'] ?? t.serverMemberFallback,
              style: TextStyle(color: KodaColors.text1)),
          content: SizedBox(
            width: 320,
            height: 400,
            child: _roles.isEmpty
                ? Text(t.serverNoRolesYet, style: TextStyle(color: KodaColors.text3))
                : SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: _roles.map((role) {
                        final has = memberRoleIds.contains(role['id']);
                        return CheckboxListTile(
                          dense: true,
                          title: Text(role['name'],
                              style: TextStyle(color: KodaColors.text1, fontSize: 13)),
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
            TextButton(onPressed: () => Navigator.pop(ctx), child: Text(t.commonDone)),
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
    final t = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: KodaColors.voidBg,
      appBar: AppBar(
        backgroundColor: KodaColors.bg2,
        title: Row(children: [
          KodaTappable(
            semanticLabel: t.serverChangeIconLabel,
            borderRadius: BorderRadius.circular(10),
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
                  : Icon(Icons.add_photo_alternate_outlined,
                      color: KodaColors.text3, size: 18),
            ),
          ),
          const SizedBox(width: 10),
          Text(t.serverSettingsTitle(server?['name'] as String? ?? t.serverFallbackName),
              style: TextStyle(color: KodaColors.text1, fontSize: 16)),
        ]),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: KodaColors.koda,
          labelColor: KodaColors.text1,
          unselectedLabelColor: KodaColors.text3,
          isScrollable: true,
          tabs: [
            Tab(text: t.serverTabChannels),
            Tab(text: t.serverTabRoles),
            Tab(text: t.serverTabMembers),
            Tab(text: t.serverTabInvites),
            Tab(text: t.serverTabMerch),
            Tab(text: t.serverTabEmoji),
            Tab(text: t.serverTabCustomize),
            Tab(text: t.serverTabAuditLog),
            Tab(text: t.serverTabReports),
            Tab(text: t.serverTabThresholdMod),
            Tab(text: t.serverTabCharity),
          ],
        ),
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator(color: KodaColors.koda))
          : TabBarView(
              controller: _tabController,
              children: [_buildChannelsTab(), _buildRolesTab(), _buildMembersTab(),
                  _buildInvitesTab(), _buildMerchTab(), _buildEmojiTab(),
                  _buildCustomizeTab(), _buildAuditLogTab(), _buildReportsTab(),
                  ThresholdModerationTab(serverId: _serverId, members: _members, channels: _channels),
                  _buildCharityTab()],
            ),
    );
  }

  Widget _buildMerchTab() {
    if (_loadingPrintful) {
      return Center(child: CircularProgressIndicator(color: KodaColors.koda));
    }
    final t = AppLocalizations.of(context);
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
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
              Text(_printfulConnected ? t.serverPrintfulConnected : t.serverPrintfulNotConnected,
                  style: TextStyle(color: KodaColors.text1,
                      fontSize: 15, fontWeight: FontWeight.w600)),
            ]),
            const SizedBox(height: 8),
            Text(
              t.serverPrintfulDescription,
              style: TextStyle(color: KodaColors.text3, fontSize: 12, height: 1.5),
            ),
            const SizedBox(height: 14),
            if (_printfulConnected)
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: KodaColors.accent,
                  side: BorderSide(color: KodaColors.accent),
                  minimumSize: const Size(double.infinity, 40),
                ),
                onPressed: _disconnectPrintful,
                child: Text(t.commonDisconnect),
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
                label: Text(_connectingPrintful ? t.serverConnecting : t.serverConnectPrintful),
                onPressed: _connectingPrintful ? null : _connectPrintful,
              ),
            if (!_printfulConnected) ...[
              const SizedBox(height: 8),
              TextButton(
                onPressed: _loadPrintfulStatus,
                child: Text(t.serverRefreshStatus,
                    style: TextStyle(color: KodaColors.text3, fontSize: 11)),
              ),
            ],
          ]),
        ),
      ),
      if (_printfulConnected)
        Expanded(
          child: PrintfulMerchScreen(
            server: ref.watch(selectedServerProvider),
            creatorMode: true,
          ),
        ),
    ]);
  }

  // -- Charity (Tiltify campaign display) ------------------------------------

  Widget _buildCharityTab() {
    if (_loadingTiltify) {
      return Center(child: CircularProgressIndicator(color: KodaColors.koda));
    }
    final t = AppLocalizations.of(context);
    final connected = _tiltifyStatus?['connected'] == true;
    final campaignId = _tiltifyStatus?['campaign_id'] as String?;

    return ListView(padding: const EdgeInsets.all(20), children: [
      Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: KodaColors.card,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: KodaColors.border),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Icon(connected ? Icons.check_circle : Icons.favorite_outline,
                color: connected ? KodaColors.mint : KodaColors.text3, size: 22),
            const SizedBox(width: 10),
            Text(connected ? t.serverTiltifyConnected : t.serverTiltifyNotConnected,
                style: TextStyle(color: KodaColors.text1,
                    fontSize: 15, fontWeight: FontWeight.w600)),
          ]),
          const SizedBox(height: 8),
          Text(
            t.serverTiltifyDescription,
            style: TextStyle(color: KodaColors.text3, fontSize: 12, height: 1.5),
          ),
          const SizedBox(height: 14),
          if (connected)
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: KodaColors.accent,
                side: BorderSide(color: KodaColors.accent),
                minimumSize: const Size(double.infinity, 40),
              ),
              onPressed: _disconnectTiltify,
              child: Text(t.commonDisconnect),
            )
          else
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: KodaColors.koda,
                foregroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 40),
              ),
              icon: _connectingTiltify
                  ? const SizedBox(width: 14, height: 14,
                      child: CircularProgressIndicator(strokeWidth: 2, color: Colors.black))
                  : const Icon(Icons.link, size: 16),
              label: Text(_connectingTiltify ? t.serverConnecting : t.serverConnectTiltify),
              onPressed: _connectingTiltify ? null : _connectTiltify,
            ),
          if (!connected) ...[
            const SizedBox(height: 8),
            TextButton(
              onPressed: _loadTiltifyStatus,
              child: Text(t.serverRefreshStatus,
                  style: TextStyle(color: KodaColors.text3, fontSize: 11)),
            ),
          ],
        ]),
      ),
      if (connected && campaignId == null) ...[
        const SizedBox(height: 16),
        _buildTiltifyCampaignPicker(),
      ],
      if (connected && campaignId != null) ...[
        const SizedBox(height: 16),
        _buildTiltifyCampaignCard(),
      ],
    ]);
  }

  Widget _buildTiltifyCampaignPicker() {
    if (_loadingTiltifyCampaigns) {
      return Center(child: CircularProgressIndicator(color: KodaColors.koda));
    }
    final t = AppLocalizations.of(context);
    final campaigns = _tiltifyCampaigns ?? [];
    if (campaigns.isEmpty) {
      return Column(children: [
        Text(t.serverNoTiltifyCampaigns,
            style: TextStyle(color: KodaColors.text3, fontSize: 12)),
        const SizedBox(height: 8),
        TextButton(onPressed: _loadTiltifyCampaigns, child: Text(t.commonRetry)),
      ]);
    }
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: KodaColors.card,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: KodaColors.border),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(t.serverPickCampaign,
            style: TextStyle(color: KodaColors.text1, fontSize: 13, fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        ...campaigns.map((c) => ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(c['title'] as String? ?? t.serverUntitledCampaign,
                  style: TextStyle(color: KodaColors.text1, fontSize: 13)),
              trailing: Icon(Icons.chevron_right, color: KodaColors.text3, size: 18),
              onTap: () => _selectTiltifyCampaign(c['id'] as String),
            )),
      ]),
    );
  }

  Widget _buildTiltifyCampaignCard() {
    final t = AppLocalizations.of(context);
    final title = _tiltifyStatus?['campaign_title'] as String? ?? t.serverUntitledCampaign;
    final url = _tiltifyStatus?['campaign_url'] as String?;
    final raised = double.tryParse('${_tiltifyStatus?['raised_amount'] ?? 0}') ?? 0;
    final goal = double.tryParse('${_tiltifyStatus?['goal_amount'] ?? 0}') ?? 0;
    final currency = _tiltifyStatus?['currency'] as String? ?? 'USD';
    final progress = goal > 0 ? (raised / goal).clamp(0.0, 1.0) : 0.0;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: KodaColors.card,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: KodaColors.border),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: TextStyle(color: KodaColors.text1,
            fontSize: 15, fontWeight: FontWeight.w600)),
        const SizedBox(height: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: LinearProgressIndicator(
            value: progress, minHeight: 8,
            backgroundColor: KodaColors.elevated,
            valueColor: AlwaysStoppedAnimation(KodaColors.mint),
          ),
        ),
        const SizedBox(height: 8),
        Text(t.serverCampaignProgress(currency, raised.toStringAsFixed(2), goal.toStringAsFixed(2)),
            style: TextStyle(color: KodaColors.text3, fontSize: 12)),
        const SizedBox(height: 12),
        Row(children: [
          if (url != null)
            TextButton(
              onPressed: () async {
                final uri = Uri.parse(url);
                if (await canLaunchUrl(uri)) launchUrl(uri, mode: LaunchMode.externalApplication);
              },
              child: Text(t.serverViewCampaign),
            ),
          const Spacer(),
          TextButton(
            onPressed: _loadTiltifyStatus,
            child: Text(t.serverRefreshButton, style: TextStyle(color: KodaColors.text3, fontSize: 12)),
          ),
        ]),
      ]),
    );
  }

  // -- Emoji ----------------------------------------------------------------

  Widget _buildEmojiTab() {
    if (_loadingEmoji) {
      return Center(child: CircularProgressIndicator(color: KodaColors.koda));
    }
    final t = AppLocalizations.of(context);
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
            child: Text(t.serverEmojiSlotsUsed(_emoji.length, limit, level),
                style: TextStyle(color: KodaColors.text2, fontSize: 12)),
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                backgroundColor: KodaColors.koda, foregroundColor: Colors.black),
            icon: _uploadingEmoji
                ? const SizedBox(width: 14, height: 14,
                    child: CircularProgressIndicator(strokeWidth: 2, color: Colors.black))
                : const Icon(Icons.add, size: 16),
            label: Text(t.serverUploadButton),
            onPressed: (_uploadingEmoji || full) ? null : _uploadEmoji,
          ),
        ]),
      ),
      Expanded(
        child: _emoji.isEmpty
            ? Center(child: Text(t.serverNoCustomEmoji,
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
                          style: TextStyle(color: KodaColors.text2, fontSize: 10)),
                      IconButton(
                        icon: Icon(Icons.delete_outline, size: 14, color: KodaColors.accent),
                        tooltip: t.serverDeleteEmojiTooltip,
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
    final t = AppLocalizations.of(context);
    final nameCtrl = TextEditingController();
    final name = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: Text(t.serverUploadEmojiTitle, style: TextStyle(color: KodaColors.text1)),
        content: KodaTextField(controller: nameCtrl, hintText: t.serverEmojiNameHint, autofocus: true),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text(t.commonCancel)),
          TextButton(onPressed: () => Navigator.pop(ctx, nameCtrl.text.trim()),
              child: Text(t.serverChooseImage)),
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
    final t = AppLocalizations.of(context);
    final level = _boostStatus?['level'] as int? ?? 0;
    final cosmeticsUnlocked = _boostStatus?['cosmetics_unlocked'] as bool? ?? false;
    final iconBorderUnlocked = _boostStatus?['icon_border_unlocked'] as bool? ?? false;
    final server = ref.watch(selectedServerProvider);
    final cosmetics = (server?['cosmetics'] as Map?) ?? {};

    return ListView(padding: const EdgeInsets.all(20), children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Text(t.serverCurrentBoostLevel(level),
            style: TextStyle(color: KodaColors.text2, fontSize: 12, fontWeight: FontWeight.w600)),
      ),
      _customizeCard(
        title: t.serverBackgroundTitle,
        description: t.serverBackgroundDescription,
        unlocked: cosmeticsUnlocked,
        lockedHint: t.serverBackgroundLockedHint,
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
                  label: Text(t.serverChooseImage),
                  onPressed: _uploadingBackground ? null : _pickBackground,
                ),
              ])
            : null,
      ),
      const SizedBox(height: 16),
      _customizeCard(
        title: t.serverIconBorderTitle,
        description: t.serverIconBorderDescription,
        unlocked: iconBorderUnlocked,
        lockedHint: t.serverIconBorderLockedHint,
        child: iconBorderUnlocked
            ? Wrap(spacing: 8, runSpacing: 8, children: _colorSwatches.map((hex) {
                final selected = cosmetics['icon_border_color'] == hex;
                return KodaTappable(
                  selected: selected,
                  semanticLabel: t.serverColorSwatchLabel(hex),
                  borderRadius: BorderRadius.circular(999),
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
        Text(t.serverBoostFromBank,
            style: TextStyle(color: KodaColors.text3, fontSize: 11)),
      ],
      const SizedBox(height: 24),
      Text(t.serverMarketplaceListingLabel, style: TextStyle(color: KodaColors.text3,
          fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 0.5)),
      const SizedBox(height: 8),
      Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: KodaColors.card,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: KodaColors.border),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(t.serverListInMarketplace, style: TextStyle(
                  color: KodaColors.text1, fontSize: 13, fontWeight: FontWeight.w600)),
              Text(t.serverListInMarketplaceDescription,
                  style: TextStyle(color: KodaColors.text3, fontSize: 11)),
            ])),
            Switch(
              value: server?['marketplace_discoverable'] as bool? ?? false,
              activeThumbColor: KodaColors.koda,
              onChanged: _setMarketplaceDiscoverable,
            ),
          ]),
          if (server?['marketplace_discoverable'] == true) ...[
            const SizedBox(height: 12),
            Text(t.serverSocialLinkLabel,
                style: TextStyle(color: KodaColors.text3, fontSize: 12)),
            const SizedBox(height: 4),
            KodaTextField(
              controller: _marketplaceLinkCtrl,
              hintText: t.serverSocialLinkHint,
              onSubmitted: (_) => _saveMarketplaceLink(),
            ),
            const SizedBox(height: 4),
            TextButton(
              onPressed: _saveMarketplaceLink,
              child: Text(t.serverSaveLinkButton),
            ),
          ],
        ]),
      ),
      const SizedBox(height: 16),
      Text(t.serverPricingLabel, style: TextStyle(color: KodaColors.text3,
          fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 0.5)),
      const SizedBox(height: 8),
      Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: KodaColors.card,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: KodaColors.border),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(t.serverPrimaryCurrencyLabel, style: TextStyle(
              color: KodaColors.text1, fontSize: 13, fontWeight: FontWeight.w600)),
          Text(t.serverPrimaryCurrencyDescription,
              style: TextStyle(color: KodaColors.text3, fontSize: 11)),
          const SizedBox(height: 10),
          DropdownButton<String>(
            value: server?['primary_currency'] as String? ?? 'USD',
            dropdownColor: KodaColors.card,
            style: TextStyle(color: KodaColors.text1, fontSize: 13),
            onChanged: (v) { if (v != null) _setPrimaryCurrency(v); },
            items: _currencyOptions.map((c) => DropdownMenuItem(
                  value: c,
                  child: Text(c),
                )).toList(),
          ),
        ]),
      ),
      const SizedBox(height: 16),
      Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: KodaColors.card,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: KodaColors.border),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(t.serverPrimaryLanguageLabel, style: TextStyle(
              color: KodaColors.text1, fontSize: 13, fontWeight: FontWeight.w600)),
          Text(t.serverPrimaryLanguageDescription,
              style: TextStyle(color: KodaColors.text3, fontSize: 11)),
          const SizedBox(height: 10),
          DropdownButton<String>(
            value: server?['primary_language'] as String? ?? 'en',
            dropdownColor: KodaColors.card,
            style: TextStyle(color: KodaColors.text1, fontSize: 13),
            onChanged: (v) { if (v != null) _setPrimaryLanguage(v); },
            items: kodaLanguageOptions.map((l) => DropdownMenuItem(
                  value: l.code,
                  child: Text(l.nativeName),
                )).toList(),
          ),
        ]),
      ),
    ]);
  }

  // USD/EUR/GBP/JPY get real symbols client-side elsewhere (see
  // lib/core/merch_cart.dart's formatMerchPrice) -- this is just the
  // set of codes a creator can pick from, kept small and unambiguous
  // rather than the full ISO 4217 list.
  static const _currencyOptions = ['USD', 'EUR', 'GBP', 'JPY', 'CAD', 'AUD'];

  Future<void> _setMarketplaceDiscoverable(bool value) async {
    final updated = await KodaApi.instance.updateServer(
        _serverId, {'marketplace_discoverable': value});
    if (updated != null && mounted) {
      ref.read(selectedServerProvider.notifier).state = updated;
      _marketplaceLinkCtrl.text = updated['marketplace_link'] as String? ?? '';
    }
  }

  Future<void> _saveMarketplaceLink() async {
    final updated = await KodaApi.instance.updateServer(
        _serverId, {'marketplace_link': _marketplaceLinkCtrl.text.trim()});
    if (updated != null && mounted) {
      ref.read(selectedServerProvider.notifier).state = updated;
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(AppLocalizations.of(context).serverMarketplaceLinkSaved)));
    }
  }

  Future<void> _setPrimaryCurrency(String currency) async {
    final updated = await KodaApi.instance.updateServer(
        _serverId, {'primary_currency': currency});
    if (updated != null && mounted) {
      ref.read(selectedServerProvider.notifier).state = updated;
    }
  }

  Future<void> _setPrimaryLanguage(String language) async {
    final updated = await KodaApi.instance.updateServer(
        _serverId, {'primary_language': language});
    if (updated != null && mounted) {
      ref.read(selectedServerProvider.notifier).state = updated;
    }
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
          Text(title, style: TextStyle(color: KodaColors.text1,
              fontSize: 14, fontWeight: FontWeight.w600)),
        ]),
        const SizedBox(height: 6),
        Text(description, style: TextStyle(color: KodaColors.text3, fontSize: 12)),
        const SizedBox(height: 12),
        if (unlocked && child != null)
          child
        else
          Text(lockedHint, style: TextStyle(
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
            SnackBar(content: Text(AppLocalizations.of(context).serverIconUpdated)));
      }
    } on UploadException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.message)));
      }
    }
  }

  Widget _buildChannelsTab() {
    final t = AppLocalizations.of(context);
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
                          SnackBar(content: Text(t.serverTemplateImported)));
                    },
                  ),
                );
              },
              icon: Icon(Icons.download_outlined, size: 16, color: KodaColors.text3),
              label: Text(t.serverImportFromDiscord,
                  style: TextStyle(color: KodaColors.text3)),
            ),
            TextButton.icon(
              onPressed: () {
                showVispSetupDialog(
                  context,
                  serverId: _serverId,
                  onApplied: (_) {
                    _loadAll();
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(t.serverVispPlanLive)));
                  },
                );
              },
              icon: Icon(Icons.auto_awesome, size: 16, color: KodaColors.koda),
              label: Text(t.serverAskVisp, style: TextStyle(color: KodaColors.koda)),
            ),
            TextButton.icon(
              onPressed: () => _showCategoryDialog(),
              icon: Icon(Icons.add, size: 16, color: KodaColors.koda),
              label: Text(t.serverAddCategoryButton, style: TextStyle(color: KodaColors.koda)),
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
                    style: TextStyle(
                        color: KodaColors.text2, fontSize: 12, fontWeight: FontWeight.w700)),
                trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                  IconButton(
                    icon: Icon(Icons.add, size: 16, color: KodaColors.text3),
                    tooltip: t.serverAddChannelHereTooltip,
                    onPressed: () => _showChannelDialog(categoryId: cat['id'] as String),
                  ),
                  PopupMenuButton<String>(
                    icon: Icon(Icons.more_vert, size: 16, color: KodaColors.text3),
                    color: KodaColors.card,
                    onSelected: (v) =>
                        v == 'rename' ? _showCategoryDialog(existing: cat) : _deleteCategory(cat),
                    itemBuilder: (_) => [
                      PopupMenuItem(value: 'rename', child: Text(t.serverRename)),
                      PopupMenuItem(value: 'delete', child: Text(t.commonDelete)),
                    ],
                  ),
                ]),
              ),
              ...channelsInCat.map(_channelTile),
            ]),
          );
        }),
        if (uncategorized.isNotEmpty) ...[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text(t.serverUncategorized,
                style: TextStyle(color: KodaColors.text3, fontSize: 12, fontWeight: FontWeight.w700)),
          ),
          ...uncategorized.map(_channelTile),
        ],
        const SizedBox(height: 12),
        OutlinedButton.icon(
          onPressed: () => _showChannelDialog(),
          icon: const Icon(Icons.add, size: 16),
          label: Text(t.serverAddChannel),
        ),
      ],
    );
  }

  Widget _channelTile(Map<String, dynamic> ch) {
    final t = AppLocalizations.of(context);
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
      title: Text(ch['name'], style: TextStyle(color: KodaColors.text1, fontSize: 13)),
      trailing: PopupMenuButton<String>(
        icon: Icon(Icons.more_vert, size: 16, color: KodaColors.text3),
        color: KodaColors.card,
        onSelected: (v) {
          if (v == 'edit') {
            _showChannelDialog(existing: ch);
          } else if (v == 'edit_rules') {
            _showRulesContentDialog(ch);
          } else {
            _deleteChannel(ch);
          }
        },
        itemBuilder: (_) => [
          PopupMenuItem(value: 'edit', child: Text(t.commonEdit)),
          if (type == 'rules')
            PopupMenuItem(value: 'edit_rules',
                child: Text(t.serverEditRulesContent)),
          PopupMenuItem(value: 'delete', child: Text(t.commonDelete)),
        ],
      ),
    );
  }


  Future<void> _showRulesContentDialog(Map<String, dynamic> ch) async {
    final server = ref.read(selectedServerProvider);
    if (server == null) return;
    final t = AppLocalizations.of(context);
    final contentController = TextEditingController(
        text: ch['rules_content'] as String? ?? '');
    final saved = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: Text(t.serverEditRulesContent,
            style: TextStyle(color: KodaColors.text1)),
        content: SizedBox(
          width: 480,
          height: 320,
          child: TextField(
            controller: contentController,
            maxLines: 12,
            style: TextStyle(color: KodaColors.text1, fontSize: 13),
            decoration: InputDecoration(
              hintText: t.serverRulesContentHint,
              contentPadding: const EdgeInsets.all(12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: KodaColors.border),
              ),
            ),
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false),
              child: Text(t.commonCancel)),
          TextButton(onPressed: () => Navigator.pop(ctx, true),
              child: Text(t.commonSave,
                  style: TextStyle(color: KodaColors.koda))),
        ],
      ),
    );
    if (saved != true) return;
    await KodaApi.instance.updateRules(
        server['id'] as String, contentController.text.trim());
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(t.serverRulesUpdated)));
    _loadAll();
  }

  Widget _buildRolesTab() {
    final t = AppLocalizations.of(context);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: TextButton.icon(
            onPressed: () => _showRoleEditor(),
            icon: Icon(Icons.add, size: 16, color: KodaColors.koda),
            label: Text(t.serverAddRole, style: TextStyle(color: KodaColors.koda)),
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
              title: Text(role['name'], style: TextStyle(color: KodaColors.text1, fontSize: 13)),
              subtitle: role['is_default'] == true
                  ? Text(t.serverDefaultRoleLabel, style: TextStyle(color: KodaColors.text3, fontSize: 11))
                  : null,
              trailing: PopupMenuButton<String>(
                icon: Icon(Icons.more_vert, size: 16, color: KodaColors.text3),
                color: KodaColors.card,
                onSelected: (v) => v == 'edit' ? _showRoleEditor(existing: role) : _deleteRole(role),
                itemBuilder: (_) => [
                  PopupMenuItem(value: 'edit', child: Text(t.commonEdit)),
                  if (role['is_default'] != true)
                    PopupMenuItem(value: 'delete', child: Text(t.commonDelete)),
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
    final t = AppLocalizations.of(context);
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
              title: Text(m['username'] ?? '', style: TextStyle(color: KodaColors.text1, fontSize: 13)),
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
                  icon: Icon(Icons.edit, size: 16, color: KodaColors.text3),
                  tooltip: t.serverManageRolesTooltip,
                  onPressed: () => _showMemberRolesDialog(m),
                ),
                if (_isCurrentlyMuted(m))
                  Padding(
                    padding: EdgeInsets.only(right: 4),
                    child: Semantics(
                      label: t.serverMutedLabel,
                      child: Icon(Icons.volume_off, size: 14, color: KodaColors.gold),
                    ),
                  ),
                if (!isSelf)
                  PopupMenuButton<String>(
                    icon: Icon(Icons.more_vert, size: 16, color: KodaColors.text3),
                    color: KodaColors.card,
                    itemBuilder: (_) => [
                      if (_isCurrentlyMuted(m))
                        PopupMenuItem(value: 'unmute', child: Text(t.serverUnmute))
                      else
                        PopupMenuItem(value: 'mute', child: Text(t.serverMute)),
                      PopupMenuItem(value: 'kick', child: Text(t.serverKick)),
                      PopupMenuItem(value: 'ban',
                          child: Text(t.serverBan, style: TextStyle(color: KodaColors.accent))),
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
        MergeSemantics(
          child: Semantics(
            label: _showBans ? t.serverExpandedLabel : t.serverCollapsedLabel,
            child: InkWell(
          onTap: () => setState(() => _showBans = !_showBans),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(children: [
              Icon(_showBans ? Icons.expand_more : Icons.chevron_right,
                  size: 16, color: KodaColors.text3),
              const SizedBox(width: 4),
              Text(t.serverBannedUsersLabel(_bans.length),
                  style: TextStyle(color: KodaColors.text3, fontSize: 11,
                      fontWeight: FontWeight.w700, letterSpacing: 0.5)),
            ]),
          ),
            ),
          ),
        ),
        if (_showBans)
          if (_bans.isEmpty)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text(t.serverNoBannedUsers, style: TextStyle(color: KodaColors.text3, fontSize: 12)),
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
                        style: TextStyle(color: KodaColors.text1, fontSize: 13)),
                    trailing: TextButton(
                      onPressed: () async {
                        final ok = await KodaApi.instance
                            .unbanMember(_serverId, b['user_id'] as String);
                        if (ok) _loadAll();
                      },
                      child: Text(t.serverUnban),
                    ),
                  ),
                )),
      ],
    );
  }

  Future<void> _kickOrBanMember(Map<String, dynamic> member, String action) async {
    final server = ref.read(selectedServerProvider);
    final t = AppLocalizations.of(context);
    final username = member['username'] as String? ?? t.serverMemberFallbackGeneric;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: KodaColors.card,
        content: Text(
            action == 'ban'
                ? t.serverBanConfirm(username, server?['name'] as String? ?? '')
                : t.serverKickConfirm(username, server?['name'] as String? ?? ''),
            style: TextStyle(color: KodaColors.text1)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text(t.commonCancel)),
          TextButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: Text(action == 'ban' ? t.serverBan : t.serverKick,
                  style: TextStyle(color: KodaColors.accent))),
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
        // Voice channels now carry real encrypted chat (see
        // ChannelChatPanel) using this same epoch-key mechanism -- a
        // departed member must lose read access there too, not just in
        // text channels, or their device keeps a live key and can keep
        // decrypting new voice-channel chat after removal.
        for (final channel in _channels) {
          if (channel['type'] == 'text' || channel['type'] == 'voice') {
            ChannelKeyManager.instance.rotateAfterDeparture(
                channel['id'] as String, myUserId: myUserId, serverId: _serverId);
          }
        }
      }
      _loadAll();
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(t.serverCouldNotModerateMember(
              (action == 'ban' ? t.serverBan : t.serverKick).toLowerCase(), username))));
    }
  }

  bool _isCurrentlyMuted(Map<String, dynamic> member) {
    final raw = member['muted_until'] as String?;
    if (raw == null) return false;
    final until = DateTime.tryParse(raw);
    return until != null && until.isAfter(DateTime.now().toUtc());
  }

  // Keys are stable identifiers (also used to look up the mute duration
  // in seconds) -- display labels are localized separately in
  // _muteDurationLabels, since a translated string can't double as a
  // lookup key the way the English word could.
  static const _muteDurations = <String, int>{
    'sec60': 60,
    'min5': 300,
    'min10': 600,
    'hour1': 3600,
    'day1': 86400,
    'week1': 604800,
  };

  Map<String, String> _muteDurationLabels(AppLocalizations t) => {
    'sec60': t.serverMuteDuration60Sec,
    'min5': t.serverMuteDuration5Min,
    'min10': t.serverMuteDuration10Min,
    'hour1': t.serverMuteDuration1Hour,
    'day1': t.serverMuteDuration1Day,
    'week1': t.serverMuteDuration1Week,
  };

  Future<void> _muteMember(Map<String, dynamic> member) async {
    final t = AppLocalizations.of(context);
    final username = member['username'] as String? ?? t.serverMemberFallbackGeneric;
    var selected = 'min10';
    final labels = _muteDurationLabels(t);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          backgroundColor: KodaColors.card,
          title: Text(t.serverMuteUserTitle(username), style: TextStyle(color: KodaColors.text1)),
          content: Column(mainAxisSize: MainAxisSize.min, children: [
            DropdownButton<String>(
              value: selected,
              dropdownColor: KodaColors.card,
              isExpanded: true,
              style: TextStyle(color: KodaColors.text1, fontSize: 13),
              onChanged: (v) => setDialogState(() => selected = v!),
              items: _muteDurations.keys
                  .map((k) => DropdownMenuItem(value: k, child: Text(labels[k] ?? k)))
                  .toList(),
            ),
          ]),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text(t.commonCancel)),
            TextButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: Text(t.serverMute, style: TextStyle(color: KodaColors.gold)),
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
          SnackBar(content: Text(t.serverCouldNotMuteMember(username))));
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

  Map<String, String> _actionLabels(AppLocalizations t) => {
    'kick': t.serverActionKicked, 'ban': t.serverActionBanned, 'unban': t.serverActionUnbanned,
    'mute': t.serverActionMuted, 'unmute': t.serverActionUnmuted,
    'flood_detected': t.serverActionFloodDetected,
    'raid_lockdown_enabled': t.serverActionRaidLockdownEnabled,
    'raid_lockdown_disabled': t.serverActionRaidLockdownDisabled,
    'voice_moved': t.serverActionMoved,
  };

  Widget _buildAuditLogTab() {
    final t = AppLocalizations.of(context);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Row(children: [
          Expanded(
            child: Text(
              t.serverAuditLogDescription,
              style: TextStyle(color: KodaColors.text3, fontSize: 12),
            ),
          ),
          const SizedBox(width: 8),
          OutlinedButton.icon(
            icon: const Icon(Icons.lock_open, size: 14),
            label: Text(t.serverUnlockInvites),
            onPressed: () async {
              final ok = await KodaApi.instance.unlockInvites(_serverId);
              if (ok && mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(t.serverInvitesUnlocked)));
                _loadAll();
              }
            },
          ),
        ]),
        const SizedBox(height: 16),
        if (_auditActions.isEmpty)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Text(t.serverNoModerationActivity,
                style: TextStyle(color: KodaColors.text3, fontSize: 13)),
          )
        else
          ..._auditActions.map((a) {
            final actor = _usernameFor(a['actor_id'] as String?) ?? t.serverSystemActor;
            final target = _usernameFor(a['target_user_id'] as String?);
            final label = _actionLabels(t)[a['action']] ?? a['action'] as String? ?? t.serverUnknownAction;
            final reason = a['reason'] as String?;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Icon(Icons.shield_outlined, size: 14, color: KodaColors.text3),
                const SizedBox(width: 8),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(color: KodaColors.text2, fontSize: 12.5),
                      children: [
                        TextSpan(text: actor, style: TextStyle(
                            color: KodaColors.text1, fontWeight: FontWeight.w600)),
                        TextSpan(text: ' $label'),
                        if (target != null) TextSpan(text: ' $target',
                            style: TextStyle(
                                color: KodaColors.text1, fontWeight: FontWeight.w600)),
                        if (reason != null && reason.isNotEmpty)
                          TextSpan(text: ' -- $reason',
                              style: const TextStyle(fontStyle: FontStyle.italic)),
                      ],
                    ),
                  ),
                ),
                Text(_formatAuditTime(a['inserted_at'] as String?),
                    style: TextStyle(color: KodaColors.text3, fontSize: 11)),
              ]),
            );
          }),
      ],
    );
  }

  // Tier 2 -- see koda-server's Koda.Reports. Only channel reports show
  // here (a server's own moderators); DM reports have no server to
  // belong to and go to a separate platform-admin queue instead (see
  // Koda.Reports.list_dm_reports's doc comment).
  Widget _buildReportsTab() {
    final t = AppLocalizations.of(context);
    final pending = _reports.where((r) => r['status'] == 'pending').toList();
    final resolved = _reports.where((r) => r['status'] != 'pending').toList();

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          t.serverReportsDescription,
          style: TextStyle(color: KodaColors.text3, fontSize: 12),
        ),
        const SizedBox(height: 16),
        if (pending.isEmpty)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Text(t.serverNoPendingReports,
                style: TextStyle(color: KodaColors.text3, fontSize: 13)),
          )
        else
          ...pending.map(_buildReportCard),
        if (resolved.isNotEmpty) ...[
          const SizedBox(height: 20),
          Text(t.serverResolvedLabel, style: TextStyle(
              color: KodaColors.text3, fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 1)),
          const SizedBox(height: 8),
          ...resolved.map(_buildReportCard),
        ],
      ],
    );
  }

  Widget _buildReportCard(Map<String, dynamic> r) {
    final t = AppLocalizations.of(context);
    final reporter = _usernameFor(r['reporter_id'] as String?) ?? t.dmUnknownUser;
    final target = _usernameFor(r['target_user_id'] as String?) ?? t.dmUnknownUser;
    final status = r['status'] as String? ?? 'pending';
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: KodaColors.card,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: KodaColors.border),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Text(r['reason'] as String? ?? t.serverReportReasonOther,
              style: TextStyle(color: KodaColors.koda, fontSize: 11, fontWeight: FontWeight.w700)),
          const Spacer(),
          Text(_formatAuditTime(r['inserted_at'] as String?),
              style: TextStyle(color: KodaColors.text3, fontSize: 11)),
        ]),
        const SizedBox(height: 6),
        Text(t.serverReportedBy(reporter, target),
            style: TextStyle(color: KodaColors.text2, fontSize: 12)),
        const SizedBox(height: 6),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: KodaColors.elevated, borderRadius: BorderRadius.circular(6)),
          child: Text(r['disclosed_content'] as String? ?? '',
              style: TextStyle(color: KodaColors.text1, fontSize: 12)),
        ),
        if ((r['note'] as String?)?.isNotEmpty ?? false) ...[
          const SizedBox(height: 6),
          Text(t.serverReportNote(r['note'] as String? ?? ''),
              style: TextStyle(color: KodaColors.text3, fontSize: 11, fontStyle: FontStyle.italic)),
        ],
        if (status == 'pending') ...[
          const SizedBox(height: 8),
          Row(children: [
            TextButton(
              onPressed: () => _resolveReport(r['id'] as String, 'dismissed'),
              child: Text(t.serverDismissButton),
            ),
            const SizedBox(width: 4),
            TextButton(
              onPressed: () => _resolveReport(r['id'] as String, 'actioned'),
              child: Text(t.serverMarkActioned, style: TextStyle(color: KodaColors.accent)),
            ),
          ]),
        ] else
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(status == 'actioned' ? t.serverReportStatusActioned : t.serverReportStatusDismissed,
                style: TextStyle(color: KodaColors.text3, fontSize: 11)),
          ),
      ]),
    );
  }

  Future<void> _resolveReport(String reportId, String status) async {
    final ok = await KodaApi.instance.resolveReport(reportId, status);
    if (ok && mounted) _loadAll();
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

    final t = AppLocalizations.of(context);
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
                label: Text(t.serverCreateInvite, style: TextStyle(color: Colors.white)),
                onPressed: () async {
                  final invite = await KodaApi.instance.createInvite(serverId);
                  if (invite != null && context.mounted) {
                    setState(() {});
                    final url = invite['url'] as String? ?? '';
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        backgroundColor: KodaColors.card,
                        title: Text(t.serverInviteCreatedTitle,
                            style: TextStyle(color: KodaColors.text1)),
                        content: SelectableText(url,
                            style: TextStyle(color: KodaColors.koda)),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text(t.commonDone)),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
            const SizedBox(height: 16),
            if (invites.isEmpty)
              Center(child: Text(t.serverNoActiveInvites,
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
                          style: TextStyle(color: KodaColors.koda, fontSize: 13),
                        ),
                        Text(t.serverUsesLabel(usesStr),
                          style: TextStyle(color: KodaColors.text3, fontSize: 11)),
                      ]),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete_outline, size: 16, color: KodaColors.accent),
                      tooltip: t.serverDeleteInviteTooltip,
                      onPressed: () async {
                        await KodaApi.instance.deleteInvite(
                            serverId, inv['code'] as String);
                        if (context.mounted) setState(() {});
                      },
                    ),
                  ]),
                );
              }),
          ],
        );
      },
    );
  }
}






