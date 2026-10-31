// lib/shared/user_calendar_screen.dart
//
// A specific user's own confirmed events -- subscribed for a free event,
// an actually-completed ticket for a priced one (see koda-server's
// Koda.Events.list_confirmed_events_for_user/3). Deliberately separate
// from features/discover/upcoming_events_screen.dart: that screen answers
// "what's coming up that I might want to go to" (every server I'm in,
// plus friends' public events); this one answers "what has this specific
// person actually confirmed" -- narrower, and reusable for both your own
// profile (Settings) and someone else's (the profile popup), gated
// server-side by their own share_calendar opt-in.

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../core/api.dart';
import '../core/theme.dart';
import '../core/time_utils.dart';
import '../l10n/generated/app_localizations.dart';
import '../features/discover/server_discovery_screen.dart' show ServerPreviewScreen;

class UserCalendarScreen extends StatefulWidget {
  final String userId;
  final String username;
  final bool isSelf;
  const UserCalendarScreen({super.key, required this.userId, required this.username, required this.isSelf});
  @override
  State<UserCalendarScreen> createState() => _UserCalendarScreenState();
}

class _UserCalendarScreenState extends State<UserCalendarScreen> {
  List<Map<String, dynamic>> _events = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final events = await KodaApi.instance.getUserCalendar(widget.userId);
    if (mounted) setState(() { _events = events; _loading = false; });
  }

  // Same routing choice UpcomingEventsScreen._openEvent makes: a server
  // you're already in hands server/channel back via the pop result so a
  // caller that cares (e.g. HomeScreen) can select into it; otherwise the
  // furthest a non-member can go is that server's public preview.
  Future<void> _openEvent(Map<String, dynamic> event) async {
    if (event['is_member'] == true) {
      Navigator.pop(context, {
        'server_id': event['server_id'],
        'channel_id': event['channel_id'],
      });
    } else {
      await Navigator.push(context, MaterialPageRoute(
          builder: (_) => ServerPreviewScreen(serverId: event['server_id'] as String)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: KodaColors.voidBg,
      appBar: AppBar(
        backgroundColor: KodaColors.bg2,
        title: Text(
            widget.isSelf ? t.userCalendarMyTitle : t.userCalendarOtherTitle(widget.username),
            style: TextStyle(color: KodaColors.text1, fontSize: 16, fontWeight: FontWeight.w700)),
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator(color: KodaColors.koda))
          : _events.isEmpty
              ? Center(child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(t.userCalendarEmptyState,
                      style: TextStyle(color: KodaColors.text3, fontSize: 13),
                      textAlign: TextAlign.center),
                ))
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: _events.length,
                  itemBuilder: (_, i) => _buildEventRow(_events[i]),
                ),
    );
  }

  Widget _buildEventRow(Map<String, dynamic> event) {
    final start = parseServerTimestamp(event['start_at'] as String);
    final color = Color(int.parse(
        (event['color'] as String? ?? '#2DD4A0').replaceFirst('#', '0xFF')));

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: KodaColors.card,
        borderRadius: BorderRadius.circular(10),
        border: Border(left: BorderSide(color: color, width: 3)),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        title: Text(event['title'] as String? ?? '',
            style: TextStyle(color: KodaColors.text1, fontWeight: FontWeight.w600, fontSize: 14)),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            '${DateFormat('EEE, MMM d · h:mm a').format(start)} · ${event['server_name'] as String? ?? ''}',
            style: TextStyle(color: KodaColors.text3, fontSize: 12),
          ),
        ),
        onTap: () => _openEvent(event),
      ),
    );
  }
}
