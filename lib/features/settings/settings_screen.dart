// lib/features/settings/settings_screen.dart

import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/config.dart';
import '../../core/api.dart';
import '../../core/socket.dart';
import '../../core/theme.dart';
import '../../core/providers.dart';
import '../../core/uploader.dart';
import '../../shared/widgets.dart';
import 'totp_setup_screen.dart';
import 'voice_video_settings_screen.dart';
import '../auth/auth_screen.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});
  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  int _section = 0;

  // Profile edit state
  bool _editingProfile  = false;
  bool _savingProfile   = false;
  bool _uploadingAvatar = false;
  String? _pickedAvatarPath;
  late TextEditingController _displayNameCtrl;
  late TextEditingController _avatarUrlCtrl;
  late TextEditingController _bioCtrl;
  String _status = 'online';

  static const _sections = [
    ('My Account', Icons.person_outline),
    ('Security',   Icons.security_outlined),
    ('Voice & Video', Icons.mic_outlined),
    ('About',      Icons.info_outlined),
  ];

  static const _statuses = ['online', 'away', 'dnd', 'offline'];
  static const _statusLabels = {
    'online':  'Online',
    'away':    'Away',
    'dnd':     'Do Not Disturb',
    'offline': 'Invisible',
  };
  static const _statusColors = {
    'online':  KodaColors.mint,
    'away':    KodaColors.gold,
    'dnd':     KodaColors.accent,
    'offline': KodaColors.text3,
  };

  @override
  void initState() {
    super.initState();
    final user = ref.read(authProvider).user;
    _displayNameCtrl = TextEditingController(text: user?.username ?? '');
    _avatarUrlCtrl   = TextEditingController();
    _bioCtrl         = TextEditingController();
    _status = 'online';
  }

  @override
  void dispose() {
    _displayNameCtrl.dispose();
    _avatarUrlCtrl.dispose();
    _bioCtrl.dispose();
    super.dispose();
  }

  void _startEditing() {
    final user = ref.read(authProvider).user;
    _displayNameCtrl.text = user?.username ?? '';
    setState(() => _editingProfile = true);
  }

  void _cancelEditing() => setState(() {
    _editingProfile  = false;
    _pickedAvatarPath = null;
  });

  Future<void> _pickAvatar() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'gif', 'webp'],
    );
    if (result == null || result.files.single.path == null) return;
    final path = result.files.single.path!;
    setState(() { _pickedAvatarPath = path; _uploadingAvatar = true; });

    try {
      final ext = path.split('.').last.toLowerCase();
      final contentType = switch (ext) {
        'png'  => 'image/png',
        'gif'  => 'image/gif',
        'webp' => 'image/webp',
        _      => 'image/jpeg',
      };
      final uploaded = await KodaUploader.instance.upload(
        file: File(path),
        uploadType: 'avatar',
        contentType: contentType,
      );
      _avatarUrlCtrl.text = uploaded.cdnUrl;
    } on UploadException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.message)));
        setState(() => _pickedAvatarPath = null);
      }
    } finally {
      if (mounted) setState(() => _uploadingAvatar = false);
    }
  }

  Future<void> _saveProfile() async {
    setState(() => _savingProfile = true);
    final data = <String, dynamic>{};
    if (_displayNameCtrl.text.trim().isNotEmpty) {
      data['display_name'] = _displayNameCtrl.text.trim();
    }
    if (_avatarUrlCtrl.text.trim().isNotEmpty) {
      data['avatar_url'] = _avatarUrlCtrl.text.trim();
    }
    if (_bioCtrl.text.trim().isNotEmpty) {
      data['bio'] = _bioCtrl.text.trim();
    }
    data['status'] = _status;

    await KodaApi.instance.updateProfile(
      displayName: data['display_name'],
      avatarUrl:   data['avatar_url'],
      bio:         data['bio'],
      status:      _status,
    );

    if (mounted) setState(() { _editingProfile = false; _savingProfile = false; });
  }

  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  Future<void> _signOut() async {
    KodaSocket.instance.disconnect();
    await KodaApi.instance.logout();
    ref.read(authProvider.notifier).clear();
    if (mounted) {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (_) => const AuthScreen()), (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authProvider).user;

    return Scaffold(
      backgroundColor: KodaColors.voidBg,
      body: Row(children: [
        SizedBox(
          width: 220,
          child: Container(
            color: KodaColors.bg2,
            child: Column(children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: KodaColors.border))),
                child: Row(children: [
                  const Text('Settings',
                      style: TextStyle(color: KodaColors.text1, fontWeight: FontWeight.w700)),
                  const Spacer(),
                  IconButton(
                      icon: const Icon(Icons.close, size: 18, color: KodaColors.text3),
                      onPressed: () => Navigator.pop(context)),
                ]),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  itemCount: _sections.length,
                  itemBuilder: (_, i) {
                    final (label, icon) = _sections[i];
                    final selected = i == _section;
                    return ListTile(
                      dense: true,
                      leading: Icon(icon, size: 16,
                          color: selected ? KodaColors.koda : KodaColors.text3),
                      title: Text(label, style: TextStyle(
                          fontSize: 13,
                          color: selected ? KodaColors.text1 : KodaColors.text3)),
                      selected: selected,
                      selectedTileColor: KodaColors.koda.withOpacity(0.12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      onTap: () => setState(() {
                        _section = i;
                        _editingProfile = false;
                      }),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: OutlinedButton.icon(
                  icon: const Icon(Icons.logout, size: 14, color: KodaColors.accent),
                  label: const Text('Sign out',
                      style: TextStyle(color: KodaColors.accent, fontSize: 12)),
                  onPressed: _signOut,
                  style: OutlinedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 36),
                      side: const BorderSide(color: KodaColors.accent, width: 0.5)),
                ),
              ),
            ]),
          ),
        ),
        Expanded(child: _buildSection(_section, user)),
      ]),
    );
  }

  Widget _buildSection(int index, KodaUser? user) {
    switch (index) {
      case 0:
        return _shell('My Account', _editingProfile
            ? _buildProfileEditor(user)
            : _buildProfileView(user));
      case 1:
        return _shell('Security', Column(children: [
          _tile(Icons.phone_android_outlined, 'Two-Factor Authentication',
              'Add an authenticator app for extra security',
              () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const TotpSetupScreen()))),
        ]));
      case 2:
        return const VoiceVideoSettingsScreen();
      case 3:
        return _shell('About Koda', Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: KodaColors.card, borderRadius: BorderRadius.circular(12),
                border: Border.all(color: KodaColors.border)),
            child: Row(children: [
              Container(
                width: 48, height: 48,
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        colors: [KodaColors.koda, KodaColors.mint],
                        begin: Alignment.topLeft, end: Alignment.bottomRight),
                    borderRadius: BorderRadius.circular(12)),
                child: const Center(child: Text('K', style: TextStyle(
                    fontSize: 24, fontWeight: FontWeight.w800, color: Colors.white))),
              ),
              const SizedBox(width: 16),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text(KodaConfig.appName, style: TextStyle(
                    color: KodaColors.text1, fontWeight: FontWeight.w700)),
                Text('${KodaConfig.buildLabel} v${KodaConfig.appVersion}',
                    style: const TextStyle(color: KodaColors.gold, fontSize: 12)),
                const Text(KodaConfig.company,
                    style: TextStyle(color: KodaColors.text3, fontSize: 11)),
              ]),
            ]),
          ),
          const SizedBox(height: 20),
          _tile(Icons.gavel_outlined, 'Terms & Conditions', 'koda.fyi/terms.html',
              () => _openUrl(KodaConfig.termsUrl)),
          _tile(Icons.privacy_tip_outlined, 'Privacy Policy', 'koda.fyi/privacy.html',
              () => _openUrl(KodaConfig.privacyUrl)),
          _tile(Icons.support_agent_outlined, 'Support', KodaConfig.supportEmail,
              () => _openUrl('mailto:${KodaConfig.supportEmail}')),
          _tile(Icons.security_outlined, 'Report a Security Issue', KodaConfig.securityEmail,
              () => _openUrl('mailto:${KodaConfig.securityEmail}')),
        ]));
      default:
        return const SizedBox();
    }
  }

  // -- Profile view (read-only) -----------------------------------------------

  Widget _buildProfileView(KodaUser? user) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: KodaColors.card, borderRadius: BorderRadius.circular(12),
            border: Border.all(color: KodaColors.border)),
        child: Row(children: [
          Stack(children: [
            KodaAvatar(username: user?.username ?? '?', size: 64, avatarUrl: user?.avatarUrl),
            Positioned(
              bottom: 0, right: 0,
              child: Container(
                width: 16, height: 16,
                decoration: BoxDecoration(
                    color: _statusColors[_status] ?? KodaColors.mint,
                    shape: BoxShape.circle,
                    border: Border.all(color: KodaColors.card, width: 2)),
              ),
            ),
          ]),
          const SizedBox(width: 16),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(user?.username ?? '',
                  style: const TextStyle(color: KodaColors.text1,
                      fontSize: 17, fontWeight: FontWeight.w700)),
              Text(user?.email ?? '',
                  style: const TextStyle(color: KodaColors.text3, fontSize: 12)),
              const SizedBox(height: 6),
              Row(children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                      color: KodaColors.gold.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(99),
                      border: Border.all(color: KodaColors.gold.withOpacity(0.3))),
                  child: const Text('Alpha v0.34',
                      style: TextStyle(color: KodaColors.gold, fontSize: 10)),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                      color: (_statusColors[_status] ?? KodaColors.mint).withOpacity(0.15),
                      borderRadius: BorderRadius.circular(99)),
                  child: Text(_statusLabels[_status] ?? 'Online',
                      style: TextStyle(
                          color: _statusColors[_status] ?? KodaColors.mint,
                          fontSize: 10)),
                ),
              ]),
            ]),
          ),
          TextButton.icon(
            onPressed: _startEditing,
            icon: const Icon(Icons.edit_outlined, size: 14),
            label: const Text('Edit'),
          ),
        ]),
      ),
    ]);
  }

  // -- Profile editor ---------------------------------------------------------

  Widget _buildProfileEditor(KodaUser? user) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      // Avatar
      Center(
        child: Column(children: [
          Stack(alignment: Alignment.bottomRight, children: [
            _pickedAvatarPath != null
                ? CircleAvatar(
                    radius: 36,
                    backgroundImage: FileImage(File(_pickedAvatarPath!)))
                : KodaAvatar(username: user?.username ?? '?', size: 72, avatarUrl: user?.avatarUrl),
            if (_uploadingAvatar)
              const Positioned.fill(
                child: CircleAvatar(
                  backgroundColor: Colors.black54,
                  child: SizedBox(width: 20, height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white)),
                ),
              ),
          ]),
          const SizedBox(height: 10),
          OutlinedButton.icon(
            onPressed: _uploadingAvatar ? null : _pickAvatar,
            icon: const Icon(Icons.upload_outlined, size: 14),
            label: const Text('Upload Photo'),
          ),
          const SizedBox(height: 4),
          const Text('or paste a URL below',
              style: TextStyle(color: KodaColors.text3, fontSize: 11)),
        ]),
      ),
      const SizedBox(height: 12),

      // Avatar URL input (fallback / manual)
      KodaTextField(
        controller: _avatarUrlCtrl,
        hintText: 'https://example.com/avatar.jpg',
      ),
      const SizedBox(height: 6),
      const Text('Image upload requires Cloudflare R2 — URL paste always works.',
          style: TextStyle(color: KodaColors.text3, fontSize: 11)),
      const SizedBox(height: 20),

      // Display name
      const Text('DISPLAY NAME',
          style: TextStyle(color: KodaColors.text3, fontSize: 11,
              fontWeight: FontWeight.w700, letterSpacing: 1)),
      const SizedBox(height: 8),
      KodaTextField(controller: _displayNameCtrl, hintText: 'Display name'),
      const SizedBox(height: 20),

      // Bio
      const Text('BIO',
          style: TextStyle(color: KodaColors.text3, fontSize: 11,
              fontWeight: FontWeight.w700, letterSpacing: 1)),
      const SizedBox(height: 8),
      KodaTextField(controller: _bioCtrl, hintText: 'Tell people a little about yourself'),
      const SizedBox(height: 20),

      // Status
      const Text('STATUS',
          style: TextStyle(color: KodaColors.text3, fontSize: 11,
              fontWeight: FontWeight.w700, letterSpacing: 1)),
      const SizedBox(height: 8),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: KodaColors.card,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: KodaColors.border),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            isExpanded: true,
            dropdownColor: KodaColors.card,
            value: _status,
            items: _statuses.map((s) => DropdownMenuItem(
              value: s,
              child: Row(children: [
                Container(
                  width: 10, height: 10,
                  decoration: BoxDecoration(
                      color: _statusColors[s], shape: BoxShape.circle),
                ),
                const SizedBox(width: 8),
                Text(_statusLabels[s] ?? s,
                    style: const TextStyle(color: KodaColors.text1, fontSize: 13)),
              ]),
            )).toList(),
            onChanged: (v) => setState(() => _status = v ?? 'online'),
          ),
        ),
      ),
      const SizedBox(height: 28),

      // Save / Cancel
      Row(children: [
        Expanded(
          child: OutlinedButton(
            onPressed: _savingProfile ? null : _cancelEditing,
            child: const Text('Cancel'),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ElevatedButton(
            onPressed: _savingProfile ? null : _saveProfile,
            style: ElevatedButton.styleFrom(backgroundColor: KodaColors.koda),
            child: _savingProfile
                ? const SizedBox(width: 16, height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                : const Text('Save', style: TextStyle(color: Colors.white)),
          ),
        ),
      ]),
    ]);
  }

  // -- Helpers ----------------------------------------------------------------

  Widget _shell(String title, Widget child) => SingleChildScrollView(
        padding: const EdgeInsets.all(28),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: const TextStyle(color: KodaColors.text1,
              fontSize: 20, fontWeight: FontWeight.w800)),
          const Divider(color: KodaColors.border, height: 24),
          child,
        ]),
      );

  Widget _tile(IconData icon, String title, String subtitle, VoidCallback onTap) =>
      Container(
        margin: const EdgeInsets.only(bottom: 6),
        decoration: BoxDecoration(
            color: KodaColors.card, borderRadius: BorderRadius.circular(10),
            border: Border.all(color: KodaColors.border)),
        child: ListTile(
          leading: Icon(icon, color: KodaColors.text3, size: 18),
          title: Text(title, style: const TextStyle(color: KodaColors.text1, fontSize: 13)),
          subtitle: Text(subtitle,
              style: const TextStyle(color: KodaColors.text3, fontSize: 11)),
          trailing: const Icon(Icons.chevron_right, color: KodaColors.text3, size: 18),
          onTap: onTap,
        ),
      );
}

