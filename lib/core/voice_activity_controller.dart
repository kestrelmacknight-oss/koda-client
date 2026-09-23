// lib/core/voice_activity_controller.dart
//
// Voice Activity Detection (VOX) and Push-to-Talk -- neither is a
// WebRTC capture constraint like noiseSuppression/echoCancellation
// (see audioCaptureOptionsFor in voice_session.dart for those). Both
// work by directly gating the published microphone track's mute state:
// VOX compares polled audioLevel against a threshold, PTT tracks
// whether the bound key is currently held. Both use LocalTrack's
// mute/unmute with stopOnMute: false -- the same lightweight
// enable-flag toggle (no capture-device stop/restart) that
// audioCaptureOptionsFor's stopAudioCaptureOnMute: false already
// applies to the manual mute button, so all three paths behave
// consistently and stay responsive at VOX's ~100ms polling cadence.
//
// Precedence (highest wins): manual mute > push-to-talk (while a key is
// bound) > VOX > always-on (neither configured). Manual mute is owned
// by the caller (voice_screen.dart's _muted / VoiceSession.muted) and
// read fresh on every tick -- this controller never overrides an
// explicit mute, and once manually muted the underlying track is
// already gone (setMicrophoneEnabled(false) stops the publication), so
// there's nothing left here to further mute anyway.

import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart' as rtc;
import 'package:livekit_client/livekit_client.dart' as lk;
import 'providers.dart';

class VoiceActivityController {
  Timer? _timer;
  bool _pttHeld = false;
  bool Function(KeyEvent)? _keyHandler;

  // Auto-ducking: lower other participants' playback volume while the
  // local participant is talking. Edge-triggered on _isDucking so
  // Helper.setVolume (a real native call) only fires on an actual
  // start/stop transition, not every 100ms tick. vadThreshold doubles
  // as the "am I talking" signal here rather than a second threshold
  // setting -- deliberate, see voice_activity_controller.dart's header.
  bool _isDucking = false;
  DateTime? _lastLoudAt;
  static const _duckVolume = 0.25;
  static const _duckReleaseHang = Duration(milliseconds: 500);

  // VOX release hang: without this, _apply below gated transmission on
  // a raw instantaneous audioLevel >= threshold check every 100ms tick --
  // any brief dip below threshold (the ~100-250ms natural gaps between
  // words in ordinary speech, not just pauses between sentences) closed
  // the mic immediately, chopping words off until the next syllable
  // happened to cross the threshold again. 300ms comfortably bridges
  // those inter-word gaps without holding the mic open noticeably after
  // someone actually stops talking -- shorter than ducking's 500ms
  // since VOX gates what's actually transmitted (should track speech
  // closely) while ducking is a coarser "someone has the floor" signal.
  DateTime? _lastVoxLoudAt;
  static const _voxReleaseHang = Duration(milliseconds: 300);

  // Per-participant manual volume (identity -> multiplier, 1.0 = normal,
  // absent = never touched = also 1.0). Session-scoped like ducking --
  // resets on the next call, not persisted. Composes multiplicatively
  // with ducking below rather than one overwriting the other, so
  // "everyone gets quieter while I talk" and "I turned Alex down" both
  // stay true at once.
  final Map<String, double> _participantVolumes = {};
  lk.Room? _room;
  lk.EventsListener<lk.RoomEvent>? _volumeListener;

  double volumeFor(String identity) => _participantVolumes[identity] ?? 1.0;

  void start({
    required lk.Room room,
    required VoiceSettings Function() settingsOf,
    required bool Function() isManuallyMuted,
  }) {
    stop();
    _room = room;

    _keyHandler = (event) {
      final key = settingsOf().pushToTalkKey;
      if (key == null || event.logicalKey.keyLabel != key) return false;
      if (event is KeyDownEvent) {
        _pttHeld = true;
      } else if (event is KeyUpEvent) {
        _pttHeld = false;
      }
      return false; // never consume -- PTT must not swallow the key from other widgets
    };
    HardwareKeyboard.instance.addHandler(_keyHandler!);

    // A participant who left and rejoined mid-call gets a fresh track --
    // reapply whatever volume was set for their identity earlier in this
    // same call, rather than silently dropping back to 100%.
    _volumeListener = room.createListener()
      ..on<lk.ParticipantConnectedEvent>((_) => _reapplyAllParticipantVolumes())
      ..on<lk.TrackSubscribedEvent>((_) => _reapplyAllParticipantVolumes());

    _timer = Timer.periodic(const Duration(milliseconds: 100), (_) {
      _apply(room, settingsOf(), isManuallyMuted());
    });
  }

