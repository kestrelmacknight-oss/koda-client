// Throwaway preview harness for VispAvatar -- not part of the app, run
// directly against the live server. Lets us eyeball the glow animation
// and kaomoji mood swaps without needing to log in and navigate to a
// real Visp dialog. Delete after visual verification.
//
// Run: flutter run -d windows -t tool/visp_avatar_preview.dart

import 'package:flutter/material.dart';
import 'package:koda/core/theme.dart';
import 'package:koda/features/visp/visp_avatar.dart';

void main() {
  runApp(const _PreviewApp());
}

class _PreviewApp extends StatelessWidget {
  const _PreviewApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: KodaColors.voidBg,
        body: const _MoodCycler(),
      ),
    );
  }
}

class _MoodCycler extends StatefulWidget {
  const _MoodCycler();
  @override
  State<_MoodCycler> createState() => _MoodCyclerState();
}

class _MoodCyclerState extends State<_MoodCycler> {
  int _i = 0;
  static const _moods = VispMood.values;

  @override
  Widget build(BuildContext context) {
    final mood = _moods[_i % _moods.length];
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // A row of every size actually used in the app, all animating
          // at once and all wearing the current mood's face, so both the
          // glow pulse and the face overlay are easy to eyeball together.
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              VispAvatar(size: 24, mood: mood),
              const SizedBox(width: 24),
              VispAvatar(size: 36, mood: mood),
              const SizedBox(width: 24),
              VispAvatar(size: 64, mood: mood),
              const SizedBox(width: 24),
              VispAvatar(size: 96, mood: mood),
            ],
          ),
          const SizedBox(height: 24),
          Text(mood.name,
              style: TextStyle(color: KodaColors.text3, fontSize: 13)),
          const SizedBox(height: 24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: KodaColors.koda),
            onPressed: () => setState(() => _i++),
            child: const Text('Next mood', style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }
}
