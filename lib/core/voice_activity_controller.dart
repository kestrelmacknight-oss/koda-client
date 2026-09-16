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
import 'package:livekit_client/livekit_client.dart' as lk;
import 'providers.dart';

class VoiceActivityController {
  Timer? _timer;
  bool _pttHeld = false;
  bool Function(KeyEvent)? _keyHandler;

  void start({
    required lk.Room room,
    required VoiceSettings Function() settingsOf,
    required bool Function() isManuallyMuted,
  }) {
    stop();

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
    _pttHeld = false;
  }

  Future<void> _apply(lk.Room room, VoiceSettings settings, bool manuallyMuted) async {
    final track = room.localParticipant?.audioTrackPublications.firstOrNull?.track;
    if (track == null) return;

    final bool shouldTransmit;
    if (manuallyMuted) {
      shouldTransmit = false;
    } else if (settings.pushToTalkKey != null) {
      shouldTransmit = _pttHeld;
    } else if (settings.vadEnabled) {
      shouldTransmit = (room.localParticipant?.audioLevel ?? 0.0) >= settings.vadThreshold;
    } else {
      shouldTransmit = true; // neither configured -- always-on, the pre-VOX default
    }

    if (shouldTransmit && track.muted) {
      await track.unmute(stopOnMute: false);
    } else if (!shouldTransmit && !track.muted) {
      await track.mute(stopOnMute: false);
    }
  }
}
