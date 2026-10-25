// lib/features/activity/activity_feed_popout_window.dart
//
// Runs in a separate OS window spawned by desktop_multi_window -- see
// lib/features/voice/pop_out_video_window.dart for the sibling pattern
// this mirrors. Much lighter than that one: there's no live session to
// hand off on close and no per-window identity/token to request, since
// this is read-only polling of the same /users/me/activity_feed any
// other screen hits. The one thing a separate engine/process genuinely
// needs is its own authenticated KodaApi -- loadStoredToken/0 reads the
// same OS-level secure storage the main window already wrote to, so no
// token needs to be threaded through window arguments at all.

import 'package:flutter/material.dart';
import 'package:desktop_multi_window/desktop_multi_window.dart';
import '../../core/api.dart';
import '../../core/theme.dart';
import '../../l10n/generated/app_localizations.dart';
import 'activity_feed_view.dart';

class ActivityFeedPopoutWindow extends StatefulWidget {
  final String windowId;
  const ActivityFeedPopoutWindow({super.key, required this.windowId});
  @override
  State<ActivityFeedPopoutWindow> createState() => _ActivityFeedPopoutWindowState();
}

class _ActivityFeedPopoutWindowState extends State<ActivityFeedPopoutWindow> {
  bool _ready = false;

  @override
  void initState() {
    super.initState();
    KodaApi.instance.loadStoredToken().then((_) {
      if (mounted) setState(() => _ready = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: kodaTheme(),
      home: Scaffold(
        backgroundColor: KodaColors.voidBg,
        appBar: AppBar(
          backgroundColor: KodaColors.bg2,
          title: Text(t.activityFeedTitle, style: TextStyle(color: KodaColors.text1, fontSize: 14)),
          actions: [
            IconButton(
              icon: Icon(Icons.close, color: KodaColors.text2, size: 18),
              onPressed: () => WindowController.fromWindowId(widget.windowId).hide(),
            ),
          ],
        ),
        body: _ready
            ? const ActivityFeedView()
            : Center(child: CircularProgressIndicator(color: KodaColors.koda)),
      ),
    );
  }
}
