// lib/features/admin/admin_screen.dart
//
// Admin panel — visible only to users with is_admin: true.
// Tabs: Backer Codes | Users
//
// Backer Codes: create codes with custom flags, view all codes,
// redemption counts, expiry.
// Users: search users, view flags, apply manual flags.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/api.dart';
import '../../../core/theme.dart';
import '../../../shared/widgets.dart';

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
    _tabs = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KodaColors.voidBg,
      appBar: AppBar(
        backgroundColor: KodaColors.bg2,
        title: const Row(children: [
          Icon(Icons.admin_panel_settings_outlined,
              size: 18, color: KodaColors.koda),
          SizedBox(width: 8),
          Text('Admin Panel',
              style: TextStyle(color: KodaColors.text1, fontSize: 16)),
        ]),
        bottom: TabBar(
          controller: _tabs,
          indicatorColor: KodaColors.koda,
          labelColor: KodaColors.text1,
          unselectedLabelColor: KodaColors.text3,
          tabs: const [
            Tab(text: 'Backer Codes'),
            Tab(text: 'Users'),
            Tab(text: 'DM Reports'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabs,
        children: [
          _BackerCodesTab(),
          _UsersTab(),
          _DmReportsTab(),
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

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    final codes = await KodaApi.instance.listBackerCodes();
    if (!mounted) return;
    setState(() { _codes = codes; _loading = false; });
  }

  Future<void> _showCreateDialog() async {
    final codeCtrl  = TextEditingController();
    final noteCtrl  = TextEditingController();
    final flagCtrl  = TextEditingController();
    final maxCtrl   = TextEditingController();

    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: const Text('Create Backer Code',
            style: TextStyle(color: KodaColors.text1)),
        content: SizedBox(
          width: 400,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            KodaTextField(controller: codeCtrl,
                hintText: 'Code (leave blank to auto-generate)'),
            const SizedBox(height: 8),
            KodaTextField(controller: noteCtrl,
                hintText: 'Note (e.g. "Kickstarter Tier 2")'),
            const SizedBox(height: 8),
            KodaTextField(controller: flagCtrl,
                hintText: 'Flags as JSON (e.g. {"backer_tier":"founding"})'),
            const SizedBox(height: 8),
            KodaTextField(controller: maxCtrl,
                hintText: 'Max uses (leave blank = unlimited)',
                keyboardType: TextInputType.number),
          ]),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel')),
          TextButton(
            onPressed: () async {
              Map<String, dynamic> flags = {};
              try {
                if (flagCtrl.text.trim().isNotEmpty) {
                  // Simple JSON parse
                  final cleaned = flagCtrl.text.trim();
                  flags = Map<String, dynamic>.from(
                    (cleaned.startsWith('{')
                        ? _parseSimpleJson(cleaned)
                        : {'flag': cleaned}));
                }
              } catch (_) {
                flags = {'note': flagCtrl.text.trim()};
              }

              Navigator.pop(context);
              final result = await KodaApi.instance.createBackerCode(
                code:    codeCtrl.text.trim().isEmpty ? null : codeCtrl.text.trim().toUpperCase(),
                flags:   flags,
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
                    title: const Text('Code Created',
                        style: TextStyle(color: KodaColors.text1)),
                    content: Column(mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      const Text('Code:',
                          style: TextStyle(color: KodaColors.text3, fontSize: 12)),
                      const SizedBox(height: 4),
                      Row(children: [
                        Expanded(child: SelectableText(code,
                            style: const TextStyle(
                                color: KodaColors.koda,
                                fontSize: 18,
                                fontWeight: FontWeight.w700))),
                        IconButton(
                          icon: const Icon(Icons.copy, size: 16,
                              color: KodaColors.text3),
                          onPressed: () =>
                              Clipboard.setData(ClipboardData(text: code)),
                        ),
                      ]),
                      const SizedBox(height: 8),
                      Text('Flags: ${result['flags']}',
                          style: const TextStyle(
                              color: KodaColors.text3, fontSize: 12)),
                    ]),
                    actions: [
                      TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Done')),
                    ],
                  ),
                );
              }
            },
            child: const Text('Create'),
          ),
        ],
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
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(16),
        child: Row(children: [
          const Text('Backer & Reward Codes',
              style: TextStyle(color: KodaColors.text1,
                  fontSize: 15, fontWeight: FontWeight.w700)),
          const Spacer(),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(backgroundColor: KodaColors.koda),
            icon: const Icon(Icons.add, size: 16, color: Colors.white),
            label: const Text('New Code',
                style: TextStyle(color: Colors.white)),
            onPressed: _showCreateDialog,
          ),
        ]),
      ),
      const Divider(color: KodaColors.border, height: 1),
      Expanded(
        child: _loading
            ? const Center(child: CircularProgressIndicator(
                color: KodaColors.koda))
            : _codes.isEmpty
                ? const Center(child: Text('No codes yet',
                    style: TextStyle(color: KodaColors.text3)))
                : ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: _codes.length,
                    itemBuilder: (_, i) {
                      final c = _codes[i];
                      final uses    = c['uses'] as int? ?? 0;
                      final maxUses = c['max_uses'] as int?;
                      final usesStr = maxUses != null
                          ? '$uses / $maxUses'
                          : '$uses uses';
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
                                style: const TextStyle(
                                    color: KodaColors.koda,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 2),
                              ),
                              const SizedBox(width: 8),
                              IconButton(
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                                icon: const Icon(Icons.copy, size: 14,
                                    color: KodaColors.text3),
                                onPressed: () => Clipboard.setData(
                                    ClipboardData(text: c['code'] as String)),
                              ),
                            ]),
                            if (c['note'] != null)
                              Text(c['note'] as String,
                                  style: const TextStyle(
                                      color: KodaColors.text2, fontSize: 12)),
                            const SizedBox(height: 4),
                            Text('Flags: ${c['flags']}',
                                style: const TextStyle(
                                    color: KodaColors.text3, fontSize: 11)),
                            Text(usesStr,
                                style: const TextStyle(
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
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(16),
        child: KodaTextField(
          controller: _searchCtrl,
          hintText: 'Search users by username...',
          onSubmitted: _search,
        ),
      ),
      const Divider(color: KodaColors.border, height: 1),
      Expanded(
        child: _loading
            ? const Center(child: CircularProgressIndicator(
                color: KodaColors.koda))
            : _members.isEmpty
                ? const Center(child: Text('Search for a user above',
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
                                style: const TextStyle(
                                    color: KodaColors.text1,
                                    fontWeight: FontWeight.w600)),
                            Text(m['email'] as String? ?? '',
                                style: const TextStyle(
                                    color: KodaColors.text3, fontSize: 12)),
                            if (m['flags'] != null &&
                                (m['flags'] as Map).isNotEmpty)
                              Text('Flags: ${m['flags']}',
                                  style: const TextStyle(
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
    final pending = _reports.where((r) => r['status'] == 'pending').toList();
    final resolved = _reports.where((r) => r['status'] != 'pending').toList();

    return _loading
        ? const Center(child: CircularProgressIndicator(color: KodaColors.koda))
        : ListView(
            padding: const EdgeInsets.all(16),
            children: [
              if (pending.isEmpty && resolved.isEmpty)
                const Center(child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Text('No DM reports.', style: TextStyle(color: KodaColors.text3)),
                )),
              ...pending.map((r) => _reportCard(r)),
              if (resolved.isNotEmpty) ...[
                const SizedBox(height: 16),
                const Text('RESOLVED', style: TextStyle(
                    color: KodaColors.text3, fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 1)),
                const SizedBox(height: 8),
                ...resolved.map((r) => _reportCard(r)),
              ],
            ],
          );
  }

  Widget _reportCard(Map<String, dynamic> r) {
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
        Text(r['reason'] as String? ?? 'other',
            style: const TextStyle(color: KodaColors.koda, fontSize: 11, fontWeight: FontWeight.w700)),
        const SizedBox(height: 6),
        Text('Reporter: ${r['reporter_id']}\nRevealed sender: ${r['target_user_id']}',
            style: const TextStyle(color: KodaColors.text2, fontSize: 12)),
        const SizedBox(height: 6),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: KodaColors.elevated, borderRadius: BorderRadius.circular(6)),
          child: Text(r['disclosed_content'] as String? ?? '',
              style: const TextStyle(color: KodaColors.text1, fontSize: 12)),
        ),
        if ((r['note'] as String?)?.isNotEmpty ?? false) ...[
          const SizedBox(height: 6),
          Text('Note: ${r['note']}',
              style: const TextStyle(color: KodaColors.text3, fontSize: 11, fontStyle: FontStyle.italic)),
        ],
        if (status == 'pending') ...[
          const SizedBox(height: 8),
          Row(children: [
            TextButton(
              onPressed: () => _resolve(r['id'] as String, 'dismissed'),
              child: const Text('Dismiss'),
            ),
            const SizedBox(width: 4),
            TextButton(
              onPressed: () => _resolve(r['id'] as String, 'actioned'),
              child: const Text('Mark Actioned', style: TextStyle(color: KodaColors.accent)),
            ),
          ]),
        ] else
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(status == 'actioned' ? 'Actioned' : 'Dismissed',
                style: const TextStyle(color: KodaColors.text3, fontSize: 11)),
          ),
      ]),
    );
  }
}