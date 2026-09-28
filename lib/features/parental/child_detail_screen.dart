// lib/features/parental/child_detail_screen.dart
//
// Per-child management: read-only friends/servers lists with a remove
// action (never message content -- see koda-server's Koda.Parental),
// a weekly access schedule editor, and temporary override granting.

import 'package:flutter/material.dart';
import '../../core/api.dart';
import '../../core/theme.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../shared/widgets.dart';

// Internal lookup keys only (stable, sent to the API) -- display labels
// are localized separately via _weekdayLabels(t) below, since those need
// a BuildContext.
const _weekdayKeys = ['mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun'];

List<(String, String)> _weekdayLabels(AppLocalizations t) => [
  ('mon', t.childDetailMonday),
  ('tue', t.childDetailTuesday),
  ('wed', t.childDetailWednesday),
  ('thu', t.childDetailThursday),
  ('fri', t.childDetailFriday),
  ('sat', t.childDetailSaturday),
  ('sun', t.childDetailSunday),
];

// A small curated list rather than a full IANA picker -- good enough to
// be genuinely usable today, easy to swap for a real timezone-picker
// package later without touching the schedule model itself.
const _timezones = [
  'UTC', 'America/New_York', 'America/Chicago', 'America/Denver',
  'America/Los_Angeles', 'America/Anchorage', 'Pacific/Honolulu',
  'Europe/London', 'Europe/Paris', 'Europe/Berlin', 'Europe/Moscow',
  'Asia/Tokyo', 'Asia/Shanghai', 'Asia/Kolkata', 'Asia/Dubai',
  'Australia/Sydney', 'Pacific/Auckland',
];

class ChildDetailScreen extends StatefulWidget {
  final Map<String, dynamic> child;
  const ChildDetailScreen({super.key, required this.child});

  @override
  State<ChildDetailScreen> createState() => _ChildDetailScreenState();
}

class _ChildDetailScreenState extends State<ChildDetailScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabs = TabController(length: 4, vsync: this);
  String get _childId => widget.child['id'] as String;

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
        title: Text(widget.child['username'] as String? ?? t.childDetailFallbackTitle,
            style: TextStyle(color: KodaColors.text1, fontSize: 16, fontWeight: FontWeight.w700)),
        bottom: TabBar(
          controller: _tabs,
          indicatorColor: KodaColors.koda,
          labelColor: KodaColors.text1,
          unselectedLabelColor: KodaColors.text3,
          tabs: [
            Tab(text: t.childDetailTabFriends),
            Tab(text: t.childDetailTabServers),
            Tab(text: t.childDetailTabSchedule),
            Tab(text: t.childDetailTabOverride),
          ],
        ),
      ),
      body: TabBarView(controller: _tabs, children: [
        _ChildFriendsTab(childId: _childId),
        _ChildServersTab(childId: _childId),
        _ChildScheduleTab(childId: _childId),
        _ChildOverrideTab(childId: _childId),
      ]),
    );
  }
}

// ── Friends (read-only, remove-only) ───────────────────────────────────────

class _ChildFriendsTab extends StatefulWidget {
  final String childId;
  const _ChildFriendsTab({required this.childId});
  @override
  State<_ChildFriendsTab> createState() => _ChildFriendsTabState();
}

class _ChildFriendsTabState extends State<_ChildFriendsTab> {
  List<Map<String, dynamic>> _friends = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    final friends = await KodaApi.instance.childFriends(widget.childId);
    if (!mounted) return;
    setState(() { _friends = friends; _loading = false; });
  }

  Future<void> _remove(Map<String, dynamic> friend) async {
    final ok = await KodaApi.instance.removeChildFriend(widget.childId, friend['id'] as String);
    if (ok) _load();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    if (_loading) return Center(child: CircularProgressIndicator(color: KodaColors.koda));
    if (_friends.isEmpty) {
      return Center(child: Text(t.childDetailNoFriends, style: TextStyle(color: KodaColors.text3)));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _friends.length,
      itemBuilder: (_, i) {
        final f = _friends[i];
        return ListTile(
          leading: KodaAvatar(username: f['username'] as String? ?? '?',
              avatarUrl: f['avatar_url'] as String?, size: 32),
          title: Text(f['username'] as String? ?? t.childDetailUnknownUser,
              style: TextStyle(color: KodaColors.text1)),
          trailing: IconButton(
            icon: Icon(Icons.person_remove_outlined, color: KodaColors.accent, size: 18),
            tooltip: t.childDetailRemoveFriendTooltip,
            onPressed: () => _remove(f),
          ),
        );
      },
    );
  }
}

// ── Servers (read-only, remove-only) ────────────────────────────────────────

class _ChildServersTab extends StatefulWidget {
  final String childId;
  const _ChildServersTab({required this.childId});
  @override
  State<_ChildServersTab> createState() => _ChildServersTabState();
}

