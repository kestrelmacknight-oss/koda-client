// lib/features/settings/voice_video_settings_screen.dart
//
// Voice & Video settings: noise/echo/gain processing toggles, voice
// activity detection (VOX) with a sensitivity threshold, push-to-talk
// key binding, and a link to the live device test screen. Persisted
// via the user's settings blob (settings.voice).

import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/api.dart';
import '../../core/theme.dart';
import '../../core/providers.dart';
import '../../core/uploader.dart';
import 'device_test_screen.dart';

class VoiceVideoSettingsScreen extends ConsumerStatefulWidget {
  const VoiceVideoSettingsScreen({super.key});
  @override
  ConsumerState<VoiceVideoSettingsScreen> createState() => _VoiceVideoSettingsScreenState();
}

class _VoiceVideoSettingsScreenState extends ConsumerState<VoiceVideoSettingsScreen> {
  Map<String, dynamic> _fullSettings = {};
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final settings = await KodaApi.instance.getSettings();
    if (!mounted) return;
    _fullSettings = settings;
    final voiceJson = settings['voice'] as Map<String, dynamic>? ?? {};
    ref.read(voiceSettingsProvider.notifier).setAll(VoiceSettings.fromJson(voiceJson));
    setState(() => _loading = false);
  }

  Future<void> _save(VoiceSettings updated) async {
    ref.read(voiceSettingsProvider.notifier).setAll(updated);
    _fullSettings = {..._fullSettings, 'voice': updated.toJson()};
    await KodaApi.instance.putSettings(_fullSettings);
  }

  Future<void> _captureKeybind() async {
    final focusNode = FocusNode();
    final result = await showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => KeyboardListener(
        focusNode: focusNode,
        autofocus: true,
        onKeyEvent: (event) {
          if (event is KeyDownEvent) {
            Navigator.pop(ctx, event.logicalKey.keyLabel);
          }
        },
        child: AlertDialog(
          backgroundColor: KodaColors.card,
          title: const Text('Push to Talk', style: TextStyle(color: KodaColors.text1)),
          content: const Text('Press any key to bind it...',
              style: TextStyle(color: KodaColors.text2)),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          ],
        ),
      ),
    );
    focusNode.dispose();
    if (result != null) {
      final current = ref.read(voiceSettingsProvider);
      await _save(current.copyWith(pushToTalkKey: result));
    }
  }

  Future<void> _clearKeybind() async {
    final current = ref.read(voiceSettingsProvider);
    await _save(current.copyWith(clearPushToTalkKey: true));
  }

  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(voiceSettingsProvider);

    return Scaffold(
      backgroundColor: KodaColors.voidBg,
      appBar: AppBar(
        backgroundColor: KodaColors.bg2,
        title: const Text('Voice & Video',
            style: TextStyle(color: KodaColors.text1, fontSize: 16)),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator(color: KodaColors.koda))
          : ListView(
              padding: const EdgeInsets.all(20),
              children: [
                OutlinedButton.icon(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const DeviceTestScreen())),
                  icon: const Icon(Icons.tune, size: 16),
                  label: const Text('Test Devices'),
                ),
                const SizedBox(height: 20),

                _sectionLabel('Voice Processing'),
                _toggleTile(
                  title: 'Noise Suppression',
                  subtitle: 'Reduce background noise on your mic',
                  value: settings.noiseSuppression,
                  onChanged: (v) => _save(settings.copyWith(noiseSuppression: v)),
                ),
                _toggleTile(
                  title: 'Echo Cancellation',
                  subtitle: 'Prevent your own audio from echoing back',
                  value: settings.echoCancellation,
                  onChanged: (v) => _save(settings.copyWith(echoCancellation: v)),
                ),
                _toggleTile(
                  title: 'Auto Gain Control',
                  subtitle: 'Automatically balance mic volume',
                  value: settings.autoGainControl,
                  onChanged: (v) => _save(settings.copyWith(autoGainControl: v)),
                ),

                const SizedBox(height: 24),
                _sectionLabel('Voice Activity Detection (VOX)'),
                _toggleTile(
                  title: 'Enable VOX',
                  subtitle: 'Only transmit when you\'re actually speaking',
                  value: settings.vadEnabled,
                  onChanged: (v) => _save(settings.copyWith(vadEnabled: v)),
                ),
                if (settings.vadEnabled)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      const Text('Sensitivity',
                          style: TextStyle(color: KodaColors.text2, fontSize: 12)),
                      Slider(
                        value: settings.vadThreshold,
                        min: 0.0,
                        max: 1.0,
                        activeColor: KodaColors.koda,
                        inactiveColor: KodaColors.border,
                        onChanged: (v) => ref.read(voiceSettingsProvider.notifier)
                            .update((s) => s.copyWith(vadThreshold: v)),
                        onChangeEnd: (v) => _save(settings.copyWith(vadThreshold: v)),
                      ),
                      const Text(
                        'Lower = picks up quieter sounds. Higher = only louder speech triggers transmission.',
                        style: TextStyle(color: KodaColors.text3, fontSize: 11),
                      ),
                    ]),
                  ),

                const SizedBox(height: 24),
                _sectionLabel('Push to Talk'),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: KodaColors.card,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: KodaColors.border),
                  ),
                  child: Row(children: [
                    Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        const Text('Bound key',
                            style: TextStyle(color: KodaColors.text1, fontSize: 13)),
                        const SizedBox(height: 4),
                        Text(
                          settings.pushToTalkKey ?? 'Not set — mic stays live whenever unmuted',
                          style: const TextStyle(color: KodaColors.text3, fontSize: 12),
                        ),
                      ]),
                    ),
                    if (settings.pushToTalkKey != null)
                      TextButton(
                        onPressed: _clearKeybind,
                        child: const Text('Clear', style: TextStyle(color: KodaColors.accent)),
                      ),
                    TextButton(
                      onPressed: _captureKeybind,
                      child: Text(settings.pushToTalkKey == null ? 'Set Key' : 'Change'),
                    ),
                  ]),
                ),
                const SizedBox(height: 8),
                const Text(
                  'When a key is bound, your mic transmits only while you hold that key down. '
                  'This takes priority over VOX while you\'re in a voice channel.',
                  style: TextStyle(color: KodaColors.text3, fontSize: 11),
                ),
                const SizedBox(height: 24),
                _sectionLabel('VARM - Virtual Avatar Reactive Model'),
                const Text(
                  'Upload two images that swap when you speak. Visible only to you.',
                  style: TextStyle(color: KodaColors.text3, fontSize: 11),
                ),
                const SizedBox(height: 12),
                Row(children: [
                  Expanded(child: _varmImageTile(
                    label: 'Silent', url: settings.varmSilentUrl,
                    onPick: () => _pickVarmImage('silent'),
                    onClear: () => _save(settings.copyWith(varmSilentUrl: '')),
                  )),
                  const SizedBox(width: 12),
                  Expanded(child: _varmImageTile(
                    label: 'Talking', url: settings.varmTalkingUrl,
                    onPick: () => _pickVarmImage('talking'),
                    onClear: () => _save(settings.copyWith(varmTalkingUrl: '')),
                  )),
                ]),
                if (settings.varmEnabled) ...[
                  const SizedBox(height: 10),
                  const Text('Speaking threshold',
                      style: TextStyle(color: KodaColors.text2, fontSize: 12)),
                  Slider(
                    value: settings.varmThreshold,
                    min: 0.01, max: 0.5,
                    activeColor: KodaColors.koda,
                    inactiveColor: KodaColors.border,
                    onChanged: (v) => ref.read(voiceSettingsProvider.notifier)
                        .update((s) => s.copyWith(varmThreshold: v)),
                    onChangeEnd: (v) => _save(settings.copyWith(varmThreshold: v)),
                  ),
                  const Text('Lower = switches to talking image more easily.',
                      style: TextStyle(color: KodaColors.text3, fontSize: 11)),
                  OutlinedButton.icon(
                    onPressed: () => _save(settings.copyWith(clearVarm: true)),
                    icon: const Icon(Icons.delete_outline, size: 14, color: KodaColors.accent),
                    label: const Text('Remove VARM', style: TextStyle(color: KodaColors.accent)),
                  ),
                ],
              ],
            ),
    );
  }

  Future<void> _pickVarmImage(String slot) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['png', 'jpg', 'jpeg', 'gif', 'webp'],
    );
    if (result == null || result.files.single.path == null) return;
    final path = result.files.single.path!;
    final ext = path.split('.').last.toLowerCase();
    final contentType = ext == 'png' ? 'image/png'
        : ext == 'gif' ? 'image/gif'
        : ext == 'webp' ? 'image/webp'
        : 'image/jpeg';
    try {
      final uploaded = await KodaUploader.instance.upload(
        file: File(path),
        uploadType: 'avatar',
        contentType: contentType,
      );
      final current = ref.read(voiceSettingsProvider);
      final updated = slot == 'silent'
          ? current.copyWith(varmSilentUrl: uploaded.cdnUrl)
          : current.copyWith(varmTalkingUrl: uploaded.cdnUrl);
      await _save(updated);
    } on UploadException catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message)));
    }
  }

  Widget _varmImageTile({
    required String label,
    required String? url,
    required VoidCallback onPick,
    required VoidCallback onClear,
  }) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: KodaColors.card,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: KodaColors.border),
      ),
      child: url != null && url.isNotEmpty
          ? Stack(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(url,
                    width: double.infinity, height: 120, fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => const Center(
                        child: Icon(Icons.broken_image_outlined, color: KodaColors.text3))),
              ),
              Positioned(top: 4, right: 4,
                child: GestureDetector(
                  onTap: onClear,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: KodaColors.accent.withOpacity(0.85),
                      borderRadius: BorderRadius.circular(4)),
                    child: const Icon(Icons.close, size: 12, color: Colors.white),
                  ),
                ),
              ),
              Positioned(bottom: 4, left: 0, right: 0,
                child: Center(child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(color: Colors.black54,
                      borderRadius: BorderRadius.circular(99)),
                  child: Text(label,
                      style: const TextStyle(color: Colors.white, fontSize: 10)),
                )),
              ),
            ])
          : InkWell(
              onTap: onPick,
              borderRadius: BorderRadius.circular(10),
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Icon(Icons.add_photo_alternate_outlined,
                    color: KodaColors.text3, size: 28),
                const SizedBox(height: 6),
                Text(label, style: const TextStyle(color: KodaColors.text3, fontSize: 12)),
              ]),
            ),
    );
  }

  Widget _sectionLabel(String text) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(text.toUpperCase(),
            style: const TextStyle(
                color: KodaColors.text3, fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 1)),
      );

  Widget _toggleTile({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) => Container(
        margin: const EdgeInsets.only(bottom: 6),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        decoration: BoxDecoration(
          color: KodaColors.card,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: KodaColors.border),
        ),
        child: SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(title, style: const TextStyle(color: KodaColors.text1, fontSize: 13)),
          subtitle: Text(subtitle, style: const TextStyle(color: KodaColors.text3, fontSize: 11)),
          value: value,
          activeColor: KodaColors.koda,
          onChanged: onChanged,
        ),
      );
}
