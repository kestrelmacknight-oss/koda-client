// lib/features/voice/voice_bar.dart
//
// Slim persistent bottom bar shown while connected to a voice channel.
// Allows mute/camera toggle and leaving voice without navigating away
// from the current text channel.
//
// Tapping the bar opens the full VoiceScreen for the grid view.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme.dart';
import '../../../core/voice_session.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../../shared/widgets.dart';
import 'voice_screen.dart';

class VoiceBar extends ConsumerWidget {
  const VoiceBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context);
    final session = ref.watch(voiceSessionProvider);
    if (session == null) return const SizedBox.shrink();

    final activeSpeakers = session.room.activeSpeakers.map((p) => p.sid).toSet();
    final localSid = session.room.localParticipant?.sid;
    final isSpeaking = localSid != null && activeSpeakers.contains(localSid);
    final participantCount = 1 + session.room.remoteParticipants.length;

    void openVoiceScreen() => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => VoiceScreen(
              channelName: session.channelName,
              token: '',   // room already connected -- VoiceScreen detects this
              url:   '',
              existingSession: session,
            ),
          ),
        );

    return GestureDetector(
      onTap: openVoiceScreen,
      child: Container(
        height: 52,
        decoration: BoxDecoration(
          color: KodaColors.elevated,
          border: Border(
            top: BorderSide(
              color: isSpeaking
                  ? KodaColors.mint.withValues(alpha: 0.6)
                  : KodaColors.border,
              width: isSpeaking ? 2 : 1,
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Row(children: [
          // Speaking indicator dot + channel name/count -- merged into
          // one informational node (not the 3 real buttons below, which
          // must stay independently focusable) with its own double-tap
          // action so the "tap to expand" hint stays true for a screen
          // reader too, not just visually.
          Expanded(
            child: KodaTappable(
              onTap: openVoiceScreen,
              semanticLabel: t.voiceBarConnectedSemanticLabel(session.channelName, participantCount)
                  + (isSpeaking ? t.voiceBarSpeakingSuffix : ""),
              child: Row(children: [
                Container(
                  width: 8, height: 8,
                  decoration: BoxDecoration(
                    color: isSpeaking ? KodaColors.mint : KodaColors.text3,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        session.channelName,
                        style: TextStyle(
                            color: KodaColors.text1,
                            fontSize: 13,
                            fontWeight: FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        t.voiceBarConnectedTapToExpand(participantCount),
                        style: TextStyle(
                            color: KodaColors.text3, fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ]),
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
            tooltip: session.muted ? t.serverUnmute : t.serverMute,
          ),

          // Camera toggle
          IconButton(
            iconSize: 18,
            icon: Icon(
              session.cameraOn ? Icons.videocam : Icons.videocam_off,
              color: session.cameraOn ? KodaColors.mint : KodaColors.text2,
            ),
            onPressed: () => ref.read(voiceSessionProvider.notifier).toggleCamera(),
            tooltip: session.cameraOn ? t.voiceBarStopCameraTooltip : t.voiceBarStartCameraTooltip,
          ),

          // Leave
          IconButton(
            iconSize: 18,
            icon: Icon(Icons.call_end, color: KodaColors.accent),
            onPressed: () => ref.read(voiceSessionProvider.notifier).leave(),
            tooltip: t.voiceBarLeaveVoiceTooltip,
          ),
        ]),
      ),
    );
  }
}