class _ChildServersTabState extends State<_ChildServersTab> {
  List<Map<String, dynamic>> _servers = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    final servers = await KodaApi.instance.childServers(widget.childId);
    if (!mounted) return;
    setState(() { _servers = servers; _loading = false; });
  }

  Future<void> _remove(Map<String, dynamic> server) async {
    final ok = await KodaApi.instance.removeChildFromServer(widget.childId, server['id'] as String);
    if (ok) _load();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    if (_loading) return Center(child: CircularProgressIndicator(color: KodaColors.koda));
    if (_servers.isEmpty) {
      return Center(child: Text(t.childDetailNoServers, style: TextStyle(color: KodaColors.text3)));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _servers.length,
      itemBuilder: (_, i) {
        final s = _servers[i];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: KodaColors.elevated,
            backgroundImage: (s['icon_url'] as String?)?.isNotEmpty == true
                ? NetworkImage(s['icon_url'] as String) : null,
            child: (s['icon_url'] as String?)?.isNotEmpty != true
                ? Text(((s['name'] as String? ?? '?').isNotEmpty ? (s['name'] as String)[0] : '?').toUpperCase(),
                    style: TextStyle(color: KodaColors.text1))
                : null,
          ),
          title: Text(s['name'] as String? ?? t.childDetailUnknownUser,
              style: TextStyle(color: KodaColors.text1)),
          subtitle: Text(t.childDetailMemberCount(s['member_count'] as int? ?? 0),
              style: TextStyle(color: KodaColors.text3, fontSize: 11)),
          trailing: IconButton(
            icon: Icon(Icons.exit_to_app, color: KodaColors.accent, size: 18),
            tooltip: t.childDetailRemoveServerTooltip,
            onPressed: () => _remove(s),
          ),
        );
      },
    );
  }
}

// ── Schedule ─────────────────────────────────────────────────────────────

class _ChildScheduleTab extends StatefulWidget {
  final String childId;
  const _ChildScheduleTab({required this.childId});
  @override
  State<_ChildScheduleTab> createState() => _ChildScheduleTabState();
}

class _ChildScheduleTabState extends State<_ChildScheduleTab> {
  bool _loading = true;
  bool _saving = false;
  bool _restricted = false;
  String _timezone = 'UTC';
  // One optional [start, end] window per weekday, in minutes since midnight.
  final Map<String, ({TimeOfDay start, TimeOfDay end})?> _windows = {
    for (final key in _weekdayKeys) key: null,
  };

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final schedule = await KodaApi.instance.getChildSchedule(widget.childId);
    if (!mounted) return;
    setState(() {
      if (schedule != null) {
        _restricted = true;
        _timezone = schedule['timezone'] as String? ?? 'UTC';
        final windows = Map<String, dynamic>.from(schedule['windows'] as Map? ?? {});
        for (final key in _weekdayKeys) {
          final dayWindows = windows[key] as List?;
          if (dayWindows != null && dayWindows.isNotEmpty) {
            final w = List<int>.from(dayWindows.first as List);
            _windows[key] = (
              start: TimeOfDay(hour: w[0] ~/ 60, minute: w[0] % 60),
              end: TimeOfDay(hour: w[1] ~/ 60, minute: w[1] % 60),
            );
          }
        }
      }
      _loading = false;
    });
  }

  Future<void> _save() async {
    setState(() => _saving = true);
    if (!_restricted) {
      await KodaApi.instance.deleteChildSchedule(widget.childId);
    } else {
      final windows = <String, dynamic>{
        for (final entry in _windows.entries)
          if (entry.value != null)
            entry.key: [[
              entry.value!.start.hour * 60 + entry.value!.start.minute,
              entry.value!.end.hour * 60 + entry.value!.end.minute,
            ]]
      };
      await KodaApi.instance.putChildSchedule(widget.childId,
          timezone: _timezone, windows: windows);
    }
    if (!mounted) return;
    setState(() => _saving = false);
    final t = AppLocalizations.of(context);
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(t.childDetailScheduleSaved)));
  }

  Future<void> _pickTime(String day, bool isStart) async {
    final current = _windows[day];
    final initial = (isStart ? current?.start : current?.end) ?? const TimeOfDay(hour: 9, minute: 0);
    final picked = await showTimePicker(context: context, initialTime: initial);
    if (picked == null) return;
    setState(() {
      final start = isStart ? picked : (current?.start ?? const TimeOfDay(hour: 9, minute: 0));
      final end = isStart ? (current?.end ?? const TimeOfDay(hour: 17, minute: 0)) : picked;
      _windows[day] = (start: start, end: end);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) return Center(child: CircularProgressIndicator(color: KodaColors.koda));
    final t = AppLocalizations.of(context);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: KodaColors.card,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: KodaColors.border),
          ),
          child: SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(t.childDetailRestrictAccessTitle,
                style: TextStyle(color: KodaColors.text1, fontSize: 13)),
            subtitle: Text(t.childDetailRestrictAccessSubtitle,
                style: TextStyle(color: KodaColors.text3, fontSize: 11)),
            activeThumbColor: KodaColors.koda,
            value: _restricted,
            onChanged: (v) => setState(() => _restricted = v),
          ),
        ),
        if (_restricted) ...[
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            initialValue: _timezones.contains(_timezone) ? _timezone : 'UTC',
            dropdownColor: KodaColors.card,
            style: TextStyle(color: KodaColors.text1),
            decoration: InputDecoration(labelText: t.childDetailTimezoneLabel),
            items: _timezones
                .map((tz) => DropdownMenuItem(value: tz, child: Text(tz)))
                .toList(),
            onChanged: (v) => setState(() => _timezone = v ?? 'UTC'),
          ),
          const SizedBox(height: 12),
          for (final (key, label) in _weekdayLabels(t)) _buildDayRow(key, label, t),
        ],
        const SizedBox(height: 16),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: KodaColors.koda,
            foregroundColor: Colors.black,
            minimumSize: const Size(double.infinity, 44),
          ),
          onPressed: _saving ? null : _save,
          child: Text(_saving ? t.childDetailSavingLabel : t.childDetailSaveScheduleButton),
        ),
      ],
    );
  }

  Widget _buildDayRow(String key, String label, AppLocalizations t) {
    final window = _windows[key];
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: KodaColors.card,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: KodaColors.border),
      ),
      child: Row(children: [
        SizedBox(width: 90, child: Text(label,
            style: TextStyle(color: KodaColors.text1, fontSize: 13))),
        Expanded(
          child: window == null
              ? Text(t.childDetailNoAccessLabel, style: TextStyle(color: KodaColors.text3, fontSize: 12))
              : Row(children: [
                  TextButton(
                    onPressed: () => _pickTime(key, true),
                    child: Text(window.start.format(context),
                        style: TextStyle(color: KodaColors.koda, fontSize: 12)),
                  ),
                  Text(t.childDetailToLabel, style: TextStyle(color: KodaColors.text3, fontSize: 12)),
                  TextButton(
                    onPressed: () => _pickTime(key, false),
                    child: Text(window.end.format(context),
                        style: TextStyle(color: KodaColors.koda, fontSize: 12)),
                  ),
                ]),
        ),
        Switch(
          activeThumbColor: KodaColors.koda,
          value: window != null,
          onChanged: (v) => setState(() {
            _windows[key] = v
                ? (start: const TimeOfDay(hour: 9, minute: 0), end: const TimeOfDay(hour: 17, minute: 0))
                : null;
          }),
        ),
      ]),
    );
  }
}

