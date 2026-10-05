// lib/features/admin/admin_screen.dart
//
// Admin panel — visible only to users with is_admin: true.
// Tabs: Backer Codes | Users | DM Reports | Spam Flags | Wiki | Boosts
//
// Backer Codes: pick from the 5 backer-reward checkboxes (see
// koda-server's Koda.Invites.apply_rewards/3) or hand-type advanced
// flags, generate a one-time code, view all codes/redemption counts/
// expiry, and toggle whether /auth/register requires one at all.
// Users: search users, view flags, apply manual flags.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/api.dart';
import '../../../core/theme.dart';
import '../../../shared/widgets.dart';
import '../../l10n/generated/app_localizations.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});
  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabs;

  @override
  void initState() {
    super.initState();
    _tabs = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: KodaColors.voidBg,
      appBar: AppBar(
        backgroundColor: KodaColors.bg2,
        title: Row(children: [
          Icon(Icons.admin_panel_settings_outlined,
              size: 18, color: KodaColors.koda),
          SizedBox(width: 8),
          Text(t.adminPanelTitle,
              style: TextStyle(color: KodaColors.text1, fontSize: 16)),
        ]),
        bottom: TabBar(
          controller: _tabs,
          indicatorColor: KodaColors.koda,
          labelColor: KodaColors.text1,
          unselectedLabelColor: KodaColors.text3,
          tabs: [
            Tab(text: t.adminTabBackerCodes),
            Tab(text: t.adminTabUsers),
            Tab(text: t.adminTabDmReports),
            Tab(text: t.adminTabSpamFlags),
            Tab(text: t.adminTabWiki),
            Tab(text: t.adminTabBoosts),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabs,
        children: [
          _BackerCodesTab(),
          _UsersTab(),
          _DmReportsTab(),
          _SpamFlagsTab(),
          _WikiTab(),
          _BoostsTab(),
        ],
      ),
    );
  }
}

// ── Backer Codes Tab ──────────────────────────────────────────────────────────

class _BackerCodesTab extends StatefulWidget {
  @override
  State<_BackerCodesTab> createState() => _BackerCodesTabState();
}

class _BackerCodesTabState extends State<_BackerCodesTab> {
  List<Map<String, dynamic>> _codes = [];
  bool _loading = true;
  bool? _registrationOpen;

  @override
  void initState() {
    super.initState();
    _load();
    KodaApi.instance.getRegistrationOpen().then((open) {
      if (mounted) setState(() => _registrationOpen = open);
    });
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    final codes = await KodaApi.instance.listBackerCodes();
    if (!mounted) return;
    setState(() { _codes = codes; _loading = false; });
  }

  Future<void> _toggleRegistrationOpen(bool open) async {
    setState(() => _registrationOpen = open); // optimistic
    final result = await KodaApi.instance.setRegistrationOpen(open);
    if (result == null && mounted) setState(() => _registrationOpen = !open); // revert on failure
  }

  /// One-line human summary of a code's `rewards` map, shown in the list
  /// instead of raw JSON -- mirrors the 5 reward checkboxes in
  /// _showCreateDialog exactly, so a glance at this list tells you what
  /// a code actually does without opening it.
  String _rewardsSummary(AppLocalizations t, Map<String, dynamic> rewards) {
    final parts = <String>[];
    if (rewards['alpha_beta_access'] == true) parts.add(t.adminRewardAlphaBetaAccess);
    if (rewards['lifetime_pulse'] == true) parts.add(t.adminRewardLifetimePulse);
    final tokens = rewards['monthly_boost_tokens'] as int? ?? 0;
    if (tokens > 0) parts.add(t.adminRewardMonthlyBoostTokens(tokens));
    if (rewards['animated_frame'] == true) parts.add(t.adminRewardAnimatedFrame);
    if (rewards['founders_hall'] == true) parts.add(t.adminRewardFoundersHall);
    if (rewards['titan_glow'] == true) parts.add(t.adminRewardTitanGlow);
    return parts.isEmpty ? t.adminRewardsNone : parts.join(' · ');
  }

