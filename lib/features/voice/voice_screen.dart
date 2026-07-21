// lib/features/voice/voice_screen.dart
//
// Real LiveKit voice connection for a voice channel. Connects using the
// token/url returned by KodaApi.getVoiceToken, publishes the local
// microphone, and shows connected participants with a speaking indicator.
//
// Also supports:
//   - Webcam toggle (publishes local camera track)
//   - VARM overlay (local-only reactive avatar when VARM is configured)

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:livekit_client/livekit_client.dart' as lk;
import '../../core/theme.dart';
import '../../core/providers.dart';
import '../../shared/widgets.dart';
import 'varm_widget.dart';

class VoiceScreen extends ConsumerStatefulWidget {
  final String channelName;
  final String token;
  final String url;

  const VoiceScreen({
    super.key,
    required this.channelName,
    required this.token,
    required this.url,
  });

  @override
  ConsumerState<VoiceScreen> createState() => _VoiceScreenState();
}

class _VoiceScreenState extends ConsumerState<VoiceScreen> {
  final lk.Room _room = lk.Room();
  late final lk.EventsListener<lk.RoomEvent> _listener;
  bool _connecting = true;
  bool _muted      = false;
  bool _leaving    = false;
  bool _cameraOn   = false;
  bool _showVarm   = false;
  String? _error;

  // Polling timer for audio level updates (participant grid speaking indicator)
  Timer? _levelTimer;

  @override
  void initState() {
    super.initState();
    _listener = _room.createListener();
    _connect();
  }

  Future<void> _connect() async {
    try {
      await _room.connect(widget.url, widget.token);
      await _room.localParticipant?.setMicrophoneEnabled(true);

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
        });

      _room.addListener(_onRoomChange);

      // Poll audio levels for speaking indicator
      _levelTimer = Timer.periodic(const Duration(milliseconds: 100), (_) {
        if (mounted) setState(() {});
      });

      // Auto-enable VARM if configured
      final settings = ref.read(voiceSettingsProvider);
      if (settings.varmEnabled) {
        setState(() => _showVarm = true);
      }

