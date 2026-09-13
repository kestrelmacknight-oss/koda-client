// lib/features/voice/pop_out_video_window.dart
//
// Runs in a separate OS window spawned by desktop_multi_window.
// Creates its own LiveKit room connection using token/url from arguments.
// Shows 16:9 video grid with in-app draggable pop-outs (Option A inside D).

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:livekit_client/livekit_client.dart' as lk;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme.dart';
import '../../core/providers.dart';
import '../../shared/widgets.dart';

class PopOutVideoWindow extends StatefulWidget {
  final String windowId;
  final String arguments; // JSON string
  const PopOutVideoWindow({
    super.key,
    required this.windowId,
    required this.arguments,
  });
  @override
  State<PopOutVideoWindow> createState() => _PopOutVideoWindowState();
}

class _PopOutVideoWindowState extends State<PopOutVideoWindow> {
  late final Map<String, dynamic> _args;
  lk.Room? _room;
  lk.EventsListener<lk.RoomEvent>? _listener;
  bool _connecting = true;
  String? _error;
  lk.LocalVideoTrack? _localVideoTrack;

  @override
  void initState() {
    super.initState();
    _args = widget.arguments.isNotEmpty
        ? Map<String, dynamic>.from(jsonDecode(widget.arguments))
        : {};
    debugPrint('[PopOut] arguments: ${widget.arguments}');
    debugPrint('[PopOut] args parsed: $_args');
    _connect();
  }

  Future<void> _connect() async {
    final token = _args['token'] as String?;
    final url = _args['url'] as String?;
    if (token == null || url == null) {
      setState(() { _error = 'Missing token or URL'; _connecting = false; });
      return;
    }
    debugPrint('[PopOut] Connecting to: $url');
    debugPrint('[PopOut] Token length: ${token.length}');
    try {
      final room = lk.Room();
      await room.connect(url, token,
          roomOptions: const lk.RoomOptions(
            adaptiveStream: true,
            dynacast: true,
          )).timeout(const Duration(seconds: 15), onTimeout: () {
        throw Exception('Connection timed out after 15 seconds');
      });

      final listener = room.createListener()
        ..on<lk.RoomDisconnectedEvent>((_) {
          if (mounted) Navigator.of(context).maybePop();
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
        ..on<lk.TrackSubscribedEvent>((_) {
          if (mounted) setState(() {});
        })
        ..on<lk.TrackUnsubscribedEvent>((_) {
          if (mounted) setState(() {});
        });

      if (mounted) {
        setState(() { _room = room; _listener = listener; _connecting = false; });
      }
    } catch (e) {
      if (mounted) setState(() { _error = e.toString(); _connecting = false; });
    }
  }

  @override
  void dispose() {
    _listener?.dispose();
    _localVideoTrack?.stop();
    _room?.disconnect();
    _room?.dispose();
    super.dispose();
  }

  String _displayName(dynamic p) {
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

  lk.VideoTrack? _getVideoTrack(dynamic p) {
    if (p == _room?.localParticipant) return _localVideoTrack;
    final pubs = p.videoTrackPublications
        .where((t) => !t.isScreenShare && t.track != null)
        .toList();
    if (pubs.isEmpty) return null;
    return pubs.first.track as lk.VideoTrack?;
  }

  @override
  Widget build(BuildContext context) {
    final channelName = _args['channel_name'] as String? ?? 'Voice';
    final room = _room;
    // This window connects as a subscribe-only "viewer" -- its own local
    // participant never publishes, so only show the real call participants.
    final participants = room == null ? <lk.Participant>[] : room
        .remoteParticipants.values
        .where((p) => !p.identity.endsWith('-view'))
        .toList();
    final speakingSids = (room?.activeSpeakers ?? []).map((p) => p.sid).toSet();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: kodaTheme(),
      home: Scaffold(
        backgroundColor: KodaColors.voidBg,
        appBar: AppBar(
          backgroundColor: KodaColors.bg2,
          title: Text('🔊 $channelName',
              style: const TextStyle(color: KodaColors.text1, fontSize: 14)),
          actions: [
            TextButton.icon(
              icon: const Icon(Icons.call_end, color: KodaColors.accent, size: 16),
              label: const Text('Leave', style: TextStyle(color: KodaColors.accent)),
              onPressed: () async {
                await _room?.disconnect();
                final ctrl = WindowController.fromWindowId(widget.windowId);
                await ctrl.hide();
              },
            ),
          ],
        ),
        body: _connecting
            ? const Center(child: CircularProgressIndicator(color: KodaColors.koda))
            : _error != null
                ? Center(child: Text('Error: $_error',
                    style: const TextStyle(color: KodaColors.accent)))
                : participants.isEmpty
                    ? const Center(child: Text('No participants',
                        style: TextStyle(color: KodaColors.text3)))
                    : GridView.builder(
                        padding: const EdgeInsets.all(16),
                        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 480,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          childAspectRatio: 16 / 9,
                        ),
                        itemCount: participants.length,
                        itemBuilder: (_, i) {
                          final p = participants[i];
                          final name = _displayName(p);
                          final videoTrack = _getVideoTrack(p);
                          final speaking = speakingSids.contains(p.sid);

                          return Container(
                            decoration: BoxDecoration(
                              color: KodaColors.card,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: speaking ? KodaColors.mint : KodaColors.border,
                                width: speaking ? 2 : 1,
                              ),
                            ),
                            child: Stack(children: [
                              // Video or avatar
                              ClipRRect(
                                borderRadius: BorderRadius.circular(9),
                                child: videoTrack != null
                                    ? lk.VideoTrackRenderer(videoTrack)
                                    : Center(child: KodaAvatar(
                                        username: name, size: 64)),
                              ),
                              // Name label
                              Positioned(
                                bottom: 6, left: 8,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 6, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(name,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 11)),
                                ),
                              ),
                              // Speaking indicator
                              if (speaking)
                                Positioned(
                                  top: 6, right: 6,
                                  child: Container(
                                    width: 8, height: 8,
                                    decoration: const BoxDecoration(
                                      color: KodaColors.mint,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                            ]),
                          );
                        },
                      ),
      ),
    );
  }
}




