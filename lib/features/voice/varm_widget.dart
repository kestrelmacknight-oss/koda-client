// lib/features/voice/varm_widget.dart
//
// Virtual Avatar Reactive Model -- Alpha implementation.
//
// Shows two user-uploaded PNG images that swap based on the local
// participant's audio level. The "talking" image shows when audio
// exceeds the configured threshold; the "silent" image shows otherwise.
//
// This is a local-only overlay -- other participants do not see the VARM
// (that requires a server-side avatar agent, planned for a later phase).
// The overlay is clearly labeled "Visible to you only" in the voice UI.

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:livekit_client/livekit_client.dart' as lk;

class VarmWidget extends StatefulWidget {
  final lk.LocalParticipant? participant;
  final String silentUrl;
  final String talkingUrl;
  final double threshold;
  final double size;

  const VarmWidget({
    super.key,
    required this.participant,
    required this.silentUrl,
    required this.talkingUrl,
    this.threshold = 0.1,
    this.size = 160,
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

    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: Stack(children: [
        // Avatar image
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            url,
            width: widget.size,
            height: widget.size,
            fit: BoxFit.contain,
            errorBuilder: (_, __, ___) => Container(
              width: widget.size,
              height: widget.size,
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Icon(Icons.broken_image_outlined,
                    color: Colors.white54, size: 32),
              ),
            ),
          ),
        ),

        // Talking indicator border
        if (_talking)
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.greenAccent.withOpacity(0.8),
                  width: 3,
                ),
              ),
            ),
          ),

        // "Visible to you only" label
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
                'VARM · visible to you only',
                style: TextStyle(color: Colors.white70, fontSize: 9),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}