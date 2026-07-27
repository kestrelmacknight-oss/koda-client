// lib/core/voice_session.dart
//
// Riverpod provider that manages a persistent LiveKit voice session.
// The room stays alive while the user browses other channels.
// VoiceBar in home_screen.dart observes this provider to show the
// persistent bottom bar.

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:livekit_client/livekit_client.dart' as lk;

class VoiceSession {
  final lk.Room room;
  final String channelId;
  final String channelName;
  final bool muted;
  final bool cameraOn;
  final lk.LocalVideoTrack? localVideoTrack;

  const VoiceSession({
    required this.room,
    required this.channelId,
    required this.channelName,
    this.muted = false,
    this.cameraOn = false,
    this.localVideoTrack,
  });

  VoiceSession copyWith({
    bool? muted,
    bool? cameraOn,
    lk.LocalVideoTrack? localVideoTrack,
    bool clearVideo = false,
  }) => VoiceSession(
    room:             room,
    channelId:        channelId,
    channelName:      channelName,
    muted:            muted ?? this.muted,
    cameraOn:         cameraOn ?? this.cameraOn,
    localVideoTrack:  clearVideo ? null : (localVideoTrack ?? this.localVideoTrack),
  );
}

class VoiceSessionNotifier extends StateNotifier<VoiceSession?> {
  VoiceSessionNotifier() : super(null);

  Future<bool> join({
    required String url,
    required String token,
    required String channelId,
    required String channelName,
  }) async {
    // Leave any existing session first
    if (state != null) await leave();

    final room = lk.Room();
    try {
      await room.connect(url, token);
      await room.localParticipant?.setMicrophoneEnabled(true);
      state = VoiceSession(
        room:        room,
        channelId:   channelId,
        channelName: channelName,
      );
      return true;
    } catch (e) {
      debugPrint('[VoiceSession] Failed to join: $e');
      await room.disconnect();
      room.dispose();
      return false;
    }
  }

  Future<void> leave() async {
    final s = state;
    if (s == null) return;
    state = null;
    await s.localVideoTrack?.stop();
    try { await s.room.disconnect(); } catch (_) {}
    s.room.dispose();
  }

  Future<void> toggleMute() async {
    final s = state;
    if (s == null) return;
    final newMuted = !s.muted;
    await s.room.localParticipant?.setMicrophoneEnabled(!newMuted);
    state = s.copyWith(muted: newMuted);
  }

  Future<void> toggleCamera() async {
    final s = state;
    if (s == null) return;
    if (s.cameraOn) {
      await s.room.localParticipant?.setCameraEnabled(false);
      state = s.copyWith(cameraOn: false, clearVideo: true);
    } else {
      final settings = s.room.localParticipant;
      await s.room.localParticipant?.setCameraEnabled(true);
      await Future.delayed(const Duration(milliseconds: 800));
      final pub = s.room.localParticipant?.videoTrackPublications
          .where((t) => !t.isScreenShare).firstOrNull;
      state = s.copyWith(
        cameraOn: true,
        localVideoTrack: pub?.track as lk.LocalVideoTrack?,
      );
    }
  }
}

final voiceSessionProvider =
    StateNotifierProvider<VoiceSessionNotifier, VoiceSession?>(
  (ref) => VoiceSessionNotifier(),
);