      if (mounted) setState(() => _connecting = false);
    } catch (e) {
      if (mounted) setState(() { _connecting = false; _error = e.toString(); });
    }
  }

  void _onRoomChange() {
    if (mounted) setState(() {});
  }

  Future<void> _toggleMute() async {
    final newMuted = !_muted;
    await _room.localParticipant?.setMicrophoneEnabled(!newMuted);
    if (mounted) setState(() => _muted = newMuted);
  }

  Future<void> _toggleCamera() async {
    final newOn = !_cameraOn;
    await _room.localParticipant?.setCameraEnabled(newOn);
    if (mounted) setState(() => _cameraOn = newOn);
    if (newOn) {
      await Future.delayed(const Duration(milliseconds: 500));
      if (mounted) setState(() {});
    }
  }



  Future<void> _leave() async {
    _leaving = true;
    _levelTimer?.cancel();
    try { await _room.disconnect(); } catch (_) {}
    if (mounted) Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _levelTimer?.cancel();
    _room.removeListener(_onRoomChange);
    _listener.dispose();
    try { _room.disconnect(); } catch (_) {}
    _room.dispose();
    super.dispose();
  }

  String _displayName(lk.Participant p) {
    try {
      final meta = p.metadata;
      if (meta != null && meta.isNotEmpty) {
        final decoded = jsonDecode(meta) as Map<String, dynamic>;
        final username = decoded['username'] as String?;
        if (username != null && username.isNotEmpty) return username;
      }
    } catch (_) {}
    return p.identity;
  }

  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(voiceSettingsProvider);
    final participants = <lk.Participant>[
      if (_room.localParticipant != null) _room.localParticipant!,
      ..._room.remoteParticipants.values,
    ];
    final speakingSids = _room.activeSpeakers.map((p) => p.sid).toSet();

    return Scaffold(
      backgroundColor: KodaColors.voidBg,
      appBar: AppBar(
        backgroundColor: KodaColors.bg2,
        title: Text('🔊 ${widget.channelName}',
            style: const TextStyle(color: KodaColors.text1, fontSize: 16)),
      ),
      body: _connecting
          ? const Center(child: CircularProgressIndicator(color: KodaColors.koda))
          : _error != null
              ? Center(child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text('Could not connect: $_error',
                      style: const TextStyle(color: KodaColors.accent),
                      textAlign: TextAlign.center)))
              : Column(children: [
                  Expanded(
                    child: Stack(children: [
                      // Participant grid
                      participants.isEmpty
                          ? const Center(child: Text('Connecting...',
                              style: TextStyle(color: KodaColors.text3)))
                          : GridView.builder(
                              padding: const EdgeInsets.all(20),
                              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 140,
                                mainAxisSpacing: 16,
                                crossAxisSpacing: 16,
                              ),
                              itemCount: participants.length,
                              itemBuilder: (_, i) {
                                final p = participants[i];
                                final speaking = speakingSids.contains(p.sid);
                                final name = _displayName(p);
                                final isLocal = p.identity ==
                                    _room.localParticipant?.identity;

                                // Show camera video if published
                                // Show camera video if published
                                final videoTrack = (() {
                                  if (p is lk.LocalParticipant) {
                                    return p.videoTrackPublications
                                        .where((t) => !t.isScreenShare && t.track != null)
                                        .firstOrNull?.track as lk.VideoTrack?;
                                  }
                                  if (p is lk.RemoteParticipant) {
                                    return p.videoTrackPublications
                                        .where((t) => !t.isScreenShare && t.subscribed && t.track != null)
                                        .firstOrNull?.track as lk.VideoTrack?;
                                  }
                                  return null;
                                })();

                                return Column(children: [
                                  Container(
                                    padding: const EdgeInsets.all(3),
                                    decoration: speaking ? BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: KodaColors.mint, width: 3))
                                        : null,
                                    child: videoTrack != null
                                        ? SizedBox(width: 64, height: 64,
                                            child: ClipOval(child: lk.VideoTrackRenderer(videoTrack)))
                                        : Container(width: 64, height: 64,
                                            color: _cameraOn && isLocal ? Colors.red.withOpacity(0.5) : null,
                                            child: KodaAvatar(username: name, size: 64)),
                                  ),
                                  Text(
                                    isLocal ? '$name (you)' : name,
                                    style: const TextStyle(
                                        color: KodaColors.text1, fontSize: 12),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ]);
                              },
                            ),

                      // VARM overlay -- local only, bottom-left corner
                      if (_showVarm && settings.varmEnabled)
                        Positioned(
                          bottom: 12,
                          left: 12,
                          child: VarmWidget(
                            participant: _room.localParticipant,
                            silentUrl:  settings.varmSilentUrl!,
                            talkingUrl: settings.varmTalkingUrl!,
                            threshold:  settings.varmThreshold,
                            size: 160,
                          ),
                        ),
                    ]),
                  ),

                  // Controls
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      // Mute
                      IconButton(
                        iconSize: 28,
                        icon: Icon(_muted ? Icons.mic_off : Icons.mic,
                            color: _muted
                                ? KodaColors.accent
                                : KodaColors.text1),
                        onPressed: _toggleMute,
                        tooltip: _muted ? 'Unmute' : 'Mute',
                      ),
                      const SizedBox(width: 16),

                      // Camera / VARM controls
                      if (settings.varmEnabled) ...[
                        Tooltip(
                          message: _showVarm ? 'Hide VARM' : 'Show VARM',
                          child: IconButton(
                            iconSize: 28,
                            icon: Icon(Icons.face_retouching_natural,
                                color: _showVarm ? KodaColors.koda : KodaColors.text2),
                            onPressed: () async {
                              if (!_showVarm && _cameraOn) await _toggleCamera();
                              setState(() => _showVarm = !_showVarm);
                            },
                          ),
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
                          if (!_cameraOn && _showVarm) setState(() => _showVarm = false);
                          await _toggleCamera();
                        },
                        tooltip: _cameraOn ? 'Stop camera' : 'Start camera',
                      ),

                      // Leave
                      IconButton(
                        iconSize: 28,
                        icon: const Icon(Icons.call_end,
                            color: KodaColors.accent),
                        onPressed: _leave,
                        tooltip: 'Leave Voice',
                      ),
                    ]),
                  ),
                ]),
    );
  }
}





