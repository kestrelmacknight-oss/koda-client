// lib/features/auth/child_lockout_screen.dart
//
// Shown in place of the app whenever the current session is a child
// account outside its parent-set allowed hours -- reached either at
// login (Koda.Auth.login/2 rejects the attempt before issuing a token)
// or mid-session (koda-server's ScheduleGate plug 403s the next REST
// call, or Koda.Parental.ScheduleSweeper force-disconnects a live
// socket -- see main.dart's AuthGate for how both routes here). No back
// navigation: the only way out is logging out and waiting, or a parent
// granting a temporary override.

import 'package:flutter/material.dart';
import '../../core/theme.dart';
import '../../l10n/generated/app_localizations.dart';

class ChildLockoutScreen extends StatelessWidget {
  final VoidCallback onLogout;
  const ChildLockoutScreen({super.key, required this.onLogout});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: KodaColors.voidBg,
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 360),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Icon(Icons.schedule_outlined, size: 56, color: KodaColors.text3),
              const SizedBox(height: 20),
              Text(t.childLockoutTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: KodaColors.text1,
                      fontSize: 18, fontWeight: FontWeight.w700)),
              const SizedBox(height: 10),
              Text(
                t.childLockoutBody,
                textAlign: TextAlign.center,
                style: TextStyle(color: KodaColors.text3, fontSize: 13, height: 1.5),
              ),
              const SizedBox(height: 28),
              OutlinedButton(
                onPressed: onLogout,
                style: OutlinedButton.styleFrom(
                  foregroundColor: KodaColors.text2,
                  side: BorderSide(color: KodaColors.border),
                  minimumSize: const Size(double.infinity, 44),
                ),
                child: Text(t.childLockoutLogOutButton),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
