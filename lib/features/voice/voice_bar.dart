// lib/features/voice/voice_bar.dart
//
// Slim persistent bottom bar shown while connected to a voice channel.
// Allows mute/camera toggle and leaving voice without navigating away
// from the current text channel.
//
// Tapping the bar opens the full VoiceScreen for the grid view.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:livekit_client/livekit_client.dart' as lk;
import '../../../core/theme.dart';
import '../../../core/voice_session.dart';
import 'voice_screen.dart';

class VoiceBar extends ConsumerWidget {
  const VoiceBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(voiceSessionProvider);
    if (session == null) return const SizedBox.shrink();

    final activeSpeakers = session.room.activeSpeakers.map((p) => p.sid).toSet();
    final localSid = session.room.localParticipant?.sid;
    final isSpeaking = localSid != null && activeSpeakers.contains(localSid);
    final participantCount = 1 + session.room.remoteParticipants.length;

    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => VoiceScreen(
            channelName: session.channelName,
            token: '',   // room already connected -- VoiceScreen detects this
            url:   '',
            existingSession: session,
          ),
        ),
      ),
      child: Container(
        height: 52,
        decoration: BoxDecoration(
          color: KodaColors.elevated,
          border: Border(
            top: BorderSide(
              color: isSpeaking
                  ? KodaColors.mint.withOpacity(0.6)
                  : KodaColors.border,
              width: isSpeaking ? 2 : 1,
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Row(children: [
          // Speaking indicator dot
          Container(
            width: 8, height: 8,
            decoration: BoxDecoration(
              color: isSpeaking ? KodaColors.mint : KodaColors.text3,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),

          // Channel name and participant count
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  session.channelName,
                  style: const TextStyle(
                      color: KodaColors.text1,
                      fontSize: 13,
                      fontWeight: FontWeight.w600),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '$participantCount connected · tap to expand',
                  style: const TextStyle(
                      color: KodaColors.text3, fontSize: 10),
                ),
              ],
            ),
          ),

          // Mute toggle
          IconButton(
            iconSize: 18,
            icon: Icon(
              session.muted ? Icons.mic_off : Icons.mic,
              color: session.muted ? KodaColors.accent : KodaColors.text2,
            ),
            onPressed: () => ref.read(voiceSessionProvider.notifier).toggleMute(),
            tooltip: session.muted ? 'Unmute' : 'Mute',
          ),

          // Camera toggle
          IconButton(
            iconSize: 18,
            icon: Icon(
              session.cameraOn ? Icons.videocam : Icons.videocam_off,
              color: session.cameraOn ? KodaColors.mint : KodaColors.text2,
            ),
            onPressed: () => ref.read(voiceSessionProvider.notifier).toggleCamera(),
            tooltip: session.cameraOn ? 'Stop camera' : 'Start camera',
          ),

          // Leave
          IconButton(
            iconSize: 18,
            icon: const Icon(Icons.call_end, color: KodaColors.accent),
            onPressed: () => ref.read(voiceSessionProvider.notifier).leave(),
            tooltip: 'Leave Voice',
          ),
        ]),
      ),
    );
  }
}