// ── Override ─────────────────────────────────────────────────────────────

class _ChildOverrideTab extends StatefulWidget {
  final String childId;
  const _ChildOverrideTab({required this.childId});
  @override
  State<_ChildOverrideTab> createState() => _ChildOverrideTabState();
}

class _ChildOverrideTabState extends State<_ChildOverrideTab> {
  final _reasonCtrl = TextEditingController();
  bool _busy = false;

  @override
  void dispose() {
    _reasonCtrl.dispose();
    super.dispose();
  }

  Future<void> _grant(int minutes) async {
    setState(() => _busy = true);
    final override = await KodaApi.instance.createOverride(widget.childId,
        durationMinutes: minutes,
        reason: _reasonCtrl.text.trim().isEmpty ? null : _reasonCtrl.text.trim());
    if (!mounted) return;
    setState(() => _busy = false);
    if (override != null) {
      final t = AppLocalizations.of(context);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(t.childDetailAccessGranted)));
    }
  }

  Future<void> _revoke() async {
    setState(() => _busy = true);
    await KodaApi.instance.deleteOverride(widget.childId);
    if (!mounted) return;
    setState(() => _busy = false);
    final t = AppLocalizations.of(context);
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(t.childDetailOverrideRevoked)));
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          t.childDetailOverrideExplanation,
          style: TextStyle(color: KodaColors.text3, fontSize: 12, height: 1.5),
        ),
        const SizedBox(height: 16),
        KodaTextField(controller: _reasonCtrl, hintText: t.childDetailReasonHint),
        const SizedBox(height: 12),
        Wrap(spacing: 8, runSpacing: 8, children: [
          for (final minutes in [15, 30, 60, 120])
            OutlinedButton(
              onPressed: _busy ? null : () => _grant(minutes),
              child: Text(minutes < 60
                  ? t.childDetailPlusMinutes(minutes)
                  : t.childDetailPlusHours(minutes ~/ 60)),
            ),
        ]),
        const SizedBox(height: 20),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            foregroundColor: KodaColors.accent,
            side: BorderSide(color: KodaColors.accent),
            minimumSize: const Size(double.infinity, 40),
          ),
          onPressed: _busy ? null : _revoke,
          child: Text(t.childDetailRevokeOverrideButton),
        ),
      ],
    );
  }
}
