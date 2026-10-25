// lib/features/activity/activity_feed_screen.dart
//
// Full-screen route for platforms without a desktop pop-out window
// (mobile, or a desktop user who just wants it docked in-app) --
// same ActivityFeedView content the pop-out window uses.

import 'package:flutter/material.dart';
import '../../core/theme.dart';
import '../../l10n/generated/app_localizations.dart';
import 'activity_feed_view.dart';

class ActivityFeedScreen extends StatelessWidget {
  const ActivityFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: KodaColors.voidBg,
      appBar: AppBar(
        backgroundColor: KodaColors.bg2,
        title: Text(t.activityFeedTitle,
            style: TextStyle(color: KodaColors.text1, fontSize: 16, fontWeight: FontWeight.w700)),
      ),
      body: const ActivityFeedView(),
    );
  }
}
