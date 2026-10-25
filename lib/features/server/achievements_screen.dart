// lib/features/server/achievements_screen.dart
//
// Server-created achievements (Koda.Achievements) -- boost-gated custom
// badges, unlocked once the server reaches Boost Level 3. Losing that
// level later never deletes a definition or revokes an existing holder
// (both keep showing exactly as before); it only blocks awarding to
// anyone new until boosts bring the server back to level 3 -- see
// `_unlocked` below, read fresh from the server on every load rather
// than cached, since it can change independently of anything this
// screen does.

import 'package:flutter/material.dart';
import '../../core/api.dart';
import '../../core/theme.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../shared/widgets.dart';

class AchievementsScreen extends StatefulWidget {
  final String serverId;
  final bool canManage;
  const AchievementsScreen({super.key, required this.serverId, required this.canManage});

  @override
  State<AchievementsScreen> createState() => _AchievementsScreenState();
}

class _AchievementsScreenState extends State<AchievementsScreen> {
  bool _loading = true;
  bool _unlocked = false;
  List<Map<String, dynamic>> _achievements = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final result = await KodaApi.instance.getAchievements(widget.serverId);
    if (!mounted) return;
    setState(() {
      _achievements = List<Map<String, dynamic>>.from(result['achievements'] as List);
      _unlocked = result['unlocked'] == true;
      _loading = false;
    });
  }

  void _showActionFailed() {
    final t = AppLocalizations.of(context);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(t.commonActionFailed)));
  }

  Future<void> _create() async {
    final t = AppLocalizations.of(context);
    final nameCtrl = TextEditingController();
    final descCtrl = TextEditingController();
    final iconCtrl = TextEditingController(text: '🏆');
    final create = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: Text(t.achievementCreateTitle, style: TextStyle(color: KodaColors.text1)),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(
            width: 56,
            child: KodaTextField(controller: iconCtrl, hintText: '🏆'),
          ),
          const SizedBox(height: 8),
          KodaTextField(controller: nameCtrl, hintText: t.achievementNameHint, autofocus: true),
          const SizedBox(height: 8),
          KodaTextField(controller: descCtrl, hintText: t.achievementDescriptionHint),
        ]),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: Text(t.commonCancel)),
          TextButton(onPressed: () => Navigator.pop(context, true), child: Text(t.commonCreate)),
        ],
      ),
    );
    if (create != true || nameCtrl.text.trim().isEmpty) return;
    final created = await KodaApi.instance.createAchievement(
      widget.serverId,
      name: nameCtrl.text.trim(),
      description: descCtrl.text.trim().isEmpty ? null : descCtrl.text.trim(),
      icon: iconCtrl.text.trim().isEmpty ? null : iconCtrl.text.trim(),
    );
    if (created != null) {
      await _load();
    } else if (mounted) {
      _showActionFailed();
    }
  }

  Future<void> _delete(Map<String, dynamic> achievement) async {
    final t = AppLocalizations.of(context);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: Text(t.achievementDeleteTitle, style: TextStyle(color: KodaColors.text1)),
        content: Text(t.achievementDeleteConfirm(achievement['name'] as String? ?? ''),
            style: TextStyle(color: KodaColors.text3)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: Text(t.commonCancel)),
          TextButton(onPressed: () => Navigator.pop(context, true),
              child: Text(t.commonDelete, style: const TextStyle(color: Colors.redAccent))),
        ],
      ),
    );
    if (confirmed != true) return;
    final ok = await KodaApi.instance.deleteAchievement(achievement['id'] as String);
    if (ok) {
      await _load();
    } else if (mounted) {
      _showActionFailed();
    }
  }

  Future<void> _award(Map<String, dynamic> achievement) async {
    final t = AppLocalizations.of(context);
    final userIdCtrl = TextEditingController();
    final award = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: Text(t.achievementAwardTitle, style: TextStyle(color: KodaColors.text1)),
        content: KodaTextField(controller: userIdCtrl, hintText: t.achievementUserIdHint, autofocus: true),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: Text(t.commonCancel)),
          TextButton(onPressed: () => Navigator.pop(context, true), child: Text(t.achievementAwardButton)),
        ],
      ),
    );
    if (award != true || userIdCtrl.text.trim().isEmpty) return;
    final ok = await KodaApi.instance.awardAchievement(achievement['id'] as String, userIdCtrl.text.trim());
    if (ok) {
      await _load();
    } else if (mounted) {
      _showActionFailed();
    }
  }

  Future<void> _revoke(Map<String, dynamic> achievement, Map<String, dynamic> recipient) async {
    final ok = await KodaApi.instance.revokeAchievement(
        achievement['id'] as String, recipient['user_id'] as String);
    if (ok) {
      await _load();
    } else if (mounted) {
      _showActionFailed();
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: KodaColors.voidBg,
      appBar: AppBar(
        backgroundColor: KodaColors.bg2,
        title: Text(t.achievementScreenTitle, style: TextStyle(color: KodaColors.text1, fontSize: 16)),
        actions: [
          if (widget.canManage && _unlocked)
            IconButton(
              icon: Icon(Icons.add, color: KodaColors.koda),
              tooltip: t.achievementCreateTitle,
              onPressed: _create,
            ),
        ],
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator(color: KodaColors.koda))
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                if (!_unlocked) ...[
                  Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: KodaColors.elevated,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(children: [
                      Icon(Icons.lock_outline, size: 16, color: KodaColors.text3),
                      const SizedBox(width: 8),
                      Expanded(child: Text(t.achievementLockedBanner,
                          style: TextStyle(color: KodaColors.text3, fontSize: 12))),
                    ]),
                  ),
                ],
                if (_achievements.isEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Text(t.achievementEmptyState,
                        style: TextStyle(color: KodaColors.text3, fontSize: 13), textAlign: TextAlign.center),
                  )
                else
                  for (final a in _achievements) _buildAchievementCard(t, a),
              ],
            ),
    );
  }

  Widget _buildAchievementCard(AppLocalizations t, Map<String, dynamic> a) {
    final recipients = List<Map<String, dynamic>>.from(a['recipients'] ?? []);
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: KodaColors.card,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: KodaColors.border),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Text(a['icon'] as String? ?? '🏆', style: const TextStyle(fontSize: 22)),
            const SizedBox(width: 10),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(a['name'] as String? ?? '',
                  style: TextStyle(color: KodaColors.text1, fontSize: 14, fontWeight: FontWeight.w700)),
              if ((a['description'] as String?)?.isNotEmpty == true)
                Text(a['description'] as String,
                    style: TextStyle(color: KodaColors.text3, fontSize: 12)),
            ])),
            if (widget.canManage) ...[
              IconButton(
                icon: Icon(Icons.person_add_alt_outlined, size: 18,
                    color: _unlocked ? KodaColors.text3 : KodaColors.text3.withValues(alpha: 0.4)),
                tooltip: t.achievementAwardTitle,
                onPressed: _unlocked ? () => _award(a) : null,
              ),
              IconButton(
                icon: const Icon(Icons.delete_outline, size: 18, color: Colors.redAccent),
                tooltip: t.commonDelete,
                onPressed: () => _delete(a),
              ),
            ],
          ]),
          if (recipients.isNotEmpty) ...[
            const SizedBox(height: 8),
            Wrap(spacing: 6, runSpacing: 6, children: recipients.map((r) {
              final username = r['username'] as String? ?? r['user_id'] as String? ?? '';
              return Chip(
                backgroundColor: KodaColors.elevated,
                label: Text(username, style: TextStyle(color: KodaColors.text2, fontSize: 11)),
                deleteIcon: widget.canManage ? const Icon(Icons.close, size: 14) : null,
                onDeleted: widget.canManage ? () => _revoke(a, r) : null,
              );
            }).toList()),
          ] else
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Text(t.achievementNoRecipients, style: TextStyle(color: KodaColors.text3, fontSize: 11)),
            ),
        ]),
      ),
    );
  }
}