  Future<void> _showCreateDialog() async {
    final t = AppLocalizations.of(context);
    final codeCtrl  = TextEditingController();
    final noteCtrl  = TextEditingController();
    final flagCtrl  = TextEditingController();
    final maxCtrl   = TextEditingController();

    // The 5 reward checkboxes map 1:1 onto Koda.Invites.apply_rewards/3's
    // well-known `rewards` keys -- see that function's doc comment for
    // exactly what each one does to the redeeming account.
    var alphaBetaAccess = false;
    var lifetimePulse = false;
    var oneMonthlyToken = false;
    var animatedFrameBundle = false; // frame + Founders Hall + 2 tokens, bundled as the user asked
    var titanGlow = false;

    await showDialog(
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (dialogContext, setDialogState) => AlertDialog(
          backgroundColor: KodaColors.card,
          title: Text(t.adminCreateBackerCodeTitle,
              style: TextStyle(color: KodaColors.text1)),
          content: SizedBox(
            width: 420,
            child: SingleChildScrollView(
              child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
                KodaTextField(controller: codeCtrl,
                    hintText: t.adminCodeHint, autofocus: true),
                const SizedBox(height: 8),
                KodaTextField(controller: noteCtrl,
                    hintText: t.adminNoteHint),
                const SizedBox(height: 8),
                KodaTextField(controller: maxCtrl,
                    hintText: t.adminMaxUsesHint,
                    keyboardType: TextInputType.number),
                const SizedBox(height: 12),
                Text(t.adminRewardsHeader,
                    style: TextStyle(color: KodaColors.text3, fontSize: 12, fontWeight: FontWeight.w600)),
                CheckboxListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text(t.adminRewardAlphaBetaAccess, style: TextStyle(color: KodaColors.text1, fontSize: 13)),
                  value: alphaBetaAccess,
                  onChanged: (v) => setDialogState(() => alphaBetaAccess = v ?? false),
                ),
                CheckboxListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text(t.adminRewardLifetimePulse, style: TextStyle(color: KodaColors.text1, fontSize: 13)),
                  value: lifetimePulse,
                  onChanged: (v) => setDialogState(() => lifetimePulse = v ?? false),
                ),
                CheckboxListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text(t.adminRewardMonthlyBoostTokenOne, style: TextStyle(color: KodaColors.text1, fontSize: 13)),
                  value: oneMonthlyToken,
                  onChanged: (v) => setDialogState(() => oneMonthlyToken = v ?? false),
                ),
                CheckboxListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text(t.adminRewardAnimatedFrameBundle, style: TextStyle(color: KodaColors.text1, fontSize: 13)),
                  value: animatedFrameBundle,
                  onChanged: (v) => setDialogState(() => animatedFrameBundle = v ?? false),
                ),
                CheckboxListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text(t.adminRewardTitanGlow, style: TextStyle(color: KodaColors.text1, fontSize: 13)),
                  value: titanGlow,
                  onChanged: (v) => setDialogState(() => titanGlow = v ?? false),
                ),
                const SizedBox(height: 8),
                KodaTextField(controller: flagCtrl,
                    hintText: t.adminFlagsJsonHint),
              ]),
            ),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(dialogContext),
                child: Text(t.commonCancel)),
            TextButton(
              onPressed: () async {
                Map<String, dynamic> flags = {};
                try {
                  if (flagCtrl.text.trim().isNotEmpty) {
                    final cleaned = flagCtrl.text.trim();
                    flags = Map<String, dynamic>.from(
                      (cleaned.startsWith('{')
                          ? _parseSimpleJson(cleaned)
                          : {'flag': cleaned}));
                  }
                } catch (_) {
                  flags = {'note': flagCtrl.text.trim()};
                }

                final rewards = <String, dynamic>{
                  if (alphaBetaAccess) 'alpha_beta_access': true,
                  if (lifetimePulse) 'lifetime_pulse': true,
                  if (animatedFrameBundle) 'animated_frame': true,
                  if (animatedFrameBundle) 'founders_hall': true,
                  if (titanGlow) 'titan_glow': true,
                  if (oneMonthlyToken || animatedFrameBundle)
                    'monthly_boost_tokens': (oneMonthlyToken ? 1 : 0) + (animatedFrameBundle ? 2 : 0),
                };

                Navigator.pop(dialogContext);
                final result = await KodaApi.instance.createBackerCode(
                  code:    codeCtrl.text.trim().isEmpty ? null : codeCtrl.text.trim().toUpperCase(),
                  flags:   flags,
                  rewards: rewards,
                  note:    noteCtrl.text.trim().isEmpty ? null : noteCtrl.text.trim(),
                  maxUses: int.tryParse(maxCtrl.text.trim()),
                );

                if (result != null && mounted) {
                  _load();
                  final code = result['code'] as String? ?? '';
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      backgroundColor: KodaColors.card,
                      title: Text(t.adminCodeCreatedTitle,
                          style: TextStyle(color: KodaColors.text1)),
                      content: Column(mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Text(t.adminCodeLabel,
                            style: TextStyle(color: KodaColors.text3, fontSize: 12)),
                        const SizedBox(height: 4),
                        Row(children: [
                          Expanded(child: SelectableText(code,
                              style: TextStyle(
                                  color: KodaColors.koda,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700))),
                          IconButton(
                            icon: Icon(Icons.copy, size: 16,
                                color: KodaColors.text3),
                            tooltip: t.adminCopyCodeTooltip,
                            onPressed: () =>
                                Clipboard.setData(ClipboardData(text: code)),
                          ),
                        ]),
                        const SizedBox(height: 8),
                        Text(_rewardsSummary(t, rewards),
                            style: TextStyle(
                                color: KodaColors.text3, fontSize: 12)),
                      ]),
                      actions: [
                        TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text(t.commonDone)),
                      ],
                    ),
                  );
                }
              },
              child: Text(t.commonCreate),
            ),
          ],
        ),
      ),
    );
  }

  // Very simple JSON parser for {"key":"value"} objects
  Map<String, dynamic> _parseSimpleJson(String s) {
    final result = <String, dynamic>{};
    final inner = s.trim().replaceAll(RegExp(r'^\{|\}$'), '');
    for (final pair in inner.split(',')) {
      final parts = pair.split(':');
      if (parts.length >= 2) {
        final key = parts[0].trim().replaceAll('"', '');
        final val = parts.sublist(1).join(':').trim().replaceAll('"', '');
        result[key] = val;
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(16),
        child: Row(children: [
          Text(t.adminBackerCodesHeader,
              style: TextStyle(color: KodaColors.text1,
                  fontSize: 15, fontWeight: FontWeight.w700)),
          const Spacer(),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(backgroundColor: KodaColors.koda),
            icon: const Icon(Icons.add, size: 16, color: Colors.white),
            label: Text(t.adminNewCodeButton,
                style: TextStyle(color: Colors.white)),
            onPressed: _showCreateDialog,
          ),
        ]),
      ),
      // Registration gate toggle -- this is what makes "Alpha/Beta
      // Access" a real reward rather than just a recorded flag (see
      // AuthController.register/2 server-side): while invite-only, a
      // backer code doubles as the thing that lets someone create an
      // account at all.
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Row(children: [
          Icon(Icons.lock_outline, size: 14, color: KodaColors.text3),
          const SizedBox(width: 6),
          Expanded(child: Text(
              _registrationOpen == true
                  ? t.adminRegistrationOpenLabel
                  : t.adminRegistrationInviteOnlyLabel,
              style: TextStyle(color: KodaColors.text2, fontSize: 12))),
          Switch(
            value: _registrationOpen ?? false,
            activeThumbColor: KodaColors.koda,
            onChanged: _registrationOpen == null ? null : _toggleRegistrationOpen,
          ),
        ]),
      ),
      Divider(color: KodaColors.border, height: 1),
      Expanded(
        child: _loading
            ? Center(child: CircularProgressIndicator(
                color: KodaColors.koda))
            : _codes.isEmpty
                ? Center(child: Text(t.adminNoCodesYet,
                    style: TextStyle(color: KodaColors.text3)))
                : ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: _codes.length,
                    itemBuilder: (_, i) {
                      final c = _codes[i];
                      final uses    = c['uses'] as int? ?? 0;
                      final maxUses = c['max_uses'] as int?;
                      final usesStr = maxUses != null
                          ? t.adminUsesOfMax(uses, maxUses)
                          : t.adminUsesCount(uses);
                      final rewards = Map<String, dynamic>.from(c['rewards'] as Map? ?? {});
                      return Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: KodaColors.card,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: KodaColors.border),
                        ),
                        child: Row(children: [
                          Expanded(child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Row(children: [
                              SelectableText(
                                c['code'] as String? ?? '',
                                style: TextStyle(
                                    color: KodaColors.koda,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 2),
                              ),
                              const SizedBox(width: 8),
                              IconButton(
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                                icon: Icon(Icons.copy, size: 14,
                                    color: KodaColors.text3),
                                tooltip: t.adminCopyCodeTooltip,
                                onPressed: () => Clipboard.setData(
                                    ClipboardData(text: c['code'] as String)),
                              ),
                            ]),
                            if (c['note'] != null)
                              Text(c['note'] as String,
                                  style: TextStyle(
                                      color: KodaColors.text2, fontSize: 12)),
                            const SizedBox(height: 4),
                            Text(_rewardsSummary(t, rewards),
                                style: TextStyle(
                                    color: KodaColors.text3, fontSize: 11)),
                            Text(usesStr,
                                style: TextStyle(
                                    color: KodaColors.text3, fontSize: 11)),
                          ])),
                        ]),
                      );
                    },
                  ),
      ),
    ]);
  }
}

