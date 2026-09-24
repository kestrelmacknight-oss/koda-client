// lib/core/voice_session.dart
//
// Riverpod provider that manages a persistent LiveKit voice session.
// The room stays alive while the user browses other channels.
// VoiceBar in home_screen.dart observes this provider to show the
// persistent bottom bar.

import 'dart:async';

import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart' as rtc;
import 'package:livekit_client/livekit_client.dart' as lk;
import 'platform.dart';
import 'providers.dart';
import 'voice_activity_controller.dart';

// Shared name both windows agree on -- see pop_out_video_window.dart's
// Leave button, the only other user of this channel. Named channels in
// desktop_multi_window are a simple broadcast rendezvous: whichever
// side calls setMethodCallHandler on this exact name receives whatever
// the other side invokes on it, no windowId bookkeeping needed.
const _voiceControlChannel = WindowMethodChannel('koda_voice_control');

class VoiceSession {
  final lk.Room room;
  final String channelId;
  final String channelName;
  final String token;
  final String url;
  final bool muted;
  final bool cameraOn;
  final lk.LocalVideoTrack? localVideoTrack;

  const VoiceSession({
    required this.room,
    required this.channelId,
    required this.channelName,
    required this.token,
    required this.url,
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
    token:            token,
    url:              url,
    muted:            muted ?? this.muted,
    cameraOn:         cameraOn ?? this.cameraOn,
    localVideoTrack:  clearVideo ? null : (localVideoTrack ?? this.localVideoTrack),
  );











}

lk.AudioCaptureOptions audioCaptureOptionsFor(VoiceSettings settings) =>
    lk.AudioCaptureOptions(
      deviceId:            settings.audioInputId,
      noiseSuppression:    settings.noiseSuppression,
      echoCancellation:    settings.echoCancellation,
      autoGainControl:     settings.autoGainControl,
      highPassFilter:      settings.highPassFilter,
      typingNoiseDetection: settings.typingNoiseDetection,
      voiceIsolation:      settings.voiceIsolation,
      // VOX/push-to-talk gate the published track's mute state directly
      // (see VoiceActivityController) rather than stopping capture on
      // every toggle -- that would be slow/glitchy at VOX's cadence.
      stopAudioCaptureOnMute: false,
    );

class VoiceSessionNotifier extends StateNotifier<VoiceSession?> {
  VoiceSessionNotifier(this._ref) : super(null) {
    // Unlike capture constraints (baked into the track at join() time,
    // see audioCaptureOptionsFor), EQ gains are just a native-side
    // state update -- no renegotiation needed -- so it's worth reacting
    // live rather than making a gain change wait for the next rejoin.
    // Only pushes a native call when an EQ-relevant field actually
    // changed, so tweaking an unrelated setting (push-to-talk key, VAD
    // threshold, etc.) mid-call doesn't spam it.
    _ref.listen(voiceSettingsProvider, (previous, next) {
      if (state == null) return;
      final eqChanged = previous == null ||
          previous.eqEnabled != next.eqEnabled ||
          previous.eqBassGain != next.eqBassGain ||
          previous.eqMidGain != next.eqMidGain ||
          previous.eqTrebleGain != next.eqTrebleGain;
      final boostChanged = previous == null ||
          previous.micBoostEnabled != next.micBoostEnabled ||
          previous.micBoostGain != next.micBoostGain;
      if (eqChanged) _applyEqGains(next);
      if (boostChanged) _applyMicBoost(next);
    });

    // The pop-out video window (see pop_out_video_window.dart) runs in
    // its own Flutter engine with its own separate, subscribe-only
    // LiveKit connection -- its own Leave button can only disconnect
    // that local viewer connection, not this, the *actual* session a
    // remote participant hears. Without this, clicking Leave there just
    // closed that window while the real call kept running in the
    // background, forcing a second/third trip to a leave button that
    // does reach this notifier (voice_bar.dart, voice_screen.dart).
    if (isDesktop) {
      _voiceControlChannel.setMethodCallHandler((call) async {
        if (call.method == 'leave_voice') await leave();
        return null;
      });
    }
  }
  final Ref _ref;
  final VoiceActivityController _voiceActivity = VoiceActivityController();

  Future<void> _applyEqGains(VoiceSettings settings) {
    final enabled = settings.eqEnabled;
    return rtc.Helper.setMicEqGains(
      bass:   enabled ? settings.eqBassGain   : 0.0,
      mid:    enabled ? settings.eqMidGain    : 0.0,
      treble: enabled ? settings.eqTrebleGain : 0.0,
    );
  }