  void stop() {
    _timer?.cancel();
    _timer = null;
    if (_keyHandler != null) {
      HardwareKeyboard.instance.removeHandler(_keyHandler!);
      _keyHandler = null;
    }
    _volumeListener?.dispose();
    _volumeListener = null;
    _room = null;
    _participantVolumes.clear();
    _pttHeld = false;
    // No volume-restore call here -- stop() runs as the room is
    // disconnecting/tearing down, so lingering ducked state on a track
    // about to be destroyed has no lasting effect. Just reset for the
    // next start().
    _isDucking = false;
    _lastLoudAt = null;
    _lastVoxLoudAt = null;
  }

  /// Called from the UI (see VoiceSessionNotifier.setParticipantVolume) --
  /// [volume] is a multiplier, 1.0 = normal, e.g. 0.0..2.0 for a 0-200%
  /// slider. Applies immediately, composed with whatever ducking state
  /// is currently in effect.
  Future<void> setParticipantVolume(String identity, double volume) async {
    _participantVolumes[identity] = volume;
    final room = _room;
    if (room == null) return;
    final participant = room.remoteParticipants.values
        .cast<lk.RemoteParticipant?>()
        .firstWhere((p) => p?.identity == identity, orElse: () => null);
    if (participant == null) return;
    await _setParticipantNativeVolume(participant, volume);
  }

  void _reapplyAllParticipantVolumes() {
    final room = _room;
    if (room == null || _participantVolumes.isEmpty) return;
    for (final participant in room.remoteParticipants.values) {
      final saved = _participantVolumes[participant.identity];
      if (saved != null) _setParticipantNativeVolume(participant, saved);
    }
  }

  Future<void> _setParticipantNativeVolume(
      lk.RemoteParticipant participant, double volume) async {
    final effective = volume * (_isDucking ? _duckVolume : 1.0);
    for (final pub in participant.audioTrackPublications) {
      final track = pub.track;
      if (track != null) await rtc.Helper.setVolume(effective, track.mediaStreamTrack);
    }
  }

  Future<void> _apply(lk.Room room, VoiceSettings settings, bool manuallyMuted) async {
    final track = room.localParticipant?.audioTrackPublications.firstOrNull?.track;
    if (track != null) {
      final bool shouldTransmit;
      if (manuallyMuted) {
        shouldTransmit = false;
      } else if (settings.pushToTalkKey != null) {
        shouldTransmit = _pttHeld;
      } else if (settings.vadEnabled) {
        final now = DateTime.now();
        if ((room.localParticipant?.audioLevel ?? 0.0) >= settings.vadThreshold) {
          _lastVoxLoudAt = now;
        }
        shouldTransmit =
            _lastVoxLoudAt != null && now.difference(_lastVoxLoudAt!) < _voxReleaseHang;
      } else {
        shouldTransmit = true; // neither configured -- always-on, the pre-VOX default
      }

      if (shouldTransmit && track.muted) {
        await track.unmute(stopOnMute: false);
      } else if (!shouldTransmit && !track.muted) {
        await track.mute(stopOnMute: false);
      }
    }

    await _applyDucking(room, settings);
  }

  Future<void> _applyDucking(lk.Room room, VoiceSettings settings) async {
    if (!settings.autoDucking) {
      if (_isDucking) {
        _isDucking = false;
        await _setRemoteVolumes(room);
      }
      return;
    }

    final level = room.localParticipant?.audioLevel ?? 0.0;
    final now = DateTime.now();
    if (level >= settings.vadThreshold) _lastLoudAt = now;

    final shouldDuck = _lastLoudAt != null && now.difference(_lastLoudAt!) < _duckReleaseHang;
    if (shouldDuck == _isDucking) return; // no transition, no native call needed

    _isDucking = shouldDuck;
    await _setRemoteVolumes(room);
  }

  // Applies the current duck multiplier to every remote participant,
  // each still composed with their own saved manual volume (see
  // _setParticipantNativeVolume) -- so a duck transition never clobbers
  // a volume someone was manually turned down (or up) to.
  Future<void> _setRemoteVolumes(lk.Room room) async {
    for (final participant in room.remoteParticipants.values) {
      await _setParticipantNativeVolume(participant, volumeFor(participant.identity));
    }
  }
}