// ── Users Tab ─────────────────────────────────────────────────────────────────

class _UsersTab extends StatefulWidget {
  @override
  State<_UsersTab> createState() => _UsersTabState();
}

class _UsersTabState extends State<_UsersTab> {
  final _searchCtrl = TextEditingController();
  List<Map<String, dynamic>> _members = [];
  bool _loading = false;

  Future<void> _search(String query) async {
    if (query.trim().isEmpty) return;
    setState(() => _loading = true);
    // Search via server members -- uses discover endpoint for now
    final results = await KodaApi.instance.searchUsers(query.trim());
    if (!mounted) return;
    setState(() { _members = results; _loading = false; });
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(16),
        child: KodaTextField(
          controller: _searchCtrl,
          hintText: t.adminSearchUsersHint,
          onSubmitted: _search,
        ),
      ),
      Divider(color: KodaColors.border, height: 1),
      Expanded(
        child: _loading
            ? Center(child: CircularProgressIndicator(
                color: KodaColors.koda))
            : _members.isEmpty
                ? Center(child: Text(t.adminSearchUsersPrompt,
                    style: TextStyle(color: KodaColors.text3)))
                : ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: _members.length,
                    itemBuilder: (_, i) {
                      final m = _members[i];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: KodaColors.card,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: KodaColors.border),
                        ),
                        child: Row(children: [
                          KodaAvatar(
                            username: m['username'] as String? ?? '?',
                            size: 36,
                            avatarUrl: m['avatar_url'] as String?,
                          ),
                          const SizedBox(width: 12),
                          Expanded(child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Text(m['username'] as String? ?? '',
                                style: TextStyle(
                                    color: KodaColors.text1,
                                    fontWeight: FontWeight.w600)),
                            Text(m['email'] as String? ?? '',
                                style: TextStyle(
                                    color: KodaColors.text3, fontSize: 12)),
                            if (m['flags'] != null &&
                                (m['flags'] as Map).isNotEmpty)
                              Text(t.adminFlagsValue('${m['flags']}'),
                                  style: TextStyle(
                                      color: KodaColors.gold, fontSize: 11)),
                          ])),
                        ]),
                      );
                    },
                  ),
      ),
    ]);
  }
}

