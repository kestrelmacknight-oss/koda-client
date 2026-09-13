// lib/features/dm/safety_number_screen.dart
//
// Lets two people compare a fingerprint of their identity keys out of
// band (in person, on a call) to confirm nobody -- including a
// compromised server -- substituted a different key. This is the
// optional, human half of protection against that; the automatic half
// (TOFU pinning, which blocks sending the moment a peer's key changes
// without anyone having to check anything) is in
// lib/core/crypto/dm_session_manager.dart and doesn't depend on anyone
// visiting this screen.

import 'package:flutter/material.dart';
import '../../core/api.dart';
import '../../core/secure_storage.dart';
import '../../core/crypto/kcp_primitives.dart';
import '../../core/crypto/safety_number.dart';
import '../../core/theme.dart';

class SafetyNumberScreen extends StatefulWidget {
  final String peerUserId;
  final String peerName;
  const SafetyNumberScreen({super.key, required this.peerUserId, required this.peerName});

  @override
  State<SafetyNumberScreen> createState() => _SafetyNumberScreenState();
}

class _SafetyNumberScreenState extends State<SafetyNumberScreen> {
  String? _safetyNumber;
  String? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final myMaterial = await SecureStorage.loadKeyMaterial();
      if (myMaterial == null) {
        setState(() => _error = "Your own keys haven't been set up yet.");
        return;
      }

      // Prefer the pinned key (what's actually being trusted for this
      // conversation) over a fresh fetch -- fetching would consume one
      // of their one-time prekeys for no reason, and the whole point of
      // this screen is to verify the identity already in use.
      var peerDhPub = (await SecureStorage.loadPinnedIdentity(widget.peerUserId))?.ikDhPub;
      if (peerDhPub == null) {
        final bundle = await KodaApi.instance.fetchKeyBundle(widget.peerUserId);
        if (bundle == null) {
          setState(() => _error = '${widget.peerName} has no key bundle yet.');
          return;
        }
        peerDhPub = b64ToBytes(bundle['ik_dh_pub'] as String);
      }

      final number = await computeSafetyNumber(
        myIkDhPub: myMaterial.identity.dh.publicKeyBytes,
        theirIkDhPub: peerDhPub,
      );
      if (mounted) setState(() => _safetyNumber = number);
    } catch (e) {
      if (mounted) setState(() => _error = 'Could not compute safety number: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KodaColors.voidBg,
      appBar: AppBar(
        backgroundColor: KodaColors.bg2,
        title: Text('Safety Number with ${widget.peerName}',
            style: const TextStyle(color: KodaColors.text1, fontSize: 15)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
              'Compare this number with ${widget.peerName} through another channel -- in '
              'person, a phone call, anywhere other than this chat. If it matches on both '
              "sides, you're talking to who you think you're talking to.",
              style: const TextStyle(color: KodaColors.text3, fontSize: 12)),
          const SizedBox(height: 24),
          if (_error != null)
            Text(_error!, style: const TextStyle(color: KodaColors.accent))
          else if (_safetyNumber == null)
            const Center(child: CircularProgressIndicator(color: KodaColors.koda))
          else
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: KodaColors.card,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: KodaColors.border),
              ),
              child: Text(
                _safetyNumber!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: KodaColors.text1,
                    fontSize: 18,
                    fontFamily: 'monospace',
                    letterSpacing: 1.5,
                    height: 1.8),
              ),
            ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _safetyNumber == null ? null : () => Navigator.pop(context, true),
              style: ElevatedButton.styleFrom(backgroundColor: KodaColors.koda),
              child: const Text('Mark as Verified'),
            ),
          ),
        ]),
      ),
    );
  }
}
