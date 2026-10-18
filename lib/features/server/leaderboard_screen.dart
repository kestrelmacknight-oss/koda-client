// lib/features/server/leaderboard_screen.dart
//
// One section per leaderboard (Server XP first, then any custom ones)
// -- Koda.Leaderboards server-side. The XP leaderboard is auto-scored
// from messages; custom leaderboards are manually scored by whoever
// holds "manage_leaderboards" (confirmed: no automatic stat backs
// these, event results are inherently manual). Deliberately never
// says "points" in UI copy -- that word already means something else
// (the Marketplace Server Bank).

import 'package:flutter/material.dart';
import '../../core/api.dart';
import '../../core/theme.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../shared/widgets.dart';

class LeaderboardScreen extends StatefulWidget {
  final String serverId;
  final bool canManage;
  const LeaderboardScreen({super.key, required this.serverId, required this.canManage});

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  bool _loading = true;
  List<Map<String, dynamic>> _leaderboards = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final leaderboards = await KodaApi.instance.getLeaderboards(widget.serverId);
    if (!mounted) return;
    // XP first regardless of creation order -- it's the primary one.
    leaderboards.sort((a, b) {
      if (a['kind'] == 'xp') return -1;
      if (b['kind'] == 'xp') return 1;
      return 0;
    });
    setState(() { _leaderboards = leaderboards; _loading = false; });
  }

  Future<void> _createCustom() async {
    final t = AppLocalizations.of(context);
    final ctrl = TextEditingController();
    final create = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: Text(t.leaderboardCreateTitle, style: TextStyle(color: KodaColors.text1)),
        content: KodaTextField(controller: ctrl, hintText: t.leaderboardNameHint, autofocus: true),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: Text(t.commonCancel)),
          TextButton(onPressed: () => Navigator.pop(context, true), child: Text(t.commonCreate)),
        ],
      ),
    );
    if (create != true || ctrl.text.trim().isEmpty) return;
    final created = await KodaApi.instance.createCustomLeaderboard(widget.serverId, ctrl.text.trim());
    if (created != null) await _load();
  }

  Future<void> _resetSeason(Map<String, dynamic> lb) async {
    final t = AppLocalizations.of(context);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: Text(t.leaderboardResetTitle, style: TextStyle(color: KodaColors.text1)),
        content: Text(t.leaderboardResetBody(lb['name'] as String? ?? ''), style: TextStyle(color: KodaColors.text3)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: Text(t.commonCancel)),
          TextButton(onPressed: () => Navigator.pop(context, true),
              child: Text(t.leaderboardResetConfirm, style: const TextStyle(color: Colors.redAccent))),
        ],
      ),
    );
    if (confirmed != true) return;
    final updated = await KodaApi.instance.resetLeaderboardSeason(lb['id'] as String);
    if (updated != null) await _load();
  }

  Future<void> _deleteCustom(Map<String, dynamic> lb) async {
    final ok = await KodaApi.instance.deleteLeaderboard(lb['id'] as String);
    if (ok) await _load();
  }

  Future<void> _adjustEntry(Map<String, dynamic> lb, Map<String, dynamic>? entry) async {
    final t = AppLocalizations.of(context);
    final userIdCtrl = TextEditingController(text: entry?['user_id'] as String? ?? '');
    final scoreCtrl = TextEditingController(text: (entry?['score'])?.toString() ?? '0');
    final save = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: Text(t.leaderboardAdjustTitle, style: TextStyle(color: KodaColors.text1)),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          KodaTextField(controller: userIdCtrl, hintText: t.leaderboardUserIdHint),
          const SizedBox(height: 8),
          KodaTextField(controller: scoreCtrl, hintText: t.leaderboardScoreHint, keyboardType: TextInputType.number),
        ]),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: Text(t.commonCancel)),
          TextButton(onPressed: () => Navigator.pop(context, true), child: Text(t.commonSave)),
        ],
      ),
    );
    if (save != true) return;
    final userId = userIdCtrl.text.trim();
    final score = int.tryParse(scoreCtrl.text.trim());
    if (userId.isEmpty || score == null) return;
    final ok = await KodaApi.instance.adjustLeaderboardEntry(lb['id'] as String, userId, score: score);
    if (ok) await _load();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: KodaColors.voidBg,
      appBar: AppBar(
        backgroundColor: KodaColors.bg2,
        title: Text(t.leaderboardScreenTitle, style: TextStyle(color: KodaColors.text1, fontSize: 16)),
        actions: [
          if (widget.canManage)
            IconButton(
              icon: Icon(Icons.add, color: KodaColors.koda),
              tooltip: t.leaderboardCreateTitle,
              onPressed: _createCustom,
            ),
        ],
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator(color: KodaColors.koda))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _leaderboards.length,
              itemBuilder: (_, i) => _buildLeaderboardSection(t, _leaderboards[i]),
            ),
    );
  }

  Widget _buildLeaderboardSection(AppLocalizations t, Map<String, dynamic> lb) {
    final entries = List<Map<String, dynamic>>.from(lb['entries'] ?? []);
    final isXp = lb['kind'] == 'xp';
    // Only "custom" leaderboards are manually scored -- "xp" and the
    // "arcade_*" kinds are machine-scored and can't be hand-adjusted or
    // deleted, only reset (Koda.Leaderboards.delete_leaderboard/1 rejects
    // any non-custom kind server-side too).
    final isManual = lb['kind'] == 'custom';
    final viewerRank = lb['viewer_rank'] as Map<String, dynamic>?;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: KodaColors.card,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: KodaColors.border),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 8),
          child: Row(children: [
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(lb['name'] as String? ?? '',
                  style: TextStyle(color: KodaColors.text1, fontSize: 14, fontWeight: FontWeight.w700)),
              Text(t.leaderboardSeasonLabel(lb['season_number'] as int? ?? 1),
                  style: TextStyle(color: KodaColors.text3, fontSize: 11)),
            ])),
            if (widget.canManage) ...[
              if (isManual)
                IconButton(
                  icon: Icon(Icons.add_circle_outline, size: 18, color: KodaColors.text3),
                  tooltip: t.leaderboardAdjustTitle,
                  onPressed: () => _adjustEntry(lb, null),
                ),
              IconButton(
                icon: Icon(Icons.restart_alt, size: 18, color: KodaColors.text3),
                tooltip: t.leaderboardResetTitle,
                onPressed: () => _resetSeason(lb),
              ),
              if (isManual)
                IconButton(
                  icon: const Icon(Icons.delete_outline, size: 18, color: Colors.redAccent),
                  tooltip: t.commonDelete,
                  onPressed: () => _deleteCustom(lb),
                ),
            ],
          ]),
        ),
        if (entries.isEmpty)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Text(t.leaderboardEmptyState, style: TextStyle(color: KodaColors.text3, fontSize: 12)),
          )
        else
          for (var i = 0; i < entries.length; i++) _buildEntryRow(t, i + 1, entries[i], isXp, isManual, lb),
        if (viewerRank != null)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 14),
            child: Text(
                t.leaderboardYourRank(viewerRank['rank'] as int, viewerRank['score'] as int),
                style: TextStyle(color: KodaColors.koda, fontSize: 11, fontWeight: FontWeight.w600)),
          )
        else
          const SizedBox(height: 8),
      ]),
    );
  }

  Widget _buildEntryRow(AppLocalizations t, int rank, Map<String, dynamic> entry, bool isXp, bool isManual, Map<String, dynamic> lb) {
    final username = entry['username'] as String? ?? entry['user_id'] as String? ?? '';
    final score = entry['score'] as int? ?? 0;
    return ListTile(
      dense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      leading: SizedBox(
        width: 28,
        child: Text('#$rank', style: TextStyle(color: KodaColors.text3, fontSize: 12, fontWeight: FontWeight.w700)),
      ),
      title: Text(username, style: TextStyle(color: KodaColors.text1, fontSize: 13)),
      trailing: Row(mainAxisSize: MainAxisSize.min, children: [
        Text(isXp ? t.leaderboardXpScore(score, entry['level'] as int? ?? 0) : '$score',
            style: TextStyle(color: KodaColors.text2, fontSize: 12)),
        if (widget.canManage && isManual) ...[
          const SizedBox(width: 4),
          IconButton(
            icon: Icon(Icons.edit, size: 14, color: KodaColors.text3),
            onPressed: () => _adjustEntry(lb, entry),
          ),
        ],
      ]),
    );
  }
}
