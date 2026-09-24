// lib/features/stage/stage_screen.dart
//
// Stage channel: a broadcast room where admins/owners are speakers,
// everyone else joins as a listener and can request to speak via hand-raise.
//
// Real-time hand-raise events arrive via the LiveKit data channel
// (participant metadata changes) since Phoenix PubSub is server-side only.
// The admin sees hand-raise requests and can grant/revoke speaking.

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:livekit_client/livekit_client.dart' as lk;
import '../../core/api.dart';
import '../../core/checkout.dart';
import '../../core/theme.dart';
import '../../core/providers.dart';
import '../../shared/widgets.dart';

class StageScreen extends ConsumerStatefulWidget {
  final Map<String, dynamic> channel;
  const StageScreen({super.key, required this.channel});
  @override
  ConsumerState<StageScreen> createState() => _StageScreenState();
}

class _StageScreenState extends ConsumerState<StageScreen> {
  final lk.Room _room = lk.Room();
  late final lk.EventsListener<lk.RoomEvent> _listener;

  bool _connecting = true;
  bool _isSpeaker  = false;
  bool _muted      = false;
  bool _handRaised = false;
  bool _leaving     = false;
  String? _error;
  // Set when the server rejects the join with 402 "ticket_required" --
  // shown instead of the generic error state (see build()) with an
  // actual way to get in, rather than a dead end.
  Map<String, dynamic>? _ticketRequiredEvent;
  bool _buyingTicket = false;

  // Hand-raise requests visible to admins: {user_id -> username}
  final Map<String, String> _handRaises = {};

  String get _channelId => widget.channel['id'] as String;
  String get _channelName => widget.channel['name'] as String? ?? 'Stage';

  bool get _isAdmin {
    final user   = ref.read(authProvider).user;
    final server = ref.read(selectedServerProvider);
    if (user == null || server == null) return false;
    return user.isAdmin;
  }

  @override
  void initState() {
    super.initState();
    _listener = _room.createListener();
    _connect();
  }

  Future<void> _connect() async {
    try {
      final apiResult = await KodaApi.instance.joinStage(_channelId);

      if (apiResult.errorCode == 'ticket_required') {
        if (mounted) {
          setState(() {
            _connecting = false;
            _ticketRequiredEvent = apiResult.errorBody?['event'] as Map<String, dynamic>?;
          });
        }
        return;
      }

      final result = apiResult.data;
      if (result == null) {
        if (mounted) setState(() { _connecting = false; _error = 'Could not join stage.'; });
        return;
      }

      final isSpeaker = result['is_speaker'] as bool? ?? false;

      await _room.connect(
        result['url'] as String,
        result['token'] as String,
      );

      if (isSpeaker) {
        await _room.localParticipant?.setMicrophoneEnabled(true);
      }

      _listener
        ..on<lk.RoomDisconnectedEvent>((_) {
          if (mounted && !_leaving) Navigator.of(context).pop();
        })
        ..on<lk.ParticipantConnectedEvent>((_) {
          if (mounted) setState(() {});
        })
        ..on<lk.ParticipantDisconnectedEvent>((e) {
          // Clean up hand raises when someone leaves
          _handRaises.remove(e.participant.identity);
          if (mounted) setState(() {});
        })
        ..on<lk.ActiveSpeakersChangedEvent>((_) {
          if (mounted) setState(() {});
        })
        ..on<lk.ParticipantPermissionsUpdatedEvent>((e) {
          // Our own permissions changed -- update speaker state
          if (e.participant.identity == _room.localParticipant?.identity) {
            final canPublish = e.permissions.canPublish;
            if (canPublish && !_isSpeaker) {
              _room.localParticipant?.setMicrophoneEnabled(true);
            }
            if (mounted) setState(() => _isSpeaker = canPublish);
          }
          setState(() {});
        })
        ..on<lk.DataReceivedEvent>((e) {
          // Hand-raise events sent as JSON over the data channel
          try {
            final data = jsonDecode(utf8.decode(e.data)) as Map<String, dynamic>;
            final type = data['type'] as String?;
            if (type == 'hand_raised') {
              _handRaises[data['user_id'] as String] = data['username'] as String? ?? '?';
              if (mounted) setState(() {});
            } else if (type == 'hand_lowered') {
              _handRaises.remove(data['user_id'] as String);
              if (mounted) setState(() {});
            } else if (type == 'speaker_granted' &&
                data['user_id'] == _room.localParticipant?.identity) {
              setState(() { _isSpeaker = true; _handRaised = false; });
            }
          } catch (_) {}
        });

      _room.addListener(_onRoomChange);

      if (mounted) {
        setState(() {
          _connecting = false;
          _isSpeaker  = isSpeaker;
        });
      }
    } catch (e) {
      if (mounted) setState(() { _connecting = false; _error = e.toString(); });
    }
  }