  Future<void> _applyMicBoost(VoiceSettings settings) {
    return rtc.Helper.setMicBoost(
        settings.micBoostEnabled ? settings.micBoostGain : 0.0);
  }

  // Serializes join()/leave() calls. Without this, two rapid join() calls
  // (e.g. a double-tap on a voice channel) can both read `state == null`
  // before either finishes connecting, so neither one's leave-guard fires
  // and both open a Room and connect to LiveKit with the same identity --
  // producing exactly the DUPLICATE_IDENTITY reconnect churn seen in
  // production logs. Chaining every call onto this future forces them to
  // run one at a time, in call order.
  Future<void> _opLock = Future.value();

  Future<bool> join({
    required String url,
    required String token,
    required String channelId,
    required String channelName,
  }) async {
    final previous = _opLock;
    final completer = Completer<void>();
    _opLock = completer.future;
    await previous;
    try {
      return await _doJoin(
        url: url,
        token: token,
        channelId: channelId,
        channelName: channelName,
      );
    } finally {
      completer.complete();
    }
  }

  Future<bool> _doJoin({
    required String url,
    required String token,
    required String channelId,
    required String channelName,
  }) async {
    // Leave any existing session first
    if (state != null) await _doLeave();

    final room = lk.Room();
    try {
      await room.connect(url, token);
      await room.localParticipant?.setMicrophoneEnabled(true,
          audioCaptureOptions: audioCaptureOptionsFor(_ref.read(voiceSettingsProvider)));
      state = VoiceSession(
        room:        room,
        channelId:   channelId,
        channelName: channelName,
        token:       token,
        url:         url,
      );
      unawaited(_applyEqGains(_ref.read(voiceSettingsProvider)));
      unawaited(_applyMicBoost(_ref.read(voiceSettingsProvider)));

      // Runs for the whole life of the session -- including while
      // collapsed to the VoiceBar, not just while VoiceScreen's full
      // grid view is open, since that's exactly when VOX/PTT matter
      // most (you're doing something else, not looking at the call).
      _voiceActivity.start(
        room: room,
        settingsOf: () => _ref.read(voiceSettingsProvider),
        isManuallyMuted: () => state?.muted ?? false,
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
    final previous = _opLock;
    final completer = Completer<void>();
    _opLock = completer.future;
    await previous;
    try {
      await _doLeave();
    } finally {
      completer.complete();
    }
  }

  Future<void> _doLeave() async {
    final s = state;
    if (s == null) return;
    _voiceActivity.stop();
    state = null;
    await s.localVideoTrack?.stop();
    try { await s.room.disconnect(); } catch (_) {}
    s.room.dispose();
  }

  /// Current multiplier for a remote participant, 1.0 = normal --
  /// see VoiceActivityController.volumeFor. Session-scoped, not
  /// persisted; resets to 1.0 (i.e. absent) on the next call.
  double volumeForParticipant(String identity) => _voiceActivity.volumeFor(identity);

  /// Sets a remote participant's playback volume for the rest of this
  /// call -- [volume] is a multiplier, e.g. 0.0..2.0 for a 0-200%
  /// slider. Composes with auto-ducking rather than fighting it -- see
  /// VoiceActivityController.setParticipantVolume.
  Future<void> setParticipantVolume(String identity, double volume) =>
      _voiceActivity.setParticipantVolume(identity, volume);

  Future<void> toggleMute() async {
    final s = state;
    if (s == null) return;
    final newMuted = !s.muted;
    await s.room.localParticipant?.setMicrophoneEnabled(!newMuted,
        audioCaptureOptions: audioCaptureOptionsFor(_ref.read(voiceSettingsProvider)));
    state = s.copyWith(muted: newMuted);
  }

  Future<void> toggleCamera() async {
    final s = state;
    if (s == null) return;
    if (s.cameraOn) {
      await s.room.localParticipant?.setCameraEnabled(false);
      state = s.copyWith(cameraOn: false, clearVideo: true);
    } else {
      await s.room.localParticipant?.setCameraEnabled(true);
      await Future.delayed(const Duration(milliseconds: 2000));
      final pub = s.room.localParticipant?.videoTrackPublications
          .where((t) => !t.isScreenShare).firstOrNull;
      state = s.copyWith(
        cameraOn: true,
        localVideoTrack: pub?.track,
      );
    }
  }
}

final voiceSessionProvider =
    StateNotifierProvider<VoiceSessionNotifier, VoiceSession?>(
  (ref) => VoiceSessionNotifier(ref),
);
