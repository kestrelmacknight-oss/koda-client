// lib/features/settings/devices_screen.dart
//
// Lists this account's linked devices (see koda-server's Koda.Devices --
// each entry is a distinct E2EE identity, one per Koda install, see
// lib/core/secure_storage.dart's getOrCreateDeviceId doc for why there's
// no shared identity across devices). Lets you remove one you no longer
// use or don't recognize.

import 'package:flutter/material.dart';
import '../../core/api.dart';
import '../../core/secure_storage.dart';
import '../../core/theme.dart';

class DevicesScreen extends StatefulWidget {
  const DevicesScreen({super.key});
  @override
  State<DevicesScreen> createState() => _DevicesScreenState();
}

class _DevicesScreenState extends State<DevicesScreen> {
  List<Map<String, dynamic>> _devices = [];
  String? _myDeviceId;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    final results = await Future.wait([
      KodaApi.instance.getMyDevices(),
      SecureStorage.getOrCreateDeviceId(),
    ]);
    if (!mounted) return;
    setState(() {
      _devices = results[0] as List<Map<String, dynamic>>;
      _myDeviceId = results[1] as String;
      _loading = false;
    });
  }

  Future<void> _remove(String deviceId) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: const Text('Remove this device?', style: TextStyle(color: KodaColors.text1)),
        content: const Text(
            'It will need to sign in again, and any messages sent to it while removed '
            "won't reach it after -- Double Ratchet sessions don't retroactively fill in gaps.",
            style: TextStyle(color: KodaColors.text2)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
          TextButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: const Text('Remove', style: TextStyle(color: KodaColors.accent))),
        ],
      ),
    );
    if (confirmed != true) return;
    final ok = await KodaApi.instance.removeDevice(deviceId);
    if (ok) {
      await _load();
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not remove that device.')));
    }
  }

  String _formatLastActive(String? iso) {
    if (iso == null) return 'Never active';
    try {
      final dt = DateTime.parse(iso).toLocal();
      return 'Active ${dt.year}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')}';
    } catch (_) {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KodaColors.voidBg,
      appBar: AppBar(
        backgroundColor: KodaColors.bg2,
        title: const Text('Linked Devices',
            style: TextStyle(color: KodaColors.text1, fontSize: 16)),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator(color: KodaColors.koda))
          : ListView(
              padding: const EdgeInsets.all(20),
              children: [
                const Text(
                    'Each device you sign into has its own encryption identity -- a message '
                    "sent to you reaches every device below. Remove one you don't use or don't "
                    'recognize.',
                    style: TextStyle(color: KodaColors.text3, fontSize: 12, height: 1.5)),
                const SizedBox(height: 16),
                if (_devices.isEmpty)
                  const Text('No devices found.', style: TextStyle(color: KodaColors.text3))
                else
                  ..._devices.map((d) {
                    final deviceId = d['device_id'] as String;
                    final isThisDevice = deviceId == _myDeviceId;
                    return Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: KodaColors.card,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: KodaColors.border),
                      ),
                      child: Row(children: [
                        const Icon(Icons.devices_outlined, color: KodaColors.text3, size: 20),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Row(children: [
                              Text(d['name'] as String? ?? 'Unknown device',
                                  style: const TextStyle(color: KodaColors.text1, fontSize: 13,
                                      fontWeight: FontWeight.w600)),
                              if (isThisDevice) ...[
                                const SizedBox(width: 6),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                                  decoration: BoxDecoration(
                                      color: KodaColors.koda, borderRadius: BorderRadius.circular(99)),
                                  child: const Text('This device',
                                      style: TextStyle(color: Colors.black, fontSize: 9,
                                          fontWeight: FontWeight.w700)),
                                ),
                              ],
                            ]),
                            const SizedBox(height: 2),
                            Text(_formatLastActive(d['last_active_at'] as String?),
                                style: const TextStyle(color: KodaColors.text3, fontSize: 11)),
                          ]),
                        ),
                        if (!isThisDevice)
                          IconButton(
                            icon: const Icon(Icons.delete_outline, size: 18, color: KodaColors.accent),
                            tooltip: 'Remove device',
                            onPressed: () => _remove(deviceId),
                          ),
                      ]),
                    );
                  }),
              ],
            ),
    );
  }
}
