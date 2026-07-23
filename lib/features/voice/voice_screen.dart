// lib/features/voice/voice_screen.dart

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
  lk.LocalVideoTrack? _localVideoTrack;

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

      _levelTimer = Timer.periodic(const Duration(milliseconds: 100), (_) {
        if (mounted) setState(() {});
      });

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
    if (_cameraOn) {
      await _localVideoTrack?.stop();
      await _room.localParticipant?.setCameraEnabled(false);
      if (mounted) setState(() { _cameraOn = false; _localVideoTrack = null; });
    } else {
      try {
        final track = await lk.LocalVideoTrack.createCameraTrack();
        await track.start();
        await _room.localParticipant?.publishVideoTrack(track);
        if (mounted) {
          setState(() { _cameraOn = true; _localVideoTrack = track; });
          // Give the track time to start producing frames
          await Future.delayed(const Duration(milliseconds: 300));
          if (mounted) setState(() {});
        }
      } catch (e) {
        debugPrint('[VoiceScreen] Camera error: $e');
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Camera error: $e')));
        }
      }
    }
  }

  Future<void> _leave() async {
    _leaving = true;
    _levelTimer?.cancel();
    if (_localVideoTrack != null) {
      await _localVideoTrack?.stop();
    }
    try { await _room.disconnect(); } catch (_) {}
    if (mounted) Navigator.of(context).pop();
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

  lk.VideoTrack? _getVideoTrack(lk.Participant p) {
    // For local participant, use our stored reference
    if (p == _room.localParticipant) return _localVideoTrack;
    // For remote participants, find the camera track publication
    final pubs = p.videoTrackPublications
        .where((t) => !t.isScreenShare && t.track != null)
        .toList();
    if (pubs.isEmpty) return null;
    return pubs.first.track as lk.VideoTrack?;
  }

  @override
  void dispose() {
    _levelTimer?.cancel();
    _room.removeListener(_onRoomChange);
    _listener.dispose();
    _localVideoTrack?.stop();
    try { _room.disconnect(); } catch (_) {}
    _room.dispose();
    super.dispose();
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
                              padding: const EdgeInsets.all(16),
                              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 160,
                                mainAxisSpacing: 12,
                                crossAxisSpacing: 12,
                                childAspectRatio: 0.85,
                              ),
                              itemCount: participants.length,
                              itemBuilder: (_, i) {
                                final p = participants[i];
                                final speaking = speakingSids.contains(p.sid);
                                final name = _displayName(p);
                                final isLocal = p == _room.localParticipant;
                                final videoTrack = _getVideoTrack(p);

                                return Container(
                                  decoration: BoxDecoration(
                                    color: KodaColors.card,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: speaking
                                          ? KodaColors.mint
                                          : KodaColors.border,
                                      width: speaking ? 2 : 1,
                                    ),
                                  ),
                                  child: Column(children: [
                                    Expanded(
                                      child: Stack(children: [
                                        // Video or avatar
                                        if (videoTrack != null)
                                          ClipRRect(
                                            borderRadius: const BorderRadius.vertical(
                                                top: Radius.circular(9)),
                                            child: ColoredBox(
                                              color: Colors.black,
                                              child: lk.VideoTrackRenderer(videoTrack),
                                            ),
                                          )
                                        else
                                          Center(child: KodaAvatar(
                                              username: name, size: 48)),
                                        // Camera indicator
                                        if (isLocal && _cameraOn)
                                          const Positioned(
                                            bottom: 4, right: 4,
                                            child: Icon(Icons.videocam,
                                                color: Colors.green, size: 14),
                                          ),
                                      ]),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6, vertical: 4),
                                      child: Text(
                                        isLocal ? '$name (you)' : name,
                                        style: const TextStyle(
                                            color: KodaColors.text1,
                                            fontSize: 11),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ]),
                                );
                              },
                            ),

                      // VARM overlay
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
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                        border: Border(top: BorderSide(color: KodaColors.border))),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      // Mute
                      IconButton(
                        iconSize: 28,
                        icon: Icon(_muted ? Icons.mic_off : Icons.mic,
                            color: _muted ? KodaColors.accent : KodaColors.text1),
                        onPressed: _toggleMute,
                        tooltip: _muted ? 'Unmute' : 'Mute',
                      ),
                      const SizedBox(width: 16),

                      // VARM toggle (only if configured)
                      if (settings.varmEnabled) ...[
                        IconButton(
                          iconSize: 28,
                          icon: Icon(Icons.face_retouching_natural,
                              color: _showVarm ? KodaColors.koda : KodaColors.text2),
                          tooltip: _showVarm ? 'Hide VARM' : 'Show VARM',
                          onPressed: () async {
                            if (!_showVarm && _cameraOn) await _toggleCamera();
                            setState(() => _showVarm = !_showVarm);
                          },
                        ),
                        const SizedBox(width: 8),
                      ],

                      // Camera
                      IconButton(
                        iconSize: 28,
                        icon: Icon(
                          _cameraOn ? Icons.videocam : Icons.videocam_off,
                          color: _cameraOn ? KodaColors.mint : KodaColors.text2,
                        ),
                        onPressed: () async {
                          if (!_cameraOn && _showVarm) {
                            setState(() => _showVarm = false);
                          }
                          await _toggleCamera();
                        },
                        tooltip: _cameraOn ? 'Stop camera' : 'Start camera',
                      ),
                      const SizedBox(width: 16),

                      // Leave
                      IconButton(
                        iconSize: 28,
                        icon: const Icon(Icons.call_end, color: KodaColors.accent),
                        onPressed: _leave,
                        tooltip: 'Leave Voice',
                      ),
                    ]),
                  ),
                ]),
    );
  }
}
