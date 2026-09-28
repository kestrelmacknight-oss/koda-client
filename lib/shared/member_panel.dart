// lib/shared/member_panel.dart
//
// Collapsible member list panel shown on the right side of chat.
// Groups members by role, offline members at bottom.
// Click a member to show their profile popup.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/api.dart';
import '../core/theme.dart';
import '../core/providers.dart';
import '../l10n/generated/app_localizations.dart';
import 'pronoun_label.dart';
import 'tier_badge.dart';
import 'widgets.dart';

class MemberPanel extends ConsumerStatefulWidget {
  final Map<String, dynamic> server;
  final Function(Map<String, dynamic>) onMemberTap;
  final bool canKick;
  final bool canBan;
  const MemberPanel({
    super.key,
    required this.server,
    required this.onMemberTap,
    this.canKick = false,
    this.canBan = false,
  });
  @override
  ConsumerState<MemberPanel> createState() => _MemberPanelState();
}

class _MemberPanelState extends ConsumerState<MemberPanel> {
  List<Map<String, dynamic>> _presence = [];
  bool _loading = true;
  final Set<String> _collapsedRoles = {};

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void didUpdateWidget(MemberPanel old) {
    super.didUpdateWidget(old);
    if (old.server['id'] != widget.server['id']) _load();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    final presence = await KodaApi.instance.getServerPresence(
        widget.server['id'] as String);
    if (!mounted) return;
    setState(() { _presence = presence; _loading = false; });
  }

  // Build grouped member list
  // Groups: each role (online members), then Offline
  List<_MemberGroup> _buildGroups(AppLocalizations t) {
    final online = _presence.where((m) => m['online'] == true).toList();
    final offline = _presence.where((m) => m['online'] != true).toList();

    // Collect all roles across online members
    final roleMap = <String, Map<String, dynamic>>{};
    final membersByRole = <String, List<Map<String, dynamic>>>{};

    for (final m in online) {
      final roles = m['roles'] as List? ?? [];
      if (roles.isEmpty) {
        roleMap['__no_role'] = {'id': '__no_role', 'name': t.serverTabMembers, 'color': '#6b7280'};
        membersByRole.putIfAbsent('__no_role', () => []).add(m);
      } else {
        // Use highest role (first in list)
        final role = roles.first as Map<String, dynamic>;
        final roleId = role['id'] as String;
        roleMap[roleId] = role;
        membersByRole.putIfAbsent(roleId, () => []).add(m);
      }
    }

    final groups = <_MemberGroup>[];
    for (final entry in membersByRole.entries) {
      final role = roleMap[entry.key]!;
      groups.add(_MemberGroup(
        id: entry.key,
        name: role['name'] as String? ?? t.serverTabMembers,
        color: role['color'] as String? ?? '#6b7280',
        members: entry.value,
        isOffline: false,
      ));
    }

    if (offline.isNotEmpty) {
      groups.add(_MemberGroup(
        id: '__offline',
        name: t.memberPanelOfflineLabel,
        color: '#6b7280',
        members: offline,
        isOffline: true,
      ));
    }

    return groups;
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    if (_loading) {
      return Container(
        width: 240,
        color: KodaColors.bg2,
        child: Center(
            child: CircularProgressIndicator(color: KodaColors.koda)),
      );
    }

    final groups = _buildGroups(t);
    final totalOnline = _presence.where((m) => m['online'] == true).length;

    return Container(
      width: 240,
      color: KodaColors.bg2,
      child: Column(children: [
        // Header
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: KodaColors.border))),
          child: Row(children: [
            Icon(Icons.people_outlined,
                color: KodaColors.text3, size: 15),
            const SizedBox(width: 6),
            Text(t.memberPanelHeaderLabel(totalOnline),
                style: TextStyle(
                    color: KodaColors.text3,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5)),
            const Spacer(),
            KodaTappable(
              onTap: _load,
              semanticLabel: t.memberPanelRefreshTooltip,
              child: Icon(Icons.refresh_outlined,
                  color: KodaColors.text3, size: 14),
            ),
          ]),
        ),

