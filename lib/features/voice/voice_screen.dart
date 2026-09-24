// lib/features/voice/voice_screen.dart

import 'dart:async';
import 'dart:convert';
import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart' show DesktopCapturerSource;
import 'package:livekit_client/livekit_client.dart' as lk;
import '../../core/api.dart';
import '../../core/platform.dart';
import '../../core/theme.dart';
import '../../core/providers.dart';
import '../../core/voice_activity_controller.dart';
import '../../core/voice_session.dart';
import '../../shared/pronoun_label.dart';
import '../../shared/widgets.dart';
import 'varm_widget.dart';

class VoiceScreen extends ConsumerStatefulWidget {
  final String channelName;
  final String token;
  final String url;
  final VoiceSession? existingSession;

  const VoiceScreen({
    super.key,
    required this.channelName,
    required this.token,
    required this.url,
    this.existingSession,
  });

  @override
  ConsumerState<VoiceScreen> createState() => _VoiceScreenState();
}

class _VoiceScreenState extends ConsumerState<VoiceScreen> {
  lk.Room _room = lk.Room();
  late final lk.EventsListener<lk.RoomEvent> _listener;
  bool _connecting    = true;
  bool _muted         = false;
  bool _leaving       = false;
  bool _cameraOn      = false;
  bool _showVarm      = false;
  bool _screenShareOn = false;
  String? _error;
  lk.LocalVideoTrack? _localVideoTrack;
  lk.LocalVideoTrack? _screenShareTrack;
  Timer? _levelTimer;
  // Only started for a fresh connection (existingSession == null) --
  // when reusing the persistent session, VoiceSessionNotifier already
  // runs one for the room's whole lifetime (see voice_session.dart), so
  // starting a second one here would double-drive the same track.
  VoiceActivityController? _voiceActivity;

  @override
  void initState() {
    super.initState();
    _connect();
  }

  Future<void> _connect() async {
    // Reuse existing session if tapping VoiceBar to expand
    if (widget.existingSession != null) {
      final s = widget.existingSession!;
      _room = s.room;
      _muted = s.muted;
      _cameraOn = s.cameraOn;
      _localVideoTrack = s.localVideoTrack;
      _listener = _room.createListener();
      _room.addListener(_onRoomChange);
      _levelTimer = Timer.periodic(const Duration(milliseconds: 100), (_) {
        if (mounted) setState(() {});
      });
      if (mounted) setState(() => _connecting = false);
      return;
    }

    // Fresh connection
    _listener = _room.createListener();
    try {
      await _room.connect(widget.url, widget.token);
      await _room.localParticipant?.setMicrophoneEnabled(true,
          audioCaptureOptions: audioCaptureOptionsFor(ref.read(voiceSettingsProvider)));

      _listener
        ..on<lk.RoomDisconnectedEvent>((_) {
          if (mounted && !_leaving) Navigator.of(context).pop();
        })
        ..on<lk.ParticipantConnectedEvent>((_) {
          if (mounted) setState(() {});
        })
        ..on<lk.ParticipantDisconnectedEvent>((_) {
          if (mounted) setState(() {});
        })
        ..on<lk.ActiveSpeakersChangedEvent>((_) {
          if (mounted) setState(() {});
        })
        ..on<lk.ParticipantPermissionsUpdatedEvent>((_) {
          if (mounted) setState(() {});
        })
        ..on<lk.LocalTrackPublishedEvent>((_) {
          if (mounted) setState(() {});
        })
        ..on<lk.LocalTrackUnpublishedEvent>((_) {
          if (mounted) setState(() {});
        })
        ..on<lk.TrackSubscribedEvent>((_) {
          if (mounted) setState(() {});
        })
        ..on<lk.ParticipantMetadataUpdatedEvent>((_) {
          // Catches VARM's active/inactive toggle from every participant
          // (setMetadata below), not just our own.
          if (mounted) setState(() {});
        });

      _room.addListener(_onRoomChange);

      _levelTimer = Timer.periodic(const Duration(milliseconds: 100), (_) {
        if (mounted) setState(() {});
      });

      _voiceActivity = VoiceActivityController()
        ..start(
          room: _room,
          settingsOf: () => ref.read(voiceSettingsProvider),
          isManuallyMuted: () => _muted,
        );

      final settings = ref.read(voiceSettingsProvider);
      if (settings.varmEnabled) await _setShowVarm(true);

      if (mounted) setState(() => _connecting = false);
    } catch (e) {
      if (mounted) setState(() { _connecting = false; _error = e.toString(); });
    }
  }

