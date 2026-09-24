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

import 'dart:typed_data';
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
  // Each of a peer's devices has its own independent identity key (see
  // SecureStorage.getOrCreateDeviceId's doc on why there's no way
  // around that without a device-linking ceremony this app doesn't
  // have) -- so there's one safety number *per device*, not one for
  // the whole person. Verifying one doesn't cover their others.
  List<String> _deviceIds = [];
  String? _selectedDeviceId;
  String? _safetyNumber;
  String? _error;
  Uint8List? _myIkDhPub;

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

      final deviceIds = await KodaApi.instance.getDeviceIdsFor(widget.peerUserId);
      if (deviceIds.isEmpty) {
        setState(() => _error = '${widget.peerName} has no key bundle yet.');
        return;
      }
      _myIkDhPub = myMaterial.identity.dh.publicKeyBytes;
      if (mounted) setState(() => _deviceIds = deviceIds);

      await _loadForDevice(deviceIds.first, _myIkDhPub!);
    } catch (e) {
      if (mounted) setState(() => _error = 'Could not compute safety number: $e');
    }
  }

  Future<void> _loadForDevice(String deviceId, Uint8List myIkDhPub) async {
    if (mounted) setState(() { _selectedDeviceId = deviceId; _safetyNumber = null; });
    try {
      // Prefer the pinned key (what's actually being trusted for this
      // device's session) over a fresh fetch -- fetching would consume
      // one of its one-time prekeys for no reason, and the whole point
      // of this screen is to verify the identity already in use.
      var peerDhPub = (await SecureStorage.loadPinnedIdentity(widget.peerUserId, deviceId))?.ikDhPub;
      peerDhPub ??= (await SecureStorage.loadPinnedIdentity(widget.peerUserId))?.ikDhPub;
      if (peerDhPub == null) {
        final bundle = await KodaApi.instance.fetchKeyBundle(widget.peerUserId, deviceId);
        if (bundle == null) {
          setState(() => _error = '${widget.peerName} no longer has that device.');
          return;
        }
        peerDhPub = b64ToBytes(bundle['ik_dh_pub'] as String);
      }

      final number = await computeSafetyNumber(myIkDhPub: myIkDhPub, theirIkDhPub: peerDhPub);
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
            style: TextStyle(color: KodaColors.text1, fontSize: 15)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
              'Compare this number with ${widget.peerName} through another channel -- in '
              'person, a phone call, anywhere other than this chat. If it matches on both '
              "sides, you're talking to who you think you're talking to.",
              style: TextStyle(color: KodaColors.text3, fontSize: 12)),
          if (_deviceIds.length > 1) ...[
            const SizedBox(height: 16),
            Text(
                '${widget.peerName} has ${_deviceIds.length} devices, each with its own safety '
                "number -- verifying one doesn't cover the others.",
                style: TextStyle(color: KodaColors.text3, fontSize: 11, fontStyle: FontStyle.italic)),
            const SizedBox(height: 8),
            Wrap(spacing: 8, runSpacing: 8, children: _deviceIds.asMap().entries.map((e) {
              final selected = e.value == _selectedDeviceId;
              return ChoiceChip(
                label: Text('Device ${e.key + 1}'),
                selected: selected,
                selectedColor: KodaColors.koda,
                backgroundColor: KodaColors.card,
                labelStyle: TextStyle(color: selected ? Colors.black : KodaColors.text2, fontSize: 12),
                onSelected: (_) {
                  if (_myIkDhPub != null) _loadForDevice(e.value, _myIkDhPub!);
                },
              );
            }).toList()),
          ],
          const SizedBox(height: 24),
          if (_error != null)
            Text(_error!, style: TextStyle(color: KodaColors.accent))
          else if (_safetyNumber == null)
            Center(child: CircularProgressIndicator(color: KodaColors.koda))
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
                style: TextStyle(
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