// ── DM Reports Tab ───────────────────────────────────────────────────────────
//
// DM reports (Tier 2 -- see koda-server's Koda.Reports) have no server_id --
// there's no per-server moderation team for a private 1:1 conversation --
// so unlike channel reports (reviewed by that server's own moderators, see
// server_settings_screen.dart's Reports tab) these are a platform-level
// trust & safety queue, admin-only.

class _DmReportsTab extends StatefulWidget {
  @override
  State<_DmReportsTab> createState() => _DmReportsTabState();
}

class _DmReportsTabState extends State<_DmReportsTab> {
  List<Map<String, dynamic>> _reports = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    final reports = await KodaApi.instance.getDmReports();
    if (!mounted) return;
    setState(() { _reports = reports; _loading = false; });
  }

  Future<void> _resolve(String id, String status) async {
    final ok = await KodaApi.instance.resolveReport(id, status);
    if (ok && mounted) _load();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final pending = _reports.where((r) => r['status'] == 'pending').toList();
    final resolved = _reports.where((r) => r['status'] != 'pending').toList();

    return _loading
        ? Center(child: CircularProgressIndicator(color: KodaColors.koda))
        : ListView(
            padding: const EdgeInsets.all(16),
            children: [
              if (pending.isEmpty && resolved.isEmpty)
                Center(child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Text(t.adminNoDmReports, style: TextStyle(color: KodaColors.text3)),
                )),
              ...pending.map((r) => _reportCard(r, t)),
              if (resolved.isNotEmpty) ...[
                const SizedBox(height: 16),
                Text(t.adminResolvedLabel, style: TextStyle(
                    color: KodaColors.text3, fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 1)),
                const SizedBox(height: 8),
                ...resolved.map((r) => _reportCard(r, t)),
              ],
            ],
          );
  }

  Widget _reportCard(Map<String, dynamic> r, AppLocalizations t) {
    final status = r['status'] as String? ?? 'pending';
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: KodaColors.card,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: KodaColors.border),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(r['reason'] as String? ?? t.adminReasonOther,
            style: TextStyle(color: KodaColors.koda, fontSize: 11, fontWeight: FontWeight.w700)),
        const SizedBox(height: 6),
        Text(t.adminDmReportDetails('${r['reporter_id']}', '${r['target_user_id']}'),
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
          Text(t.adminNoteValue('${r['note']}'),
              style: TextStyle(color: KodaColors.text3, fontSize: 11, fontStyle: FontStyle.italic)),
        ],
        if (status == 'pending') ...[
          const SizedBox(height: 8),
          Row(children: [
            TextButton(
              onPressed: () => _resolve(r['id'] as String, 'dismissed'),
              child: Text(t.adminDismissButton),
            ),
            const SizedBox(width: 4),
            TextButton(
              onPressed: () => _resolve(r['id'] as String, 'actioned'),
              child: Text(t.adminMarkActionedButton, style: TextStyle(color: KodaColors.accent)),
            ),
          ]),
        ] else
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(status == 'actioned' ? t.adminStatusActioned : t.adminStatusDismissed,
                style: TextStyle(color: KodaColors.text3, fontSize: 11)),
          ),
      ]),
    );
  }
}

