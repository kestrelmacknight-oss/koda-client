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
import '../../l10n/generated/app_localizations.dart';

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
    // Captured before the await below, so we don't touch a
    // possibly-unmounted context afterward.
    final t = AppLocalizations.of(context);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: Text(t.devicesScreenRemoveConfirmTitle, style: TextStyle(color: KodaColors.text1)),
        content: Text(
            t.devicesScreenRemoveConfirmBody,
            style: TextStyle(color: KodaColors.text2)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text(t.commonCancel)),
          TextButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: Text(t.commonRemove, style: TextStyle(color: KodaColors.accent))),
        ],
      ),
    );
    if (confirmed != true) return;
    final ok = await KodaApi.instance.removeDevice(deviceId);
    if (ok) {
      await _load();
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(t.devicesScreenRemoveFailed)));
    }
  }

  String _formatLastActive(AppLocalizations t, String? iso) {
    if (iso == null) return t.devicesScreenNeverActive;
    try {
      final dt = DateTime.parse(iso).toLocal();
      return t.devicesScreenActiveDate(
          '${dt.year}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')}');
    } catch (_) {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: KodaColors.voidBg,
      appBar: AppBar(
        backgroundColor: KodaColors.bg2,
        // Exact match with the Settings nav entry's own title.
        title: Text(t.settingsLinkedDevicesTitle,
            style: TextStyle(color: KodaColors.text1, fontSize: 16)),
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator(color: KodaColors.koda))
          : ListView(
              padding: const EdgeInsets.all(20),
              children: [
                Text(
                    t.devicesScreenDescription,
                    style: TextStyle(color: KodaColors.text3, fontSize: 12, height: 1.5)),
                const SizedBox(height: 16),
                if (_devices.isEmpty)
                  Text(t.devicesScreenNoDevicesFound, style: TextStyle(color: KodaColors.text3))
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
                        Icon(Icons.devices_outlined, color: KodaColors.text3, size: 20),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Row(children: [
                              Text(d['name'] as String? ?? t.devicesScreenUnknownDevice,
                                  style: TextStyle(color: KodaColors.text1, fontSize: 13,
                                      fontWeight: FontWeight.w600)),
                              if (isThisDevice) ...[
                                const SizedBox(width: 6),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                                  decoration: BoxDecoration(
                                      color: KodaColors.koda, borderRadius: BorderRadius.circular(99)),
                                  child: Text(t.devicesScreenThisDeviceBadge,
                                      style: TextStyle(color: Colors.black, fontSize: 9,
                                          fontWeight: FontWeight.w700)),
                                ),
                              ],
                            ]),
                            const SizedBox(height: 2),
                            Text(_formatLastActive(t, d['last_active_at'] as String?),
                                style: TextStyle(color: KodaColors.text3, fontSize: 11)),
                          ]),
                        ),
                        if (!isThisDevice)
                          IconButton(
                            icon: Icon(Icons.delete_outline, size: 18, color: KodaColors.accent),
                            tooltip: t.devicesScreenRemoveDeviceTooltip,
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