  void _onRoomChange() {
    if (mounted) setState(() {});
  }

  Widget _buildTicketRequired() {
    final event = _ticketRequiredEvent!;
    final priceCents = event['price_cents'] as int? ?? 0;
    final price = (priceCents / 100).toStringAsFixed(2);
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 360),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Icon(Icons.confirmation_number_outlined, size: 48, color: KodaColors.koda),
            const SizedBox(height: 16),
            Text(event['title'] as String? ?? 'This stage',
                textAlign: TextAlign.center,
                style: TextStyle(color: KodaColors.text1,
                    fontSize: 17, fontWeight: FontWeight.w700)),
            const SizedBox(height: 6),
            Text('requires a ticket to join',
                style: TextStyle(color: KodaColors.text3, fontSize: 13)),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: KodaColors.koda,
                foregroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 44),
              ),
              onPressed: _buyingTicket ? null : _buyTicket,
              child: Text(_buyingTicket
                  ? 'Please wait...'
                  : (priceCents == 0 ? 'Get Free Ticket' : 'Buy Ticket -- \$$price')),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Not now', style: TextStyle(color: KodaColors.text3)),
            ),
          ]),
        ),
      ),
    );
  }

  Future<void> _buyTicket() async {
    final event = _ticketRequiredEvent;
    if (event == null) return;
    setState(() => _buyingTicket = true);
    final result = await KodaApi.instance.purchaseEventTicket(event['id'] as String);
    if (!mounted) return;
    setState(() => _buyingTicket = false);

    if (result == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not start ticket purchase.')));
      return;
    }
    if (result['free'] == true) {
      // Ticket claimed -- retry the join now that we hold one.
      setState(() { _ticketRequiredEvent = null; _connecting = true; });
      _connect();
    } else {
      final checkoutUrl = result['checkout_url'] as String?;
      if (checkoutUrl == null) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text(
                "Could not start checkout -- this server's owner may not have connected Stripe yet.")));
        return;
      }

      final eventId = event['id'] as String;
      final messenger = ScaffoldMessenger.of(context);
      final confirmed = await launchCheckoutAndWait(context, ref,
          checkoutUrl: checkoutUrl,
          matches: (data) =>
              data['payment_type'] == 'stage_ticket' && data['event_id'] == eventId);
      if (!mounted) return;
      if (confirmed) {
        setState(() { _ticketRequiredEvent = null; _connecting = true; });
        _connect();
      } else {
        messenger.showSnackBar(const SnackBar(content: Text(
            "Still waiting on that payment -- try joining again once it's confirmed.")));
      }
    }
  }

  Future<void> _toggleMute() async {
    final newMuted = !_muted;
    await _room.localParticipant?.setMicrophoneEnabled(!newMuted);
    if (mounted) setState(() => _muted = newMuted);
  }

  Future<void> _toggleHand() async {
    final newRaised = !_handRaised;
    setState(() => _handRaised = newRaised);

    // Send hand-raise event over LiveKit data channel to all participants
    final user = ref.read(authProvider).user;
    final payload = jsonEncode({
      'type':     newRaised ? 'hand_raised' : 'hand_lowered',
      'user_id':  user?.id ?? '',
      'username': user?.username ?? '?',
    });
    await _room.localParticipant?.publishData(
      utf8.encode(payload),
      reliable: true,
    );

    // Also hit the server endpoint so it's logged
    if (newRaised) {
      await KodaApi.instance.raiseHand(_channelId);
    } else {
      await KodaApi.instance.lowerHand(_channelId);
    }
  }

  Future<void> _grantSpeaker(String userId) async {
    final ok = await KodaApi.instance.grantSpeaker(_channelId, userId);
    if (ok) {
      _handRaises.remove(userId);
      // Notify via data channel
      final payload = jsonEncode({'type': 'speaker_granted', 'user_id': userId});
      await _room.localParticipant?.publishData(utf8.encode(payload), reliable: true);
      if (mounted) setState(() {});
    }
  }

  Future<void> _revokeSpeaker(String userId) async {
    await KodaApi.instance.revokeSpeaker(_channelId, userId);
    if (mounted) setState(() {});
  }

  Future<void> _leave() async {
    _leaving = true;
    if (_handRaised) await KodaApi.instance.lowerHand(_channelId);
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
    final speakers  = _room.remoteParticipants.values
        .where((p) => p.permissions.canPublish == true)
        .toList();
    final listeners = _room.remoteParticipants.values
        .where((p) => p.permissions.canPublish != true)
        .toList();
    final speakingSids = _room.activeSpeakers.map((p) => p.sid).toSet();

    return Scaffold(
      backgroundColor: KodaColors.voidBg,
      appBar: AppBar(
        backgroundColor: KodaColors.bg2,
        title: Row(children: [
          Icon(Icons.campaign_outlined, size: 18, color: KodaColors.koda),
          const SizedBox(width: 8),
          Text(_channelName,
              style: TextStyle(color: KodaColors.text1, fontSize: 16)),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: KodaColors.koda.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(99),
            ),
            child: Text(_isSpeaker ? 'Speaker' : 'Listener',
                style: TextStyle(
                    color: _isSpeaker ? KodaColors.koda : KodaColors.text3,
                    fontSize: 11)),
          ),
        ]),
      ),
      body: _connecting
          ? Center(child: CircularProgressIndicator(color: KodaColors.koda))
          : _ticketRequiredEvent != null
              ? _buildTicketRequired()
              : _error != null
              ? Center(child: Text('Could not join: $_error',
                  style: TextStyle(color: KodaColors.accent)))
              : Column(children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        // ── Speakers ──────────────────────────────────
                        Text('SPEAKERS',
                            style: TextStyle(color: KodaColors.text3,
                                fontSize: 11, fontWeight: FontWeight.w700,
                                letterSpacing: 1)),
                        const SizedBox(height: 12),
                        Wrap(spacing: 20, runSpacing: 16, children: [
                          // Local participant if speaker
                          if (_isSpeaker)
                            _SpeakerTile(
                              name: ref.read(authProvider).user?.username ?? 'You',
                              speaking: speakingSids.contains(
                                  _room.localParticipant?.sid),
                              muted: _muted,
                              isYou: true,
                              isAdmin: false,
                              onRevoke: null,
                            ),
                          ...speakers.map((p) {
                            final name     = _displayName(p);
                            final speaking = speakingSids.contains(p.sid);
                            return _SpeakerTile(
                              name: name,
                              speaking: speaking,
                              muted: false,
                              isYou: false,
                              isAdmin: _isAdmin,
                              onRevoke: _isAdmin
                                  ? () => _revokeSpeaker(p.identity)
                                  : null,
                            );
                          }),
                        ]),

                        const SizedBox(height: 28),

                        // ── Hand raises (admin only) ──────────────────
                        if (_isAdmin && _handRaises.isNotEmpty) ...[
                          Text('RAISED HANDS',
                              style: TextStyle(color: KodaColors.gold,
                                  fontSize: 11, fontWeight: FontWeight.w700,
                                  letterSpacing: 1)),
                          const SizedBox(height: 10),
                          ..._handRaises.entries.map((e) => Container(
                            margin: const EdgeInsets.only(bottom: 6),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 10),
                            decoration: BoxDecoration(
                              color: KodaColors.card,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: KodaColors.gold.withValues(alpha: 0.4)),
                            ),
                            child: Row(children: [
                              Icon(Icons.back_hand_outlined,
                                  color: KodaColors.gold, size: 16),
                              const SizedBox(width: 8),
                              Expanded(child: Text(e.value,
                                  style: TextStyle(
                                      color: KodaColors.text1, fontSize: 13))),
                              TextButton(
                                onPressed: () => _grantSpeaker(e.key),
                                child: Text('Allow',
                                    style: TextStyle(color: KodaColors.mint)),
                              ),
                              TextButton(
                                onPressed: () {
                                  _handRaises.remove(e.key);
                                  setState(() {});
                                },
                                child: Text('Ignore',
                                    style: TextStyle(color: KodaColors.text3)),
                              ),
                            ]),
                          )),
                          const SizedBox(height: 20),
                        ],

                        // ── Listeners ─────────────────────────────────
                        if (listeners.isNotEmpty || !_isSpeaker) ...[
                          Text('LISTENERS',
                              style: TextStyle(color: KodaColors.text3,
                                  fontSize: 11, fontWeight: FontWeight.w700,
                                  letterSpacing: 1)),
                          const SizedBox(height: 10),
                          Wrap(spacing: 12, runSpacing: 10, children: [
                            if (!_isSpeaker)
                              _ListenerChip(
                                name: ref.read(authProvider).user?.username ?? 'You',
                                handRaised: _handRaised,
                                isYou: true,
                              ),
                            ...listeners.map((p) => _ListenerChip(
                              name: _displayName(p),
                              handRaised: _handRaises.containsKey(p.identity),
                              isYou: false,
                            )),
                          ]),
                        ],
                      ]),
                    ),
                  ),

                  // ── Controls ──────────────────────────────────────────
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    decoration: BoxDecoration(
                        border: Border(top: BorderSide(color: KodaColors.border))),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      if (_isSpeaker) ...[
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
                      ] else ...[
                        IconButton(
                          iconSize: 28,
                          icon: Icon(
                            _handRaised
                                ? Icons.back_hand
                                : Icons.back_hand_outlined,
                            color: _handRaised
                                ? KodaColors.gold
                                : KodaColors.text2,
                          ),
                          onPressed: _toggleHand,
                          tooltip: _handRaised ? 'Lower hand' : 'Raise hand',
                        ),
                        const SizedBox(width: 16),
                      ],
                      IconButton(
                        iconSize: 28,
                        icon: Icon(Icons.logout,
                            color: KodaColors.accent),
                        onPressed: _leave,
                        tooltip: 'Leave Stage',
                      ),
                    ]),
                  ),
                ]),
    );
  }
}