  void _onRoomChange() {
    if (mounted) setState(() {});
  }

  /// Flips local VARM visibility and pushes it onto our own LiveKit
  /// participant metadata (merged with whatever's already there --
  /// setMetadata replaces the whole string, it doesn't merge) so every
  /// other participant's client picks it up via
  /// ParticipantMetadataUpdatedEvent. Requires the `canUpdateOwnMetadata`
  /// grant koda-server's generate_token/3 puts in the join token.
  Future<void> _setShowVarm(bool value) async {
    if (mounted) setState(() => _showVarm = value);
    final lp = _room.localParticipant;
    if (lp == null) return;
    Map<String, dynamic> meta = {};
    try {
      final raw = lp.metadata;
      if (raw != null && raw.isNotEmpty) meta = jsonDecode(raw) as Map<String, dynamic>;
    } catch (_) {}
    meta['varm_active'] = value;
    try {
      await lp.setMetadata(jsonEncode(meta));
    } catch (e) {
      debugPrint('[VARM] metadata sync failed: $e');
    }
  }

  /// VARM config for [p] as everyone else in the call would see it --
  /// pulled from their LiveKit participant metadata (silent/talking URLs
  /// and threshold baked in at token mint, `varm_active` flipped live via
  /// setMetadata). Null if VARM isn't configured or isn't active for them.
  ({String silentUrl, String talkingUrl, double threshold})? _varmConfigFor(lk.Participant p) {
    try {
      final raw = p.metadata;
      if (raw == null || raw.isEmpty) return null;
      final decoded = jsonDecode(raw) as Map<String, dynamic>;
      if (decoded['varm_active'] != true) return null;
      final silentUrl = decoded['varm_silent_url'] as String?;
      final talkingUrl = decoded['varm_talking_url'] as String?;
      if (silentUrl == null || talkingUrl == null) return null;
      final threshold = (decoded['varm_threshold'] as num?)?.toDouble() ?? 0.1;
      return (silentUrl: silentUrl, talkingUrl: talkingUrl, threshold: threshold);
    } catch (_) {
      return null;
    }
  }

  Future<void> _toggleMute() async {
    final newMuted = !_muted;
    await _room.localParticipant?.setMicrophoneEnabled(!newMuted,
        audioCaptureOptions: audioCaptureOptionsFor(ref.read(voiceSettingsProvider)));
    if (mounted) setState(() => _muted = newMuted);
  }

  Future<void> _toggleCamera() async {
    if (_cameraOn) {
      await _localVideoTrack?.stop();
      await _room.localParticipant?.setCameraEnabled(false);
      if (mounted) setState(() { _cameraOn = false; _localVideoTrack = null; });
    } else {
      try {
        final settings = ref.read(voiceSettingsProvider);
        final deviceId = settings.videoInputId;
        final track = await lk.LocalVideoTrack.createCameraTrack(
          lk.CameraCaptureOptions(deviceId: deviceId),
        );
        await _room.localParticipant?.publishVideoTrack(track);
        await Future.delayed(const Duration(milliseconds: 500));
        if (mounted) setState(() { _cameraOn = true; _localVideoTrack = track; });
      } catch (e) {
        debugPrint('[Camera] error: $e');
      }
    }
  }