// ── Spam Flags Tab ────────────────────────────────────────────────────────────
//
// System-generated metadata-pattern flags (Tier 1 -- see koda-server's
// Koda.Moderation.RateLimiter: check_dm_fanout/1 for mass-DM cold
// outreach, the tiered record_violation/2 for channel flooding). No
// human reporter and no single message behind these (unlike DM Reports
// above), so they're a distinct queue -- both flag types share it since
// a dm_fanout flag has no server to scope to either way. "Confirm &
// Restrict" applies the same harder restriction the automatic
// repeat-trip escalation already can (dm_restricted_until for
// dm_fanout, a full mute for channel_flood).

class _SpamFlagsTab extends StatefulWidget {
  @override
  State<_SpamFlagsTab> createState() => _SpamFlagsTabState();
}

class _SpamFlagsTabState extends State<_SpamFlagsTab> {
  List<Map<String, dynamic>> _flags = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    final flags = await KodaApi.instance.getSpamFlags();
    if (!mounted) return;
    setState(() { _flags = flags; _loading = false; });
  }

  Future<void> _resolve(String id, String status) async {
    final ok = await KodaApi.instance.resolveSpamFlag(id, status);
    if (ok && mounted) _load();
  }

  String _flagLabel(String type, AppLocalizations t) {
    switch (type) {
      case 'dm_fanout': return t.adminFlagMassDmSpam;
      case 'raid_lockdown': return t.adminFlagRaidLockdown;
      case 'bot_behavior': return t.adminFlagBotBehavior;
      default: return t.adminFlagChannelFlooding;
    }
  }

  IconData _flagIcon(String type) {
    switch (type) {
      case 'dm_fanout': return Icons.forward_to_inbox_outlined;
      case 'raid_lockdown': return Icons.shield_outlined;
      case 'bot_behavior': return Icons.smart_toy_outlined;
      default: return Icons.water_drop_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final pending = _flags.where((f) => f['status'] == 'pending').toList();
    final resolved = _flags.where((f) => f['status'] != 'pending').toList();

    return _loading
        ? Center(child: CircularProgressIndicator(color: KodaColors.koda))
        : ListView(
            padding: const EdgeInsets.all(16),
            children: [
              if (pending.isEmpty && resolved.isEmpty)
                Center(child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Text(t.adminNoSpamFlags, style: TextStyle(color: KodaColors.text3)),
                )),
              ...pending.map((f) => _flagCard(f, t)),
              if (resolved.isNotEmpty) ...[
                const SizedBox(height: 16),
                Text(t.adminResolvedLabel, style: TextStyle(
                    color: KodaColors.text3, fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 1)),
                const SizedBox(height: 8),
                ...resolved.map((f) => _flagCard(f, t)),
              ],
            ],
          );
  }

  String _restrictionLabel(String type, Map<String, dynamic> restriction, AppLocalizations t) {
    if (type == 'raid_lockdown') {
      final mutedCount = restriction['muted_count'] as int? ?? 0;
      final totalJoiners = restriction['total_joiners'] as int? ?? 0;
      return mutedCount > 0
          ? t.adminMutedJoiners(mutedCount, totalJoiners)
          : t.adminNoJoinersMuted;
    }
    final until = restriction['until'] as String?;
    if (restriction['active'] == true && until != null) {
      final local = DateTime.parse(until).toLocal().toString().split('.').first;
      return t.adminRestrictedUntil(local);
    }
    return t.adminNotCurrentlyRestricted;
  }

  Color _confidenceColor(String? label) {
    switch (label) {
      case 'High': return KodaColors.mint;
      case 'Medium': return KodaColors.gold;
      default: return KodaColors.accent;
    }
  }

  Widget _flagCard(Map<String, dynamic> f, AppLocalizations t) {
    final status = f['status'] as String? ?? 'pending';
    final type = f['flag_type'] as String? ?? 'dm_fanout';
    final details = Map<String, dynamic>.from(f['details'] ?? {});
    final restriction = Map<String, dynamic>.from(f['restriction'] ?? {});
    final confidence = Map<String, dynamic>.from(f['confidence'] ?? {});
    // details['escalated'] is channel_flood's key (see
    // Koda.Moderation.mark_flag_escalated/3); details['auto_escalated']
    // is dm_fanout's -- same badge either way.
    final autoEscalated = details['auto_escalated'] == true || details['escalated'] == true;

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: KodaColors.card,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: KodaColors.border),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Icon(_flagIcon(type), size: 14, color: KodaColors.koda),
          const SizedBox(width: 6),
          Text(_flagLabel(type, t),
              style: TextStyle(color: KodaColors.koda, fontSize: 11, fontWeight: FontWeight.w700)),
          if (autoEscalated) ...[
            const SizedBox(width: 6),
            Text(t.adminAutoEscalatedBadge,
                style: TextStyle(color: KodaColors.accent, fontSize: 10, fontWeight: FontWeight.w700)),
          ],
          const Spacer(),
          if (confidence['score'] != null)
            Text(t.adminConfidenceLabel('${confidence['score']}', '${confidence['label']}'),
                style: TextStyle(
                    color: _confidenceColor(confidence['label'] as String?),
                    fontSize: 10, fontWeight: FontWeight.w600)),
        ]),
        const SizedBox(height: 6),
        Text([
          if (f['user_id'] != null) t.adminFlagUserLine('${f['user_id']}'),
          if (f['server_id'] != null) t.adminFlagServerLine('${f['server_id']}'),
        ].join('\n'), style: TextStyle(color: KodaColors.text2, fontSize: 12)),
        if (details.isNotEmpty) ...[
          const SizedBox(height: 6),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: KodaColors.elevated, borderRadius: BorderRadius.circular(6)),
            child: Text(details.entries.map((e) => '${e.key}: ${e.value}').join(', '),
                style: TextStyle(color: KodaColors.text1, fontSize: 12)),
          ),
        ],
        const SizedBox(height: 6),
        Text(_restrictionLabel(type, restriction, t),
            style: TextStyle(
                color: restriction['active'] == true ? KodaColors.accent : KodaColors.text3,
                fontSize: 11, fontStyle: FontStyle.italic)),
        if (status == 'pending') ...[
          const SizedBox(height: 8),
          Row(children: [
            TextButton(
              onPressed: () => _resolve(f['id'] as String, 'dismissed'),
              child: Text(t.adminDismissUndoButton),
            ),
            const SizedBox(width: 4),
            TextButton(
              onPressed: () => _resolve(f['id'] as String, 'actioned'),
              child: Text(t.adminConfirmRestrictButton, style: TextStyle(color: KodaColors.accent)),
            ),
          ]),
        ] else
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(status == 'actioned' ? t.adminStatusActioned : t.adminStatusDismissed,
                style: TextStyle(color: KodaColors.text3, fontSize: 11)),
          ),
      ]),
    );
  }
}

