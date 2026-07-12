// lib/features/voice/voice_screen.dart
//
// Real LiveKit voice connection for a voice channel. Connects using the
// token/url returned by KodaApi.getVoiceToken, publishes the local
// microphone, and shows connected participants with a speaking indicator.
//
// Usernames are read from each participant's `metadata` field, which the
// server embeds as JSON (see Koda.Voice.LiveKit.generate_token/3) --
// falls back to the raw identity (user id) if metadata is ever missing
// or fails to parse.

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:livekit_client/livekit_client.dart' as lk;
import '../../core/theme.dart';
import '../../shared/widgets.dart';

class VoiceScreen extends StatefulWidget {
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
  State<VoiceScreen> createState() => _VoiceScreenState();
}

class _VoiceScreenState extends State<VoiceScreen> {
  final lk.Room _room = lk.Room();
  late final lk.EventsListener<lk.RoomEvent> _listener;
  bool _connecting = true;
  bool _muted = false;
  bool _leaving = false;
  String? _error;

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
        });

      // Generic change notifications, for anything not covered by a
      // specific event above (track publish state, etc).
      _room.addListener(_onRoomChange);

      if (mounted) setState(() => _connecting = false);
    } catch (e) {
      if (mounted) {
        setState(() {
          _connecting = false;
          _error = e.toString();
        });
      }
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

  Future<void> _leave() async {
    _leaving = true;
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
    } catch (_) {
      // Fall through to identity below.
    }
    return p.identity;
  }

  @override
  void dispose() {
    _room.removeListener(_onRoomChange);
    _listener.dispose();
    try { _room.disconnect(); } catch (_) {}
    _room.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Text('Could not connect: $_error',
                        style: const TextStyle(color: KodaColors.accent),
                        textAlign: TextAlign.center),
                  ),
                )
              : Column(children: [
                  Expanded(
                    child: participants.isEmpty
                        ? const Center(
                            child: Text('Connecting...',
                                style: TextStyle(color: KodaColors.text3)))
                        : GridView.builder(
                            padding: const EdgeInsets.all(20),
                            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 120,
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 16,
                            ),
                            itemCount: participants.length,
                            itemBuilder: (_, i) {
                              final p = participants[i];
                              final speaking = speakingSids.contains(p.sid);
                              final name = _displayName(p);
                              return Column(children: [
                                Container(
                                  padding: const EdgeInsets.all(3),
                                  decoration: speaking
                                      ? BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(color: KodaColors.mint, width: 3),
                                        )
                                      : null,
                                  child: KodaAvatar(username: name, size: 64),
                                ),
                                const SizedBox(height: 6),
                                Text(name,
                                    style: const TextStyle(color: KodaColors.text1, fontSize: 12),
                                    overflow: TextOverflow.ellipsis),
                              ]);
                            },
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      IconButton(
                        iconSize: 28,
                        icon: Icon(_muted ? Icons.mic_off : Icons.mic,
                            color: _muted ? KodaColors.accent : KodaColors.text1),
                        onPressed: _toggleMute,
                        tooltip: _muted ? 'Unmute' : 'Mute',
                      ),
                      const SizedBox(width: 24),
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