  Future<void> _toggleScreenShare() async {
    if (_screenShareOn) {
      await _screenShareTrack?.stop();
      if (mounted) setState(() { _screenShareOn = false; _screenShareTrack = null; });
    } else {
      try {
        final source = await showDialog<DesktopCapturerSource>(
          context: context,
          builder: (_) => lk.ScreenSelectDialog(),
        );
        if (source == null) return;
        final track = await lk.LocalVideoTrack.createScreenShareTrack(
          lk.ScreenShareCaptureOptions(sourceId: source.id, maxFrameRate: 15.0),
        );
        await _room.localParticipant?.publishVideoTrack(track);
        if (mounted) setState(() { _screenShareOn = true; _screenShareTrack = track; });
      } catch (e) {
        debugPrint('[ScreenShare] error: $e');
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Screen share failed: $e')));
        }
      }
    }
  }

  Future<void> _leave() async {
    _leaving = true;
    _levelTimer?.cancel();
    _room.removeListener(_onRoomChange);
    if (widget.existingSession != null) {
      // This button is labeled/iconed as "Leave Voice", not "minimize" --
      // it must actually end the call, not just close this view while
      // voiceSessionProvider keeps the session alive in the background.
      await ref.read(voiceSessionProvider.notifier).leave();
      if (mounted) Navigator.of(context).pop();
      return;
    }
    await _localVideoTrack?.stop();
    await _screenShareTrack?.stop();
    try { await _room.disconnect(); } catch (_) {}
    if (mounted) Navigator.of(context).pop();
  }

  void _popOutParticipant(BuildContext context, String name, lk.VideoTrack? videoTrack) {
    showDialog(
      context: context,
      barrierColor: Colors.black54,
      builder: (_) => _PopOutWindow(name: name, videoTrack: videoTrack),
    );
  }

  // Right-click a remote participant's tile to adjust how loud they are
  // *for you*, this call only -- composes with auto-ducking rather than
  // fighting it (see VoiceActivityController.setParticipantVolume), and
  // is purely local: it never touches what they publish or what anyone
  // else hears.
  void _showVolumeDialog(lk.Participant participant, String name) {
    final notifier = ref.read(voiceSessionProvider.notifier);
    var volume = notifier.volumeForParticipant(participant.identity);
    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          backgroundColor: KodaColors.card,
          title: Text('$name\'s Volume', style: TextStyle(color: KodaColors.text1)),
          content: SizedBox(
            width: 280,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Text('${(volume * 100).round()}%',
                  style: TextStyle(color: KodaColors.text2, fontSize: 13)),
              Slider(
                value: volume,
                min: 0.0,
                max: 2.0,
                divisions: 40,
                activeColor: KodaColors.koda,
                inactiveColor: KodaColors.border,
                onChanged: (v) {
                  setDialogState(() => volume = v);
                  notifier.setParticipantVolume(participant.identity, v);
                },
              ),
              Text(
                'Only affects what you hear -- this device, this call.',
                style: TextStyle(color: KodaColors.text3, fontSize: 11),
                textAlign: TextAlign.center,
              ),
            ]),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setDialogState(() => volume = 1.0);
                notifier.setParticipantVolume(participant.identity, 1.0);
              },
              child: const Text('Reset'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Done'),
            ),
          ],
        ),
      ),
    );
  }

  String _displayName(lk.Participant p) {
    try {
      final meta = p.metadata;
      if (meta != null && meta.isNotEmpty) {
        final decoded = jsonDecode(meta) as Map<String, dynamic>;
        final username = decoded['username'] as String?;
        if (username != null && username.isNotEmpty) return withPronouns(username, decoded);
      }
    } catch (_) {}
    return p.identity;
  }

  lk.VideoTrack? _getVideoTrack(lk.Participant p) {
    if (p == _room.localParticipant) return _localVideoTrack;
    final pubs = p.videoTrackPublications
        .where((t) => !t.isScreenShare && t.track != null)
        .toList();
    if (pubs.isEmpty) return null;
    return pubs.first.track as lk.VideoTrack?;
  }

  @override
  void dispose() {
    _levelTimer?.cancel();
    _voiceActivity?.stop();
    if (widget.existingSession == null) {
      _room.removeListener(_onRoomChange);
    }
    _listener.dispose();
    _localVideoTrack?.stop();
    _screenShareTrack?.stop();
    if (widget.existingSession == null) {
      try { _room.disconnect(); } catch (_) {}
      _room.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(voiceSettingsProvider);
    final participants = <lk.Participant>[
      if (_room.localParticipant != null) _room.localParticipant!,
      // "-view" identities are subscribe-only pop-out windows, not real
      // participants -- never show them as a tile.
      ..._room.remoteParticipants.values.where((p) => !p.identity.endsWith('-view')),
    ];
    final speakingSids = _room.activeSpeakers.map((p) => p.sid).toSet();

    return Scaffold(
      backgroundColor: KodaColors.voidBg,
      appBar: AppBar(
        backgroundColor: KodaColors.bg2,
        title: Text('🔊 ${widget.channelName}',
            style: TextStyle(color: KodaColors.text1, fontSize: 16)),
      ),
      body: _connecting
          ? Center(child: CircularProgressIndicator(color: KodaColors.koda))
          : _error != null
              ? Center(child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text('Could not connect: $_error',
                      style: TextStyle(color: KodaColors.accent),
                      textAlign: TextAlign.center)))
              : Column(children: [
                  Expanded(
                    child: Stack(children: [
                      // Participant grid
                      participants.isEmpty
                          ? Center(child: Text('Connecting...',
                              style: TextStyle(color: KodaColors.text3)))
                          : GridView.builder(
                              padding: const EdgeInsets.all(16),
                              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 320,
                                mainAxisSpacing: 12,
                                crossAxisSpacing: 12,
                                childAspectRatio: 16 / 9,
                              ),
                              itemCount: participants.length + (_screenShareOn ? 1 : 0),
                              itemBuilder: (_, i) {
                                // Screen share tile
                                if (_screenShareOn && i == participants.length) {
                                  return Semantics(
                                    button: true,
                                    label: 'Your screen, tap to view full-screen',
                                    child: GestureDetector(
                                    onTap: () => showDialog(
                                      context: context,
                                      barrierColor: Colors.black87,
                                      builder: (_) => GestureDetector(
                                        onTap: () => Navigator.pop(context),
                                        child: Scaffold(
                                          backgroundColor: Colors.transparent,
                                          body: Center(child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Expanded(child: Padding(
                                                padding: const EdgeInsets.all(16),
                                                child: ColoredBox(color: Colors.black,
                                                    child: lk.VideoTrackRenderer(_screenShareTrack!)),
                                              )),
                                              const Text('Your screen',
                                                  style: TextStyle(color: Colors.white, fontSize: 14)),
                                              const Text('Tap to close',
                                                  style: TextStyle(color: Colors.white54, fontSize: 11)),
                                              const SizedBox(height: 16),
                                            ],
                                          )),
                                        ),
                                      ),
                                    ),
                                    child: ExcludeSemantics(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: KodaColors.card,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: KodaColors.koda, width: 2),
                                      ),
                                      child: Column(children: [
                                        Expanded(
                                          child: ClipRRect(
                                            borderRadius: const BorderRadius.vertical(top: Radius.circular(9)),
                                            child: ColoredBox(color: Colors.black,
                                                child: lk.VideoTrackRenderer(_screenShareTrack!)),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                                          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                                            Icon(Icons.screen_share, color: KodaColors.koda, size: 12),
                                            SizedBox(width: 4),
                                            Text('Your screen',
                                                style: TextStyle(color: KodaColors.text1, fontSize: 11)),
                                          ]),
                                        ),
                                      ]),
                                    ),
                                    ),
                                  ));
                                }

                                // Participant tile
                                final p = participants[i];
                                final speaking = speakingSids.contains(p.sid);
                                final name = _displayName(p);
                                final isLocal = p == _room.localParticipant;
                                final videoTrack = _getVideoTrack(p);
                                // Local reads its own toggle state directly
                                // (instant feedback); remote participants'
                                // VARM state can only be known via their
                                // synced metadata, which lags a round trip.
                                final varmConfig = isLocal
                                    ? (_showVarm && settings.varmEnabled
                                        ? (
                                            silentUrl: settings.varmSilentUrl!,
                                            talkingUrl: settings.varmTalkingUrl!,
                                            threshold: settings.varmThreshold,
                                          )
                                        : null)
                                    : _varmConfigFor(p);

                                return Semantics(
                                  button: true,
                                  label: '${isLocal ? "$name (you)" : name}'
                                      '${speaking ? ", speaking" : ""}'
                                      '${isLocal && _cameraOn ? ", camera on" : ""}'
                                      ', double tap to pop out',
                                  child: GestureDetector(
                                  onDoubleTap: () => _popOutParticipant(context, name, videoTrack),
                                  onTap: () => _popOutParticipant(context, name, videoTrack),
                                  onSecondaryTapUp: isLocal
                                      ? null
                                      : (d) => _showVolumeDialog(p, name),
                                  child: ExcludeSemantics(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: KodaColors.card,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: speaking ? KodaColors.mint : KodaColors.border,
                                        width: speaking ? 2 : 1,
                                      ),
                                    ),
                                    child: Column(children: [
                                      Expanded(
                                        child: Stack(children: [
                                          if (videoTrack != null)
                                            ClipRRect(
                                              borderRadius: const BorderRadius.vertical(top: Radius.circular(9)),
                                              child: ColoredBox(color: Colors.black,
                                                  child: lk.VideoTrackRenderer(videoTrack)),
                                            )
                                          else if (varmConfig != null)
                                            ClipRRect(
                                              borderRadius: const BorderRadius.vertical(top: Radius.circular(9)),
                                              child: ColoredBox(color: Colors.black,
                                                  child: VarmWidget(
                                                    participant: p,
                                                    silentUrl: varmConfig.silentUrl,
                                                    talkingUrl: varmConfig.talkingUrl,
                                                    threshold: varmConfig.threshold,
                                                  )),
                                            )
                                          else
                                            Center(child: KodaAvatar(username: name, size: 48)),
                                          if (isLocal && _cameraOn)
                                            const Positioned(bottom: 4, right: 4,
                                              child: Icon(Icons.videocam, color: Colors.green, size: 14)),
                                        ]),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                                        child: Text(
                                          isLocal ? '$name (you)' : name,
                                          style: TextStyle(color: KodaColors.text1, fontSize: 11),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ]),
                                  ),
                                  ),
                                  ),
                                );
                              },
                            ),
                    ]),
                  ),

                  // Controls
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        border: Border(top: BorderSide(color: KodaColors.border))),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      IconButton(
                        iconSize: 28,
                        icon: Icon(_muted ? Icons.mic_off : Icons.mic,
                            color: _muted ? KodaColors.accent : KodaColors.text1),
                        onPressed: _toggleMute,
                        tooltip: _muted ? 'Unmute' : 'Mute',
                      ),
                      const SizedBox(width: 16),

                      if (settings.varmEnabled) ...[
                        IconButton(
                          iconSize: 28,
                          icon: Icon(Icons.face_retouching_natural,
                              color: _showVarm ? KodaColors.koda : KodaColors.text2),
                          tooltip: _showVarm ? 'Hide VARM' : 'Show VARM',
                          onPressed: () async {
                            if (!_showVarm && _cameraOn) await _toggleCamera();
                            await _setShowVarm(!_showVarm);
                          },
                        ),
                        const SizedBox(width: 8),
                      ],

                      IconButton(
                        iconSize: 28,
                        icon: Icon(
                          _cameraOn ? Icons.videocam : Icons.videocam_off,
                          color: _cameraOn ? KodaColors.mint : KodaColors.text2,
                        ),
                        onPressed: () async {
                          if (!_cameraOn && _showVarm) await _setShowVarm(false);
                          await _toggleCamera();
                        },
                        tooltip: _cameraOn ? 'Stop camera' : 'Start camera',
                      ),
                      const SizedBox(width: 8),

                      if (isDesktop) ...[
                        IconButton(
                          iconSize: 28,
                          icon: Icon(
                            _screenShareOn ? Icons.stop_screen_share : Icons.screen_share,
                            color: _screenShareOn ? KodaColors.accent : KodaColors.text2,
                          ),
                          onPressed: _toggleScreenShare,
                          tooltip: _screenShareOn ? 'Stop sharing' : 'Share screen',
                        ),
                        IconButton(
                          iconSize: 24,
                          icon: Icon(Icons.open_in_new, color: KodaColors.text2),
                          tooltip: 'Pop out voice to separate window',
                          onPressed: () async {
                            final channelId = widget.existingSession?.channelId;
                            if (channelId == null) return;
                            // The pop-out runs in its own isolate/engine, so it
                            // needs its own LiveKit connection -- request a
                            // subscribe-only "viewer" token (distinct identity)
                            // rather than reusing this window's, which would
                            // make the server boot the main call as a duplicate
                            // connection under the same identity.
                            final result = await KodaApi.instance
                                .getVoiceToken(channelId, viewer: true);
                            if (!context.mounted) return;
                            if (result == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Could not pop out voice.')),
                              );
                              return;
                            }
                            final args = jsonEncode({
                              'type': 'voice_popout',
                              'token': result['token'],
                              'url': result['url'],
                              'channel_name': widget.channelName,
                            });
                            final ctrl = await WindowController.create(WindowConfiguration(
                              arguments: args,
                            ));
                            await ctrl.show();
                          },
                        ),
                        const SizedBox(width: 8),
                      ],






                      IconButton(
                        iconSize: 28,
                        icon: Icon(Icons.call_end, color: KodaColors.accent),
                        onPressed: _leave,
                        tooltip: 'Leave Voice',
                      ),

                    ]),
                  ),
                ]),
    );
  }
}

