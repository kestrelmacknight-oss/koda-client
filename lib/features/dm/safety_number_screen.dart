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
import '../../l10n/generated/app_localizations.dart';

class SafetyNumberScreen extends StatefulWidget {
  final String peerUserId;
  final String peerName;
  // True when this screen was opened to resolve a SafetyNumberChanged
  // exception (as opposed to a routine "let's just double-check"
  // visit) -- see _loadForDevice's doc on why that changes whether a
  // stale pin or a fresh fetch gets displayed.
  final bool keyChanged;
  const SafetyNumberScreen({
    super.key,
    required this.peerUserId,
    required this.peerName,
    this.keyChanged = false,
  });

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
  // Whatever _loadForDevice just displayed, for the selected device --
  // this is what "Mark as Verified" actually pins. Previously that
  // button only reset a local UI flag and never touched the stored
  // pin at all, so a real key change could never actually be resolved:
  // the very next send/receive would throw SafetyNumberChanged again
  // from the exact same stale pin.
  PinnedIdentity? _pendingIdentity;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final t = AppLocalizations.of(context);
    try {
      final myMaterial = await SecureStorage.loadKeyMaterial();
      if (myMaterial == null) {
        setState(() => _error = t.safetyNumberKeysNotSetUp);
        return;
      }

      final deviceIds = await KodaApi.instance.getDeviceIdsFor(widget.peerUserId);
      if (deviceIds.isEmpty) {
        setState(() => _error = t.safetyNumberNoKeyBundle(widget.peerName));
        return;
      }
      _myIkDhPub = myMaterial.identity.dh.publicKeyBytes;
      if (mounted) setState(() => _deviceIds = deviceIds);

      await _loadForDevice(deviceIds.first, _myIkDhPub!);
    } catch (e) {
      if (mounted) setState(() => _error = t.safetyNumberComputeError('$e'));
    }
  }

  Future<void> _loadForDevice(String deviceId, Uint8List myIkDhPub) async {
    final t = AppLocalizations.of(context);
    if (mounted) {
      setState(() { _selectedDeviceId = deviceId; _safetyNumber = null; _pendingIdentity = null; });
    }
    try {
      Uint8List? peerDhPub;
      Uint8List? peerSignPub;
      if (!widget.keyChanged) {
        // Prefer the pinned key (what's actually being trusted for this
        // device's session) over a fresh fetch -- fetching would consume
        // one of its one-time prekeys for no reason, and a routine
        // "let's just double-check" visit only needs to confirm the
        // identity already in use. widget.keyChanged skips straight to
        // a fresh fetch below instead: by definition the pin is the
        // *wrong* (stale) key in that case, so showing it would just
        // silently re-confirm the same mismatch.
        final pinned = await SecureStorage.loadPinnedIdentity(widget.peerUserId, deviceId) ??
            await SecureStorage.loadPinnedIdentity(widget.peerUserId);
        peerDhPub = pinned?.ikDhPub;
        peerSignPub = pinned?.ikSignPub;
      }
      if (peerDhPub == null) {
        final bundle = await KodaApi.instance.fetchKeyBundle(widget.peerUserId, deviceId);
        if (bundle == null) {
          setState(() => _error = t.safetyNumberDeviceGone(widget.peerName));
          return;
        }
        peerDhPub = b64ToBytes(bundle['ik_dh_pub'] as String);
        peerSignPub = b64ToBytes(bundle['ik_sign_pub'] as String);
      }
      _pendingIdentity = PinnedIdentity(peerDhPub, peerSignPub);

      final number = await computeSafetyNumber(myIkDhPub: myIkDhPub, theirIkDhPub: peerDhPub);
      if (mounted) setState(() => _safetyNumber = number);
    } catch (e) {
      if (mounted) setState(() => _error = t.safetyNumberComputeError('$e'));
    }
  }

  /// Actually commits what's currently displayed as the trusted key for
  /// this device -- previously this button only reset a local flag in
  /// dm_screen.dart and never touched the stored pin, so a genuine key
  /// change (someone reinstalling, say) could never actually be
  /// resolved: the next send/receive threw SafetyNumberChanged again
  /// from the exact same stale pin, forever.
  Future<void> _markVerified() async {
    final identity = _pendingIdentity;
    final deviceId = _selectedDeviceId;
    if (identity != null && deviceId != null) {
      await SecureStorage.savePinnedIdentity(widget.peerUserId, identity, deviceId);
    }
    if (mounted) Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: KodaColors.voidBg,
      appBar: AppBar(
        backgroundColor: KodaColors.bg2,
        title: Text(t.safetyNumberAppBarTitle(widget.peerName),
            style: TextStyle(color: KodaColors.text1, fontSize: 15)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
              t.safetyNumberInstructions(widget.peerName),
              style: TextStyle(color: KodaColors.text3, fontSize: 12)),
          if (_deviceIds.length > 1) ...[
            const SizedBox(height: 16),
            Text(
                t.safetyNumberMultiDeviceNote(widget.peerName, _deviceIds.length),
                style: TextStyle(color: KodaColors.text3, fontSize: 11, fontStyle: FontStyle.italic)),
            const SizedBox(height: 8),
            Wrap(spacing: 8, runSpacing: 8, children: _deviceIds.asMap().entries.map((e) {
              final selected = e.value == _selectedDeviceId;
              return ChoiceChip(
                label: Text(t.safetyNumberDeviceLabel(e.key + 1)),
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
              onPressed: _safetyNumber == null ? null : _markVerified,
              style: ElevatedButton.styleFrom(backgroundColor: KodaColors.koda),
              child: Text(t.safetyNumberMarkVerifiedButton),
            ),
          ),
        ]),
      ),
    );
  }
}