// ── Wiki Tab ──────────────────────────────────────────────────────────────────
//
// Koda's knowledge base (see koda-server's Koda.Wiki) -- Visp's
// retrieval-grounding corpus and the source content for koda.fyi's
// public docs. Every create/update re-embeds server-side (see
// Koda.Wiki.create_article/1, update_article/2), so there's nothing
// embedding-related to manage here, just plain content CRUD.

const _wikiCategories = [
  'getting-started', 'messaging', 'voice-video', 'server-management',
  'moderation', 'marketplace', 'events', 'parental-controls',
  'integrations', 'visp',
];

class _WikiTab extends StatefulWidget {
  @override
  State<_WikiTab> createState() => _WikiTabState();
}

class _WikiTabState extends State<_WikiTab> {
  List<Map<String, dynamic>> _articles = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    final articles = await KodaApi.instance.listWikiArticles();
    if (!mounted) return;
    setState(() { _articles = articles; _loading = false; });
  }

  Future<void> _delete(Map<String, dynamic> article) async {
    final t = AppLocalizations.of(context);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: Text(t.adminDeleteArticleTitle, style: TextStyle(color: KodaColors.text1)),
        content: Text(t.adminDeleteArticleBody('${article['title']}'),
            style: TextStyle(color: KodaColors.text3)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: Text(t.commonCancel)),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(t.commonDelete, style: TextStyle(color: KodaColors.accent)),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      final ok = await KodaApi.instance.deleteWikiArticle(article['id'] as String);
      if (ok && mounted) _load();
    }
  }

  Future<void> _showEditor({Map<String, dynamic>? article}) async {
    final t = AppLocalizations.of(context);
    final titleCtrl = TextEditingController(text: article?['title'] as String? ?? '');
    final contentCtrl = TextEditingController(text: article?['content'] as String? ?? '');
    String category = article?['category'] as String? ?? _wikiCategories.first;

    final saved = await showDialog<bool>(
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          backgroundColor: KodaColors.card,
          title: Text(article == null ? t.adminNewArticleTitle : t.adminEditArticleTitle,
              style: TextStyle(color: KodaColors.text1)),
          content: SizedBox(
            width: 480,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              KodaTextField(controller: titleCtrl, hintText: t.adminArticleTitleHint, autofocus: true),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                initialValue: category,
                dropdownColor: KodaColors.card,
                style: TextStyle(color: KodaColors.text1, fontSize: 14),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                ),
                items: _wikiCategories
                    .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                    .toList(),
                onChanged: (v) => setDialogState(() => category = v ?? category),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: contentCtrl,
                maxLines: 10,
                minLines: 6,
                style: TextStyle(color: KodaColors.text1, fontSize: 13),
                decoration: InputDecoration(
                  hintText: t.adminArticleContentHint,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                ),
              ),
            ]),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context, false), child: Text(t.commonCancel)),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text(article == null ? t.commonCreate : t.commonSave),
            ),
          ],
        ),
      ),
    );

    if (saved != true) return;
    final title = titleCtrl.text.trim();
    final content = contentCtrl.text.trim();
    if (title.isEmpty || content.isEmpty) return;

    final result = article == null
        ? await KodaApi.instance.createWikiArticle(title: title, content: content, category: category)
        : await KodaApi.instance.updateWikiArticle(article['id'] as String,
            {'title': title, 'content': content, 'category': category});

    if (result != null && mounted) _load();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(16),
        child: Row(children: [
          Text(t.adminWikiArticlesHeader,
              style: TextStyle(color: KodaColors.text1, fontSize: 15, fontWeight: FontWeight.w700)),
          const Spacer(),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(backgroundColor: KodaColors.koda),
            icon: const Icon(Icons.add, size: 16, color: Colors.white),
            label: Text(t.adminNewArticleTitle, style: TextStyle(color: Colors.white)),
            onPressed: () => _showEditor(),
          ),
        ]),
      ),
      Divider(color: KodaColors.border, height: 1),
      Expanded(
        child: _loading
            ? Center(child: CircularProgressIndicator(color: KodaColors.koda))
            : _articles.isEmpty
                ? Center(child: Text(t.adminNoArticlesYet, style: TextStyle(color: KodaColors.text3)))
                : ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: _articles.length,
                    itemBuilder: (_, i) {
                      final a = _articles[i];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: KodaColors.card,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: KodaColors.border),
                        ),
                        child: Row(children: [
                          Expanded(child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Text(a['title'] as String? ?? '',
                                style: TextStyle(color: KodaColors.text1,
                                    fontSize: 14, fontWeight: FontWeight.w600)),
                            const SizedBox(height: 2),
                            Text(a['category'] as String? ?? '',
                                style: TextStyle(color: KodaColors.koda, fontSize: 11)),
                          ])),
                          IconButton(
                            icon: Icon(Icons.edit_outlined, size: 18, color: KodaColors.text3),
                            tooltip: t.adminEditArticleTooltip,
                            onPressed: () => _showEditor(article: a),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete_outline, size: 18, color: KodaColors.text3),
                            tooltip: t.adminDeleteArticleTooltip,
                            onPressed: () => _delete(a),
                          ),
                        ]),
                      );
                    },
                  ),
      ),
    ]);
  }
}