// -- Sub-widgets --------------------------------------------------------------

class _SpeakerTile extends StatelessWidget {
  final String name;
  final bool speaking;
  final bool muted;
  final bool isYou;
  final bool isAdmin;
  final VoidCallback? onRevoke;

  const _SpeakerTile({
    required this.name,
    required this.speaking,
    required this.muted,
    required this.isYou,
    required this.isAdmin,
    this.onRevoke,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Stack(alignment: Alignment.bottomRight, children: [
        Container(
          padding: const EdgeInsets.all(3),
          decoration: speaking
              ? BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: KodaColors.mint, width: 3))
              : null,
          child: KodaAvatar(username: name, size: 56),
        ),
        if (muted)
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
                color: KodaColors.card, shape: BoxShape.circle),
            child: Icon(Icons.mic_off, size: 12, color: KodaColors.accent),
          ),
      ]),
      const SizedBox(height: 6),
      Text(isYou ? '$name (you)' : name,
          style: TextStyle(color: KodaColors.text1, fontSize: 12)),
      if (isAdmin && onRevoke != null)
        TextButton(
          onPressed: onRevoke,
          style: TextButton.styleFrom(
              minimumSize: Size.zero, padding: EdgeInsets.zero),
          child: Text('Move to listeners',
              style: TextStyle(color: KodaColors.text3, fontSize: 10)),
        ),
    ]);
  }
}

class _ListenerChip extends StatelessWidget {
  final String name;
  final bool handRaised;
  final bool isYou;

  const _ListenerChip({
    required this.name,
    required this.handRaised,
    required this.isYou,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: KodaColors.card,
        borderRadius: BorderRadius.circular(99),
        border: Border.all(
            color: handRaised
                ? KodaColors.gold.withValues(alpha: 0.6)
                : KodaColors.border),
      ),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        if (handRaised) ...[
          Icon(Icons.back_hand, size: 12, color: KodaColors.gold),
          const SizedBox(width: 4),
        ],
        Text(isYou ? '$name (you)' : name,
            style: TextStyle(
                color: isYou ? KodaColors.koda : KodaColors.text2,
                fontSize: 12)),
      ]),
    );
  }
}



