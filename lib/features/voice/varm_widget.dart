// lib/features/voice/varm_widget.dart
//
// Virtual Avatar Reactive Model -- Alpha implementation.
//
// Shows two user-uploaded PNG images that swap based on the participant's
// audio level. The "talking" image shows when audio exceeds the
// configured threshold; the "silent" image shows otherwise. Works for any
// participant, local or remote -- the images/threshold and the
// active/inactive toggle ride on that participant's LiveKit metadata (set
// at token mint time and updated live via setMetadata, see
// voice_screen.dart), so every participant in the call sees the same
// thing on that person's tile. `audioLevel` on [lk.Participant] is kept
// in sync by LiveKit for remote participants too, not just local.
//
// Rendered in place of a participant's tile content whenever their camera
// is off and VARM is active for them -- see voice_screen.dart's tile
// builder.

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:livekit_client/livekit_client.dart' as lk;

class VarmWidget extends StatefulWidget {
  final lk.Participant? participant;
  final String silentUrl;
  final String talkingUrl;
  final double threshold;
  final double? size; // null = fill the available space (tile usage)

  const VarmWidget({
    super.key,
    required this.participant,
    required this.silentUrl,
    required this.talkingUrl,
    this.threshold = 0.1,
    this.size,
  });

  @override
  State<VarmWidget> createState() => _VarmWidgetState();
}

class _VarmWidgetState extends State<VarmWidget> {
  Timer? _timer;
  bool _talking = false;

  @override
  void initState() {
    super.initState();
    // Poll audio level at 100ms -- same pattern as the mic level meter
    _timer = Timer.periodic(const Duration(milliseconds: 100), (_) {
      if (!mounted) return;
      final level = widget.participant?.audioLevel ?? 0.0;
      final nowTalking = level >= widget.threshold;
      if (nowTalking != _talking) {
        setState(() => _talking = nowTalking);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final url = _talking ? widget.talkingUrl : widget.silentUrl;

    final content = Stack(fit: StackFit.expand, children: [
      // Avatar image
      Image.network(
        url,
        fit: BoxFit.contain,
        errorBuilder: (_, __, ___) => const ColoredBox(
          color: Colors.black54,
          child: Center(
            child: Icon(Icons.broken_image_outlined,
                color: Colors.white54, size: 32),
          ),
        ),
      ),

      // Talking indicator border
      if (_talking)
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.greenAccent.withValues(alpha: 0.8),
                width: 3,
              ),
            ),
          ),
        ),

      // Label -- visible to everyone in the call now, so this just marks
      // the tile as a VARM overlay rather than a real camera feed.
      Positioned(
        bottom: 4,
        left: 0,
        right: 0,
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(99),
            ),
            child: const Text(
              'VARM',
              style: TextStyle(color: Colors.white70, fontSize: 9),
            ),
          ),
        ),
      ),
    ]);

    if (widget.size != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: SizedBox(width: widget.size, height: widget.size, child: content),
      );
    }
    return content; // fills whatever parent (a tile's ClipRRect) gives it
  }
}