// ── Boosts Tab ───────────────────────────────────────────────────────────────
// Manually applies server boosts, bypassing the token/purchase flow --
// for comping a server or fixing a support issue (see koda-server's
// Koda.Boosts.admin_grant_boosts/3). Search-then-select mirrors
// _UsersTab above.

class _BoostsTab extends StatefulWidget {
  @override
  State<_BoostsTab> createState() => _BoostsTabState();
}

class _BoostsTabState extends State<_BoostsTab> {
  final _searchCtrl = TextEditingController();
  List<Map<String, dynamic>> _results = [];
  bool _loading = false;
  String? _grantingServerId;

  Future<void> _search(String query) async {
    if (query.trim().isEmpty) return;
    setState(() => _loading = true);
    final results = await KodaApi.instance.adminSearchServers(query.trim());
    if (!mounted) return;
    setState(() { _results = results; _loading = false; });
  }

  Future<void> _grant(Map<String, dynamic> server) async {
    final t = AppLocalizations.of(context);
    final countText = await showDialog<String>(
      context: context,
      builder: (context) {
        final ctrl = TextEditingController(text: '1');
        return AlertDialog(
          backgroundColor: KodaColors.card,
          title: Text(t.adminGrantBoostsTitle('${server['name']}'),
              style: TextStyle(color: KodaColors.text1)),
          content: KodaTextField(
            controller: ctrl,
            hintText: t.adminNumBoostsHint,
            keyboardType: TextInputType.number,
            autofocus: true,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(t.commonCancel, style: TextStyle(color: KodaColors.text3)),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, ctrl.text),
              child: Text(t.adminGrantButton, style: TextStyle(color: KodaColors.koda)),
            ),
          ],
        );
      },
    );
    if (countText == null || !mounted) return;
    final count = int.tryParse(countText.trim());
    if (count == null || count <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(t.adminPositiveNumberError)));
      return;
    }

    setState(() => _grantingServerId = server['id'] as String);
    final status = await KodaApi.instance.adminGrantBoosts(server['id'] as String, count);
    if (!mounted) return;
    setState(() => _grantingServerId = null);

    if (status == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(t.adminGrantBoostsFailed)));
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(
        t.adminBoostsGranted(count, '${server['name']}',
            status['level'] as int? ?? 0, status['count'] as int? ?? 0))));
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(16),
        child: KodaTextField(
          controller: _searchCtrl,
          hintText: t.adminSearchServersHint,
          onSubmitted: _search,
        ),
      ),
      Divider(color: KodaColors.border, height: 1),
      Expanded(
        child: _loading
            ? Center(child: CircularProgressIndicator(color: KodaColors.koda))
            : _results.isEmpty
                ? Center(child: Text(t.adminSearchServersPrompt,
                    style: TextStyle(color: KodaColors.text3)))
                : ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: _results.length,
                    itemBuilder: (_, i) {
                      final s = _results[i];
                      final iconUrl = s['icon_url'] as String?;
                      final granting = _grantingServerId == s['id'];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: KodaColors.card,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: KodaColors.border),
                        ),
                        child: Row(children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: SizedBox(
                              width: 36, height: 36,
                              child: iconUrl != null
                                  ? Image.network(iconUrl, fit: BoxFit.cover,
                                      errorBuilder: (_, __, ___) => ColoredBox(color: KodaColors.elevated))
                                  : ColoredBox(color: KodaColors.elevated,
                                      child: Icon(Icons.groups_outlined, color: KodaColors.text3, size: 18)),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Text(s['name'] as String? ?? '',
                                style: TextStyle(color: KodaColors.text1, fontWeight: FontWeight.w600)),
                            Text(t.adminMemberCountLabel(s['member_count'] as int? ?? 0),
                                style: TextStyle(color: KodaColors.text3, fontSize: 12)),
                          ])),
                          const SizedBox(width: 8),
                          granting
                              ? SizedBox(width: 20, height: 20,
                                  child: CircularProgressIndicator(strokeWidth: 2, color: KodaColors.koda))
                              : TextButton.icon(
                                  onPressed: () => _grant(s),
                                  icon: Icon(Icons.bolt, size: 16, color: KodaColors.koda),
                                  label: Text(t.adminGrantBoostsButtonLabel, style: TextStyle(color: KodaColors.koda)),
                                ),
                        ]),
                      );
                    },
                  ),
      ),
    ]);
  }
}