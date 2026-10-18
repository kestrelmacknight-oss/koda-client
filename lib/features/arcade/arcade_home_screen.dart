// lib/features/arcade/arcade_home_screen.dart
//
// Entry point for the Koda Arcade -- a short, growable list of simple,
// single-player games whose final score is self-reported to this
// server's own leaderboard (Koda.Leaderboards' "arcade_*" kinds). No
// game state is ever synced between players; each game is local to
// the device, same as the Steam library/compare screens.

import 'package:flutter/material.dart';
import '../../core/theme.dart';
import '../../l10n/generated/app_localizations.dart';
import '../server/leaderboard_screen.dart';
import 'minesweeper_screen.dart';
import 'match3_screen.dart';

class ArcadeHomeScreen extends StatelessWidget {
  final String serverId;
  const ArcadeHomeScreen({super.key, required this.serverId});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return Column(children: [
      Container(
        height: 52,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: KodaColors.border))),
        child: Row(children: [
          Expanded(child: Text(t.arcadeHomeTitle,
              style: TextStyle(color: KodaColors.text1, fontWeight: FontWeight.w700))),
          TextButton.icon(
            icon: Icon(Icons.leaderboard, size: 16, color: KodaColors.koda),
            label: Text(t.arcadeViewLeaderboardsButton, style: TextStyle(color: KodaColors.koda)),
            onPressed: () => Navigator.push(context, MaterialPageRoute(
                builder: (_) => LeaderboardScreen(serverId: serverId, canManage: true))),
          ),
        ]),
      ),
      Expanded(
        child: ListView(padding: const EdgeInsets.all(16), children: [
          _GameTile(
            icon: Icons.grid_on,
            iconColor: KodaColors.mint,
            title: t.arcadeMinesweeperTitle,
            subtitle: t.arcadeMinesweeperSubtitle,
            onTap: () => Navigator.push(context, MaterialPageRoute(
                builder: (_) => MinesweeperScreen(serverId: serverId))),
          ),
          const SizedBox(height: 12),
          _GameTile(
            icon: Icons.diamond,
            iconColor: KodaColors.koda,
            title: t.arcadeMatch3Title,
            subtitle: t.arcadeMatch3Subtitle,
            onTap: () => Navigator.push(context, MaterialPageRoute(
                builder: (_) => Match3Screen(serverId: serverId))),
          ),
        ]),
      ),
    ]);
  }
}

class _GameTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  const _GameTile({
    required this.icon, required this.iconColor,
    required this.title, required this.subtitle, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: KodaColors.card,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: KodaColors.border),
        ),
        child: Row(children: [
          Container(
            width: 44, height: 44,
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(width: 14),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: TextStyle(color: KodaColors.text1, fontSize: 15, fontWeight: FontWeight.w600)),
            const SizedBox(height: 2),
            Text(subtitle, style: TextStyle(color: KodaColors.text3, fontSize: 12)),
          ])),
          Icon(Icons.chevron_right, color: KodaColors.text3),
        ]),
      ),
    );
  }
}
