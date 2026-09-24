// lib/shared/toast.dart
//
// Lightweight in-app toast for live notification events (mentions, DM
// messages, etc.). Deliberately title-only -- never the notification
// body or any message content -- so a toast popping up never leaks what
// was said to anyone glancing at the screen, only that *something*
// happened and roughly where. See home_screen.dart's
// _subscribeToUserNotifications for the only place this is called.

import 'package:flutter/material.dart';
import '../core/theme.dart';

void showKodaToast(
  BuildContext context, {
  required String title,
  IconData icon = Icons.notifications_none,
}) {
  final messenger = ScaffoldMessenger.maybeOf(context);
  if (messenger == null) return;
  messenger.showSnackBar(
    SnackBar(
      content: Row(children: [
        Icon(icon, color: KodaColors.koda, size: 18),
        const SizedBox(width: 10),
        Expanded(
          child: Text(title,
              style: TextStyle(color: KodaColors.text1, fontSize: 13),
              overflow: TextOverflow.ellipsis),
        ),
      ]),
      backgroundColor: KodaColors.elevated,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: KodaColors.border),
      ),
      margin: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
    ),
  );
}