class _PopOutWindow extends StatefulWidget {
  final String name;
  final lk.VideoTrack? videoTrack;
  const _PopOutWindow({required this.name, this.videoTrack});
  @override
  State<_PopOutWindow> createState() => _PopOutWindowState();
}

class _PopOutWindowState extends State<_PopOutWindow> {
  Offset _position = const Offset(100, 100);
  Size _size = const Size(480, 270); // 16:9
  bool _pinned = false;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      // Dismiss backdrop
      if (!_pinned)
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(color: Colors.transparent),
        ),
      Positioned(
        left: _position.dx,
        top: _position.dy,
        child: GestureDetector(
          onPanUpdate: (d) => setState(() =>
              _position = _position + d.delta),
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: _size.width,
              height: _size.height + 36,
              decoration: BoxDecoration(
                color: KodaColors.card,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: KodaColors.border),
                boxShadow: const [BoxShadow(
                  color: Colors.black54, blurRadius: 24, offset: Offset(0, 8))],
              ),
              child: Column(children: [
                // Title bar
                Container(
                  height: 36,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: KodaColors.elevated,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(11)),
                  ),
                  child: Row(children: [
                    Icon(Icons.drag_indicator,
                        size: 14, color: KodaColors.text3),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(widget.name,
                          style: TextStyle(color: KodaColors.text1,
                              fontSize: 12, fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis),
                    ),
                    // Pin toggle
                    IconButton(
                      icon: Icon(
                        _pinned ? Icons.push_pin : Icons.push_pin_outlined,
                        size: 14,
                        color: _pinned ? KodaColors.koda : KodaColors.text3,
                      ),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      tooltip: _pinned ? 'Unpin' : 'Pin (keep open)',
                      onPressed: () => setState(() => _pinned = !_pinned),
                    ),
                    const SizedBox(width: 8),
                    // Resize
                    PopupMenuButton<Size>(
                      icon: Icon(Icons.open_in_full,
                          size: 14, color: KodaColors.text3),
                      itemBuilder: (_) => [
                        const PopupMenuItem(value: Size(320, 180), child: Text('Small (320x180)')),
                        const PopupMenuItem(value: Size(480, 270), child: Text('Medium (480x270)')),
                        const PopupMenuItem(value: Size(640, 360), child: Text('Large (640x360)')),
                        const PopupMenuItem(value: Size(960, 540), child: Text('XL (960x540)')),
                      ],
                      onSelected: (s) => setState(() => _size = s),
                    ),
                    const SizedBox(width: 4),
                    // Close
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.close,
                          size: 16, color: KodaColors.text3),
                    ),
                  ]),
                ),
                // Video content � 16:9
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(11)),
                    child: ColoredBox(
                      color: Colors.black,
                      child: widget.videoTrack != null
                          ? lk.VideoTrackRenderer(widget.videoTrack!)
                          : Center(
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  children: [
                                Icon(Icons.videocam_off,
                                    color: KodaColors.text3, size: 32),
                                const SizedBox(height: 8),
                                Text(widget.name,
                                    style: TextStyle(
                                        color: KodaColors.text3, fontSize: 13)),
                              ])),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    ]);
  }
}