        // Member list
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: groups.length,
            itemBuilder: (_, i) => _buildGroup(groups[i], t),
          ),
        ),
      ]),
    );
  }

  Widget _buildGroup(_MemberGroup group, AppLocalizations t) {
    final collapsed = _collapsedRoles.contains(group.id);
    final color = _parseColor(group.color);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Role header
        KodaTappable(
          onTap: () => setState(() {
            if (collapsed) {
              _collapsedRoles.remove(group.id);
            } else {
              _collapsedRoles.add(group.id);
            }
          }),
          semanticLabel: '${group.name}, ${t.memberPanelMemberCount(group.members.length)}, '
              '${collapsed ? t.serverCollapsedLabel : t.serverExpandedLabel}',
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 14, 10, 4),
            child: Row(children: [
              Icon(
                collapsed ? Icons.chevron_right : Icons.expand_more,
                size: 14,
                color: KodaColors.text3,
              ),
              const SizedBox(width: 2),
              Text(
                '${group.name.toUpperCase()} — ${group.members.length}',
                style: TextStyle(
                  color: group.isOffline ? KodaColors.text3 : color,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                ),
              ),
            ]),
          ),
        ),

        // Members
        if (!collapsed)
          ...group.members.map((m) => _buildMemberTile(m, group.isOffline, t)),
      ],
    );
  }

  Widget _buildMemberTile(Map<String, dynamic> member, bool isOffline, AppLocalizations t) {
    final username = member['username'] as String? ?? t.memberPanelUnknownUser;
    final avatarUrl = member['avatar_url'] as String?;
    final tier = member['koda_tier'] as String?;
    final roles = member['roles'] as List? ?? [];
    final topRole = roles.isNotEmpty
        ? roles.first as Map<String, dynamic>
        : null;
    final nameColor = topRole != null
        ? _parseColor(topRole['color'] as String? ?? '#e2e4f0')
        : KodaColors.text2;

    final statusLabel = isOffline ? t.memberPanelOfflineLabel : t.statusOnline;
    final tierLabel = tier != null && tier != 'free' ? t.memberPanelTierSuffix(tier) : '';

    return Semantics(
      button: true,
      label: '$username, $statusLabel$tierLabel',
      child: GestureDetector(
        onSecondaryTapUp: (d) => _showModerationMenu(member, d.globalPosition),
        child: InkWell(
        onTap: () => widget.onMemberTap(member),
        borderRadius: BorderRadius.circular(6),
        child: ExcludeSemantics(
          child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          child: Row(children: [
            TierFramedAvatar(
              tier: tier,
              avatarSize: 32,
              child: Stack(clipBehavior: Clip.none, children: [
                // Avatar
                CircleAvatar(
                  radius: 16,
                  backgroundColor: KodaColors.elevated,
                  backgroundImage: avatarUrl != null
                      ? NetworkImage(avatarUrl)
                      : null,
                  child: avatarUrl == null
                      ? Text(username[0].toUpperCase(),
                          style: TextStyle(
                              color: KodaColors.text1,
                              fontSize: 12,
                              fontWeight: FontWeight.w700))
                      : null,
                ),
                // Status dot
                Positioned(
                  bottom: -1,
                  right: -1,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: isOffline
                          ? const Color(0xFF6b7280)
                          : KodaColors.koda,
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: KodaColors.bg2, width: 1.5),
                    ),
                  ),
                ),
              ]),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                withPronouns(username, member),
                style: TextStyle(
                  color: isOffline
                      ? KodaColors.text3
                      : nameColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            TierBadge(tier: tier, size: 13),
            if ((widget.canKick || widget.canBan) &&
                member['user_id'] != ref.read(authProvider).user?.id)
              Builder(builder: (buttonContext) => IconButton(
                icon: Icon(Icons.more_vert, size: 14, color: KodaColors.text3),
                tooltip: t.memberPanelModerationActionsTooltip,
                visualDensity: VisualDensity.compact,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(minWidth: 24, minHeight: 24),
                onPressed: () {
                  final box = buttonContext.findRenderObject() as RenderBox;
                  final position = box.localToGlobal(box.size.center(Offset.zero));
                  _showModerationMenu(member, position);
                },
              )),
          ]),
          ),
        ),
        ),
      ),
    );
  }

  Future<void> _showModerationMenu(Map<String, dynamic> member, Offset position) async {
    final me = ref.read(authProvider).user;
    if (member['user_id'] == me?.id) return; // can't moderate yourself
    if (!widget.canKick && !widget.canBan) return;

    // Captured before the awaits below, so we don't touch a
    // possibly-unmounted context afterward.
    final t = AppLocalizations.of(context);

    final action = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(position.dx, position.dy, position.dx, position.dy),
      color: KodaColors.card,
      items: [
        if (widget.canKick)
          PopupMenuItem(value: 'kick', child: Text(t.serverKick)),
        if (widget.canBan)
          PopupMenuItem(value: 'ban',
              child: Text(t.serverBan, style: TextStyle(color: KodaColors.accent))),
      ],
    );
    if (!mounted || action == null) return;
    final serverId = widget.server['id'] as String;
    final userId = member['user_id'] as String;
    final username = member['username'] as String? ?? t.serverMemberFallbackGeneric;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: KodaColors.card,
        content: Text(
            action == 'ban'
                ? t.serverBanConfirm(username, widget.server['name'] as String? ?? '')
                : t.serverKickConfirm(username, widget.server['name'] as String? ?? ''),
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

    final ok = action == 'ban'
        ? await KodaApi.instance.banMember(serverId, userId)
        : await KodaApi.instance.kickMember(serverId, userId);
    if (mounted) {
      if (ok) {
        _load();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(t.serverCouldNotModerateMember(
                (action == 'ban' ? t.serverBan : t.serverKick).toLowerCase(), username))));
      }
    }
  }

  Color _parseColor(String hex) {
    try {
      return Color(int.parse(hex.replaceFirst('#', '0xFF')));
    } catch (_) {
      return KodaColors.text2;
    }
  }
}

class _MemberGroup {
  final String id;
  final String name;
  final String color;
  final List<Map<String, dynamic>> members;
  final bool isOffline;

  const _MemberGroup({
    required this.id,
    required this.name,
    required this.color,
    required this.members,
    required this.isOffline,
  });
}