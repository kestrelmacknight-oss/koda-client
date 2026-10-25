// lib/features/settings/settings_screen.dart

import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show Clipboard, ClipboardData;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/accessibility_prefs.dart';
import '../../core/message_order_prefs.dart';
import '../../core/language_prefs.dart';
import '../../core/language_options.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../core/config.dart';
import '../founders/founders_hall_screen.dart';
import '../developer/developer_portal_screen.dart';
import '../steam/steam_library_manage_screen.dart';
import '../wiki/wiki_screen.dart';
import '../../core/api.dart';
import '../../core/push_notifications.dart';
import '../../core/socket.dart';
import '../../core/theme.dart';
import '../../core/platform.dart';
import '../../core/providers.dart';
import '../../core/tray_service.dart';
import '../../core/uploader.dart';
import '../../shared/glowing_username.dart';
import '../../shared/presence_status.dart';
import '../../shared/widgets.dart';
import 'content_filters_screen.dart';
import 'devices_screen.dart';
import 'totp_setup_screen.dart';
import 'voice_video_settings_screen.dart';
import '../auth/auth_screen.dart';
import '../marketplace/marketplace_screen.dart';
import '../parental/parental_dashboard_screen.dart';
import '../visp/visp_avatar.dart';
import '../../shared/tier_badge.dart';

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
  late TextEditingController _pronounsCtrl;
  late TextEditingController _customStatusCtrl;
  bool _showPronouns = false;
  String _status = 'online';
  String? _throneWebhookUrl;
  bool _loadingThroneUrl = false;
  bool _closeToTray = true;
  bool _showVispAvatar = true;
  final Map<String, Map<String, dynamic>?> _streamingStatus = {'twitch': null, 'youtube': null, 'kick': null};
  final Map<String, bool> _loadingStreaming = {'twitch': true, 'youtube': true, 'kick': true};
  final Map<String, bool> _connectingStreaming = {'twitch': false, 'youtube': false, 'kick': false};

  // Steam: a different shape from the Twitch/YouTube map above on
  // purpose -- it has two independent opt-in switches (share_presence,
  // share_library) instead of one announce_enabled toggle, so it isn't
  // forced into the same generic platform-keyed helpers.
  Map<String, dynamic>? _steamStatus;
  bool _loadingSteam = true;
  bool _connectingSteam = false;
  bool _syncingSteamLibrary = false;

  // Spotify: also its own bespoke shape, same reasoning as Steam above --
  // no announce_enabled (there's no automatic announcement at all, see
  // koda-server's Koda.Spotify moduledoc for why), just polled
  // now-playing presence.
  Map<String, dynamic>? _spotifyStatus;
  bool _loadingSpotify = true;
  bool _connectingSpotify = false;

  // Not static const -- section labels are localized, which needs a
  // BuildContext (see AppLocalizations.of(context) below).
  List<(String, IconData)> _sections(AppLocalizations t) => [
    (t.settingsSectionMyAccount, Icons.person_outline),
    (t.settingsSectionSecurity,   Icons.security_outlined),
    (t.settingsSectionAccessibility, Icons.accessibility_new_outlined),
    (t.settingsLanguageSection,   Icons.language_outlined),
    (t.settingsSectionBilling,    Icons.payments_outlined),
    (t.settingsSectionFamily,     Icons.family_restroom_outlined),
    (t.settingsSectionVoiceVideo, Icons.mic_outlined),
    (t.settingsSectionDesktop,    Icons.desktop_windows_outlined),
    (t.settingsSectionAbout,      Icons.info_outlined),
  ];

  static const _statuses = ['online', 'away', 'dnd', 'offline'];
  Map<String, String> _statusLabels(AppLocalizations t) => {
    'online':  t.statusOnline,
    'away':    t.statusAway,
    'dnd':     t.statusDnd,
    'offline': t.statusInvisible,
  };

  @override
  void initState() {
    super.initState();
    final user = ref.read(authProvider).user;
    _displayNameCtrl = TextEditingController(text: user?.username ?? '');
    _avatarUrlCtrl   = TextEditingController();
    _bioCtrl         = TextEditingController();
    _pronounsCtrl    = TextEditingController();
    _customStatusCtrl = TextEditingController();
    _status = 'online';
    if (isDesktop) {
      TrayService.instance.getCloseToTrayEnabled().then((v) {
        if (mounted) setState(() => _closeToTray = v);
      });
    }
    VispAvatarPrefs.isEnabled().then((v) {
      if (mounted) setState(() => _showVispAvatar = v);
    });
    _loadStreamingStatus('twitch');
    _loadStreamingStatus('youtube');
    _loadStreamingStatus('kick');
    _loadSteamStatus();
    _loadSpotifyStatus();
  }

  String _platformLabel(String platform) => switch (platform) {
        'twitch' => 'Twitch',
        'kick' => 'Kick',
        _ => 'YouTube',
      };

  Future<void> _loadStreamingStatus(String platform) async {
    final status = switch (platform) {
      'twitch' => await KodaApi.instance.getTwitchStatus(),
      'kick' => await KodaApi.instance.getKickStatus(),
      _ => await KodaApi.instance.getYoutubeStatus(),
    };
    if (mounted) {
      setState(() {
        _streamingStatus[platform] = status;
        _loadingStreaming[platform] = false;
      });
    }
  }

  Future<void> _connectStreaming(String platform) async {
    setState(() => _connectingStreaming[platform] = true);
    final result = switch (platform) {
      'twitch' => await KodaApi.instance.connectTwitch(),
      'kick' => await KodaApi.instance.connectKick(),
      _ => await KodaApi.instance.connectYoutube(),
    };
    if (!mounted) return;
    setState(() => _connectingStreaming[platform] = false);
    final t = AppLocalizations.of(context);
    if (result.consentRequired) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(t.settingsStreamingConsentRequired(_platformLabel(platform)))));
      return;
    }
    if (result.url == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(t.settingsStreamingConnectError(_platformLabel(platform)))));
      return;
    }
    final uri = Uri.parse(result.url!);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(
          t.settingsStreamingFinishInBrowser)));
    }
  }

  Future<void> _disconnectStreaming(String platform) async {
    final ok = switch (platform) {
      'twitch' => await KodaApi.instance.disconnectTwitch(),
      'kick' => await KodaApi.instance.disconnectKick(),
      _ => await KodaApi.instance.disconnectYoutube(),
    };
    if (ok && mounted) setState(() => _streamingStatus[platform] = null);
  }

  Future<void> _setStreamingAnnounceEnabled(String platform, bool enabled) async {
    final previous = _streamingStatus[platform];
    setState(() => _streamingStatus[platform] =
        {...?_streamingStatus[platform], 'announce_enabled': enabled});
    final ok = switch (platform) {
      'twitch' => await KodaApi.instance.setTwitchAnnounceEnabled(enabled),
      'kick' => await KodaApi.instance.setKickAnnounceEnabled(enabled),
      _ => await KodaApi.instance.setYoutubeAnnounceEnabled(enabled),
    };
    if (!ok && mounted) setState(() => _streamingStatus[platform] = previous);
  }

  Future<void> _loadSteamStatus() async {
    final status = await KodaApi.instance.getSteamStatus();
    if (mounted) setState(() { _steamStatus = status; _loadingSteam = false; });
  }

  Future<void> _connectSteam() async {
    setState(() => _connectingSteam = true);
    final result = await KodaApi.instance.connectSteam();
    if (!mounted) return;
    setState(() => _connectingSteam = false);
    final t = AppLocalizations.of(context);
    if (result.consentRequired) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(t.settingsStreamingConsentRequired('Steam'))));
      return;
    }
    if (result.url == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(t.settingsStreamingConnectError('Steam'))));
      return;
    }
    final uri = Uri.parse(result.url!);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(
          t.settingsStreamingFinishInBrowser)));
    }
  }

  Future<void> _disconnectSteam() async {
    final ok = await KodaApi.instance.disconnectSteam();
    if (ok && mounted) setState(() => _steamStatus = null);
  }

  // Two independent setters -- neither ever touches the other's flag,
  // on the server or here, matching the "separate opt-in" requirement.
  Future<void> _setSteamPresenceSharing(bool enabled) async {
    final previous = _steamStatus;
    setState(() => _steamStatus = {...?_steamStatus, 'share_presence': enabled});
    final ok = await KodaApi.instance.setSteamPresenceSharing(enabled);
    if (!ok && mounted) setState(() => _steamStatus = previous);
  }

  Future<void> _setSteamLibrarySharing(bool enabled) async {
    final previous = _steamStatus;
    setState(() => _steamStatus = {...?_steamStatus, 'share_library': enabled});
    final ok = await KodaApi.instance.setSteamLibrarySharing(enabled);
    if (!ok && mounted) setState(() => _steamStatus = previous);
  }

  Future<void> _syncSteamLibraryNow() async {
    setState(() => _syncingSteamLibrary = true);
    final ok = await KodaApi.instance.syncSteamLibraryNow();
    if (ok) await _loadSteamStatus();
    if (!mounted) return;
    setState(() => _syncingSteamLibrary = false);
    final t = AppLocalizations.of(context);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(
        ok ? t.steamSyncSuccess : t.steamSyncError)));
  }

  Future<void> _loadSpotifyStatus() async {
    final status = await KodaApi.instance.getSpotifyStatus();
    if (mounted) setState(() { _spotifyStatus = status; _loadingSpotify = false; });
  }

  Future<void> _connectSpotify() async {
    setState(() => _connectingSpotify = true);
    final result = await KodaApi.instance.connectSpotify();
    if (!mounted) return;
    setState(() => _connectingSpotify = false);
    final t = AppLocalizations.of(context);
    if (result.consentRequired) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(t.settingsStreamingConsentRequired('Spotify'))));
      return;
    }
    if (result.url == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(t.settingsStreamingConnectError('Spotify'))));
      return;
    }
    final uri = Uri.parse(result.url!);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(
          t.settingsStreamingFinishInBrowser)));
    }
  }

  Future<void> _disconnectSpotify() async {
    final ok = await KodaApi.instance.disconnectSpotify();
    if (ok && mounted) setState(() => _spotifyStatus = null);
  }

  @override
  void dispose() {
    _displayNameCtrl.dispose();
    _avatarUrlCtrl.dispose();
    _bioCtrl.dispose();
    _pronounsCtrl.dispose();
    _customStatusCtrl.dispose();
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
    if (_pronounsCtrl.text.trim().isNotEmpty) {
      data['pronouns'] = _pronounsCtrl.text.trim();
    }
    if (_customStatusCtrl.text.trim().isNotEmpty) {
      data['custom_status'] = _customStatusCtrl.text.trim();
    }
    data['status'] = _status;

    await KodaApi.instance.updateProfile(
      displayName:  data['display_name'],
      avatarUrl:    data['avatar_url'],
      bio:          data['bio'],
      pronouns:     data['pronouns'],
      showPronouns: _showPronouns,
      status:       _status,
      customStatus: data['custom_status'],
    );

    if (mounted) setState(() { _editingProfile = false; _savingProfile = false; });
  }

  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  Future<void> _signOut() async {
    KodaSocket.instance.disconnect();
    // Before the token is cleared below -- unregistering needs auth.
    await PushNotifications.instance.unregister();
    await KodaApi.instance.logout();
    ref.read(authProvider.notifier).clear();
    if (mounted) {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (_) => const AuthScreen()), (route) => false);
    }
  }

  /// Self-service "right to deletion" -- re-confirms the account's own
  /// password server-side before scrubbing personal information (see
  /// koda-server's Koda.Auth.delete_account/1). A parent/guardian
  /// deletes a child's account instead from the Parental Dashboard,
  /// which never needs the child's password (see child_detail_screen.dart).
  Future<void> _confirmDeleteAccount() async {
    final t = AppLocalizations.of(context);
    final passwordCtrl = TextEditingController();
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: Text(t.settingsDeleteAccountTitle, style: TextStyle(color: KodaColors.text1)),
        content: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(t.settingsDeleteAccountWarning, style: TextStyle(color: KodaColors.text3, fontSize: 12, height: 1.4)),
          const SizedBox(height: 14),
          KodaTextField(controller: passwordCtrl, hintText: t.settingsDeleteAccountPasswordHint, obscureText: true),
        ]),
        actions: [
          TextButton(onPressed: () => Navigator.pop(dialogContext, false), child: Text(t.commonCancel)),
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: Text(t.settingsDeleteAccountConfirm, style: TextStyle(color: KodaColors.accent)),
          ),
        ],
      ),
    );
    if (confirmed != true || !mounted) return;
    if (passwordCtrl.text.isEmpty) return;

    final error = await KodaApi.instance.deleteAccount(passwordCtrl.text);
    if (!mounted) return;
    if (error == null) {
      ref.read(authProvider.notifier).clear();
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (_) => const AuthScreen()), (route) => false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(
          error == 'invalid' ? t.settingsDeleteAccountWrongPassword : t.commonActionFailed)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authProvider).user;
    final t = AppLocalizations.of(context);
    final sections = _sections(t);

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
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: KodaColors.border))),
                child: Row(children: [
                  Text(t.settingsTitle,
                      style: TextStyle(color: KodaColors.text1, fontWeight: FontWeight.w700)),
                  const Spacer(),
                  IconButton(
                      icon: Icon(Icons.close, size: 18, color: KodaColors.text3),
                      tooltip: t.commonClose,
                      onPressed: () => Navigator.pop(context)),
                ]),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  itemCount: sections.length,
                  itemBuilder: (_, i) {
                    final (label, icon) = sections[i];
                    final selected = i == _section;
                    return ListTile(
                      dense: true,
                      leading: Icon(icon, size: 16,
                          color: selected ? KodaColors.koda : KodaColors.text3),
                      title: Text(label, style: TextStyle(
                          fontSize: 13,
                          color: selected ? KodaColors.text1 : KodaColors.text3)),
                      selected: selected,
                      selectedTileColor: KodaColors.koda.withValues(alpha: 0.12),
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
                  icon: Icon(Icons.logout, size: 14, color: KodaColors.accent),
                  label: Text(t.settingsSignOut,
                      style: TextStyle(color: KodaColors.accent, fontSize: 12)),
                  onPressed: _signOut,
                  style: OutlinedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 36),
                      side: BorderSide(color: KodaColors.accent, width: 0.5)),
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
    final t = AppLocalizations.of(context);
    switch (index) {
      case 0:
        return _shell(t.settingsSectionMyAccount, _editingProfile
            ? _buildProfileEditor(user)
            : _buildProfileView(user));
      case 1:
        final currentUser = ref.watch(authProvider).user;
        final friendsOnlyDms = currentUser?.friendsOnlyDms ?? false;
        return _shell(t.settingsSectionSecurity, Column(children: [
          _tile(Icons.phone_android_outlined, t.settingsTwoFactorTitle,
              t.settingsTwoFactorSubtitle,
              () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const TotpSetupScreen()))),
          _tile(Icons.devices_outlined, t.settingsLinkedDevicesTitle,
              t.settingsLinkedDevicesSubtitle,
              () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const DevicesScreen()))),
          // Child accounts have labeled channels hard-blocked server-side
          // and don't get a personal filter preference to configure --
          // see content_filters_screen.dart's doc comment.
          if (currentUser != null && !currentUser.isChild)
            _tile(Icons.visibility_off_outlined, t.settingsContentFiltersTitle,
                t.settingsContentFiltersSubtitle,
                () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const ContentFiltersScreen()))),
          Container(
            margin: const EdgeInsets.only(bottom: 6),
            decoration: BoxDecoration(
                color: KodaColors.card, borderRadius: BorderRadius.circular(10),
                border: Border.all(color: KodaColors.border)),
            child: SwitchListTile(
              secondary: Icon(Icons.mail_lock_outlined, color: KodaColors.text3, size: 18),
              title: Text(t.settingsDmFriendsOnlyTitle,
                  style: TextStyle(color: KodaColors.text1, fontSize: 13)),
              subtitle: Text(t.settingsDmFriendsOnlySubtitle,
                  style: TextStyle(color: KodaColors.text3, fontSize: 11)),
              activeThumbColor: KodaColors.koda,
              value: friendsOnlyDms,
              onChanged: (v) async {
                ref.read(authProvider.notifier).setFriendsOnlyDms(v);
                final ok = await KodaApi.instance.updateDmPrivacy(v);
                if (!ok) {
                  ref.read(authProvider.notifier).setFriendsOnlyDms(!v);
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(t.settingsDmPrivacyError)));
                  }
                }
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 6),
            decoration: BoxDecoration(
                color: KodaColors.card, borderRadius: BorderRadius.circular(10),
                border: Border.all(color: KodaColors.border)),
            child: SwitchListTile(
              secondary: Icon(Icons.auto_awesome, color: KodaColors.text3, size: 18),
              title: Text(t.settingsShowVispAvatarTitle,
                  style: TextStyle(color: KodaColors.text1, fontSize: 13)),
              subtitle: Text(t.settingsShowVispAvatarSubtitle,
                  style: TextStyle(color: KodaColors.text3, fontSize: 11)),
              activeThumbColor: KodaColors.koda,
              value: _showVispAvatar,
              onChanged: (v) async {
                setState(() => _showVispAvatar = v);
                await VispAvatarPrefs.setEnabled(v);
              },
            ),
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.only(bottom: 6),
            decoration: BoxDecoration(
                color: KodaColors.card, borderRadius: BorderRadius.circular(10),
                border: Border.all(color: KodaColors.accent.withValues(alpha: 0.4))),
            child: ListTile(
              leading: Icon(Icons.delete_forever_outlined, color: KodaColors.accent, size: 18),
              title: Text(t.settingsDeleteAccountTitle,
                  style: TextStyle(color: KodaColors.accent, fontSize: 13)),
              subtitle: Text(t.settingsDeleteAccountSubtitle,
                  style: TextStyle(color: KodaColors.text3, fontSize: 11)),
              onTap: _confirmDeleteAccount,
            ),
          ),
        ]));
      case 2:
        return _buildAccessibilitySection();
      case 3:
        return _buildLanguageSection();
      case 4:
        // Account-level only -- Server Bank/Digital Goods/Merch/Revenue
        // are all server-scoped (see MarketplaceScreen.accountOnly's doc
        // comment) and belong on the relevant server instead, not here.
        return const MarketplaceScreen(embedded: true, accountOnly: true);
      case 5:
        if (user?.isChild == true) {
          return _shell(t.settingsSectionFamily, Text(
              t.settingsFamilyNotAvailable,
              style: TextStyle(color: KodaColors.text3, fontSize: 13)));
        }
        return const ParentalDashboardScreen(embedded: true);
      case 6:
        return const VoiceVideoSettingsScreen();
      case 7:
        return _buildDesktopSection();
      case 8:
        return _shell(t.settingsAboutTitle, Column(crossAxisAlignment: CrossAxisAlignment.start,
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
                    gradient: LinearGradient(
                        colors: [KodaColors.koda, KodaColors.mint],
                        begin: Alignment.topLeft, end: Alignment.bottomRight),
                    borderRadius: BorderRadius.circular(12)),
                child: const Center(child: Text('K', style: TextStyle(
                    fontSize: 24, fontWeight: FontWeight.w800, color: Colors.white))),
              ),
              const SizedBox(width: 16),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(KodaConfig.appName, style: TextStyle(
                    color: KodaColors.text1, fontWeight: FontWeight.w700)),
                Text(t.settingsAboutBuildLabel(KodaConfig.buildLabel, KodaConfig.appVersion),
                    style: TextStyle(color: KodaColors.gold, fontSize: 12)),
                Text(KodaConfig.company,
                    style: TextStyle(color: KodaColors.text3, fontSize: 11)),
              ]),
            ]),
          ),
          const SizedBox(height: 20),
          _tile(Icons.auto_awesome_outlined, t.settingsFoundersHallTitle, t.settingsFoundersHallSubtitle,
              () => Navigator.push(context, MaterialPageRoute(builder: (_) => const FoundersHallScreen()))),
          _tile(Icons.menu_book_outlined, t.settingsWikiTitle, t.settingsWikiSubtitle,
              () => Navigator.push(context, MaterialPageRoute(builder: (_) => const WikiScreen()))),
          _tile(Icons.terminal_outlined, t.settingsDeveloperPortalTitle, t.settingsDeveloperPortalSubtitle,
              () => Navigator.push(context, MaterialPageRoute(builder: (_) => const DeveloperPortalScreen()))),
          _tile(Icons.gavel_outlined, t.settingsTermsTitle, 'koda.fyi/terms.html',
              () => _openUrl(KodaConfig.termsUrl)),
          _tile(Icons.privacy_tip_outlined, t.settingsPrivacyTitle, 'koda.fyi/privacy.html',
              () => _openUrl(KodaConfig.privacyUrl)),
          _tile(Icons.support_agent_outlined, t.settingsSupportTitle, KodaConfig.supportEmail,
              () => _openUrl('mailto:${KodaConfig.supportEmail}')),
          _tile(Icons.security_outlined, t.settingsReportSecurityTitle, KodaConfig.securityEmail,
              () => _openUrl('mailto:${KodaConfig.securityEmail}')),
        ]));
      default:
        return const SizedBox();
    }
  }

  Widget _buildDesktopSection() {
    final t = AppLocalizations.of(context);
    if (!isDesktop) {
      return _shell(t.settingsSectionDesktop, Text(
          t.settingsDesktopNotAvailable,
          style: TextStyle(color: KodaColors.text3, fontSize: 13)));
    }
    return _shell(t.settingsSectionDesktop, Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        decoration: BoxDecoration(
            color: KodaColors.card, borderRadius: BorderRadius.circular(10),
            border: Border.all(color: KodaColors.border)),
        child: SwitchListTile(
          secondary: Icon(Icons.close_fullscreen_outlined, color: KodaColors.text3, size: 18),
          title: Text(t.settingsCloseToTrayTitle,
              style: TextStyle(color: KodaColors.text1, fontSize: 13)),
          subtitle: Text(t.settingsCloseToTraySubtitle,
              style: TextStyle(color: KodaColors.text3, fontSize: 11)),
          activeThumbColor: KodaColors.koda,
          value: _closeToTray,
          onChanged: (v) async {
            setState(() => _closeToTray = v);
            await TrayService.instance.setCloseToTrayEnabled(v);
          },
        ),
      ),
    ]));
  }

  Widget _buildAccessibilitySection() {
    final a11y = ref.watch(accessibilityPrefsProvider);
    final notifier = ref.read(accessibilityPrefsProvider.notifier);
    final messageOrder = ref.watch(messageOrderPrefsProvider);
    final messageOrderNotifier = ref.read(messageOrderPrefsProvider.notifier);
    final t = AppLocalizations.of(context);

    return _shell(t.settingsSectionAccessibility, Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        margin: const EdgeInsets.only(bottom: 6),
        decoration: BoxDecoration(
            color: KodaColors.card, borderRadius: BorderRadius.circular(10),
            border: Border.all(color: KodaColors.border)),
        child: SwitchListTile(
          secondary: Icon(Icons.contrast_outlined, color: KodaColors.text3, size: 18),
          title: Text(t.settingsHighContrastTitle,
              style: TextStyle(color: KodaColors.text1, fontSize: 13)),
          subtitle: Text(t.settingsHighContrastSubtitle,
              style: TextStyle(color: KodaColors.text3, fontSize: 11)),
          activeThumbColor: KodaColors.koda,
          value: a11y.highContrast,
          onChanged: notifier.setHighContrast,
        ),
      ),
      Container(
        margin: const EdgeInsets.only(bottom: 6),
        decoration: BoxDecoration(
            color: KodaColors.card, borderRadius: BorderRadius.circular(10),
            border: Border.all(color: KodaColors.border)),
        child: SwitchListTile(
          secondary: Icon(Icons.font_download_outlined, color: KodaColors.text3, size: 18),
          title: Text(t.settingsDyslexiaFontTitle,
              style: TextStyle(color: KodaColors.text1, fontSize: 13)),
          subtitle: Text(t.settingsDyslexiaFontSubtitle,
              style: TextStyle(color: KodaColors.text3, fontSize: 11)),
          activeThumbColor: KodaColors.koda,
          value: a11y.dyslexiaFont,
          onChanged: notifier.setDyslexiaFont,
        ),
      ),
      Container(
        margin: const EdgeInsets.only(bottom: 6),
        decoration: BoxDecoration(
            color: KodaColors.card, borderRadius: BorderRadius.circular(10),
            border: Border.all(color: KodaColors.border)),
        child: SwitchListTile(
          secondary: Icon(Icons.vertical_align_top, color: KodaColors.text3, size: 18),
          title: Text(t.settingsNewestAtTopTitle,
              style: TextStyle(color: KodaColors.text1, fontSize: 13)),
          subtitle: Text(t.settingsNewestAtTopSubtitle,
              style: TextStyle(color: KodaColors.text3, fontSize: 11)),
          activeThumbColor: KodaColors.koda,
          value: messageOrder.newestAtTop,
          onChanged: messageOrderNotifier.setNewestAtTop,
        ),
      ),
      Container(
        margin: const EdgeInsets.only(bottom: 6),
        padding: const EdgeInsets.fromLTRB(14, 10, 14, 4),
        decoration: BoxDecoration(
            color: KodaColors.card, borderRadius: BorderRadius.circular(10),
            border: Border.all(color: KodaColors.border)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Icon(Icons.text_fields, color: KodaColors.text3, size: 18),
            SizedBox(width: 10),
            Text(t.settingsFontSizeTitle, style: TextStyle(color: KodaColors.text1, fontSize: 13)),
          ]),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(t.settingsFontSizeSample,
                style: TextStyle(color: KodaColors.text2, fontSize: 14 * a11y.textScale)),
          ),
          Slider(
            value: a11y.textScale,
            min: 0.85,
            max: 1.6,
            divisions: 15,
            activeColor: KodaColors.koda,
            label: '${(a11y.textScale * 100).round()}%',
            onChanged: notifier.setTextScale,
          ),
        ]),
      ),
      Container(
        margin: const EdgeInsets.only(bottom: 6),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
            color: KodaColors.card, borderRadius: BorderRadius.circular(10),
            border: Border.all(color: KodaColors.border)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Icon(Icons.density_medium, color: KodaColors.text3, size: 18),
            SizedBox(width: 10),
            Text(t.settingsDensityTitle, style: TextStyle(color: KodaColors.text1, fontSize: 13)),
          ]),
          const SizedBox(height: 4),
          Text(t.settingsDensityDescription,
              style: TextStyle(color: KodaColors.text3, fontSize: 11)),
          const SizedBox(height: 12),
          SegmentedButton<String>(
            segments: [
              ButtonSegment(value: 'compact', label: Text(t.settingsDensityCompact)),
              ButtonSegment(value: 'standard', label: Text(t.settingsDensityStandard)),
              ButtonSegment(value: 'comfortable', label: Text(t.settingsDensityComfortable)),
            ],
            selected: {a11y.density},
            onSelectionChanged: (s) => notifier.setDensity(s.first),
          ),
          const SizedBox(height: 4),
        ]),
      ),
    ]));
  }

  Widget _buildLanguageSection() {
    final languagePrefs = ref.watch(languagePrefsProvider);
    final notifier = ref.read(languagePrefsProvider.notifier);

    final t = AppLocalizations.of(context);
    return _shell(t.settingsLanguageSection, Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
            color: KodaColors.card, borderRadius: BorderRadius.circular(10),
            border: Border.all(color: KodaColors.border)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(t.settingsLanguageTitle, style: TextStyle(
              color: KodaColors.text1, fontSize: 13, fontWeight: FontWeight.w600)),
          Text(t.settingsLanguageDescription,
              style: TextStyle(color: KodaColors.text3, fontSize: 11)),
          const SizedBox(height: 10),
          DropdownButton<String?>(
            value: languagePrefs.uiLocale,
            dropdownColor: KodaColors.card,
            style: TextStyle(color: KodaColors.text1, fontSize: 13),
            onChanged: notifier.setUiLocale,
            items: [
              DropdownMenuItem(value: null, child: Text(t.settingsLanguageSystemDefault)),
              ...kodaLanguageOptions.map((l) => DropdownMenuItem(
                    value: l.code,
                    child: Text(l.nativeName),
                  )),
            ],
          ),
        ]),
      ),
    ]));
  }

  // -- Profile view (read-only) -----------------------------------------------

  Widget _buildProfileView(KodaUser? user) {
    final t = AppLocalizations.of(context);
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: KodaColors.card, borderRadius: BorderRadius.circular(12),
            border: Border.all(color: KodaColors.border)),
        child: Row(children: [
          Stack(children: [
            KodaAvatar(username: user?.username ?? '?', size: 64, avatarUrl: user?.avatarUrl,
                tier: user?.kodaTier, ownedFrames: user?.ownedFrames ?? const []),
            Positioned(
              bottom: 0, right: 0,
              child: Container(
                width: 16, height: 16,
                decoration: BoxDecoration(
                    color: statusColor(_status),
                    shape: BoxShape.circle,
                    border: Border.all(color: KodaColors.card, width: 2)),
              ),
            ),
          ]),
          const SizedBox(width: 16),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                GlowingUsername(
                    glows: user?.glows ?? const [],
                    child: Text(user?.username ?? '',
                        style: TextStyle(color: KodaColors.text1,
                            fontSize: 17, fontWeight: FontWeight.w700))),
                if (user != null && (user.kodaTier != 'free' || user.badges.isNotEmpty)) ...[
                  const SizedBox(width: 6),
                  TierBadge(tier: user.kodaTier, size: 15, rewardBadges: user.badges),
                ],
              ]),
              Text(user?.email ?? '',
                  style: TextStyle(color: KodaColors.text3, fontSize: 12)),
              const SizedBox(height: 6),
              Row(children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                      color: KodaColors.gold.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(99),
                      border: Border.all(color: KodaColors.gold.withValues(alpha: 0.3))),
                  child: Text(t.settingsAboutBuildLabel(KodaConfig.buildLabel, KodaConfig.appVersion),
                      style: TextStyle(color: KodaColors.gold, fontSize: 10)),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                      color: statusColor(_status).withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(99)),
                  child: Text(_statusLabels(t)[_status] ?? t.statusOnline,
                      style: TextStyle(
                          color: statusColor(_status),
                          fontSize: 10)),
                ),
              ]),
            ]),
          ),
          TextButton.icon(
            onPressed: _startEditing,
            icon: const Icon(Icons.edit_outlined, size: 14),
            label: Text(t.commonEdit),
          ),
        ]),
      ),
      const SizedBox(height: 16),
      _buildThroneCard(),
      const SizedBox(height: 16),
      _buildStreamingCard(),
      const SizedBox(height: 16),
      _buildSteamCard(),
      const SizedBox(height: 16),
      _buildSpotifyCard(),
    ]);
  }

  Widget _buildStreamingCard() {
    final t = AppLocalizations.of(context);
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: KodaColors.card, borderRadius: BorderRadius.circular(12),
          border: Border.all(color: KodaColors.border)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Icon(Icons.live_tv_outlined, size: 16, color: KodaColors.accent),
          SizedBox(width: 8),
          Text(t.settingsStreamingTitle,
              style: TextStyle(color: KodaColors.text1, fontSize: 14, fontWeight: FontWeight.w600)),
        ]),
        const SizedBox(height: 6),
        Text(t.settingsStreamingDescription,
            style: TextStyle(color: KodaColors.text3, fontSize: 11)),
        const SizedBox(height: 12),
        _buildStreamingRow('twitch'),
        Divider(color: KodaColors.border, height: 24),
        _buildStreamingRow('youtube'),
        Divider(color: KodaColors.border, height: 24),
        _buildStreamingRow('kick'),
      ]),
    );
  }

  Widget _buildStreamingRow(String platform) {
    final t = AppLocalizations.of(context);
    if (_loadingStreaming[platform] == true) {
      return Center(child: SizedBox(width: 18, height: 18,
          child: CircularProgressIndicator(strokeWidth: 2, color: KodaColors.koda)));
    }
    final status = _streamingStatus[platform];
    final connected = status?['connected'] == true;
    final connecting = _connectingStreaming[platform] == true;
    final label = _platformLabel(platform);
    final liveSuffix = switch (platform) {
      'twitch' => t.settingsStreamingLiveSuffixTwitch,
      'kick' => t.settingsStreamingLiveSuffixKick,
      _ => t.settingsStreamingLiveSuffixYoutube,
    };

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [
        Icon(connected ? Icons.check_circle : Icons.circle_outlined,
            size: 16, color: connected ? KodaColors.mint : KodaColors.text3),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
              connected
                  ? t.settingsStreamingConnected(label, status?['external_username'] ?? '',
                      status?['is_live'] == true ? liveSuffix : '')
                  : t.settingsStreamingNotConnected(label),
              style: TextStyle(color: KodaColors.text1, fontSize: 13)),
        ),
        if (connected)
          TextButton(onPressed: () => _disconnectStreaming(platform), child: Text(t.commonDisconnect))
        else
          TextButton.icon(
            icon: connecting
                ? SizedBox(width: 12, height: 12,
                    child: CircularProgressIndicator(strokeWidth: 2, color: KodaColors.koda))
                : const Icon(Icons.link, size: 14),
            label: Text(connecting ? t.settingsStreamingConnecting : t.settingsStreamingConnect),
            onPressed: connecting ? null : () => _connectStreaming(platform),
          ),
      ]),
      if (connected)
        CheckboxListTile(
          dense: true,
          contentPadding: EdgeInsets.zero,
          controlAffinity: ListTileControlAffinity.leading,
          title: Text(switch (platform) {
            'twitch' => t.settingsAnnounceLiveTwitch,
            'kick' => t.settingsAnnounceLiveKick,
            _ => t.settingsAnnounceLiveYoutube,
          }, style: TextStyle(color: KodaColors.text1, fontSize: 13)),
          value: status?['announce_enabled'] == true,
          activeColor: KodaColors.koda,
          onChanged: (v) => _setStreamingAnnounceEnabled(platform, v ?? true),
        )
      else
        TextButton(
          onPressed: () => _loadStreamingStatus(platform),
          child: Text(t.settingsRefreshStatus,
              style: TextStyle(color: KodaColors.text3, fontSize: 11)),
        ),
    ]);
  }

  Widget _buildSteamCard() {
    final t = AppLocalizations.of(context);
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: KodaColors.card, borderRadius: BorderRadius.circular(12),
          border: Border.all(color: KodaColors.border)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Icon(Icons.sports_esports_outlined, size: 16, color: KodaColors.accent),
          const SizedBox(width: 8),
          Text(t.settingsSteamTitle,
              style: TextStyle(color: KodaColors.text1, fontSize: 14, fontWeight: FontWeight.w600)),
        ]),
        const SizedBox(height: 6),
        Text(t.settingsSteamDescription,
            style: TextStyle(color: KodaColors.text3, fontSize: 11)),
        const SizedBox(height: 12),
        if (_loadingSteam)
          Center(child: SizedBox(width: 18, height: 18,
              child: CircularProgressIndicator(strokeWidth: 2, color: KodaColors.koda)))
        else ...[
          Row(children: [
            Icon(_steamStatus?['connected'] == true ? Icons.check_circle : Icons.circle_outlined,
                size: 16, color: _steamStatus?['connected'] == true ? KodaColors.mint : KodaColors.text3),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                  _steamStatus?['connected'] == true
                      ? t.settingsSteamConnected(_steamStatus?['persona_name'] ?? '')
                      : t.settingsSteamNotConnected,
                  style: TextStyle(color: KodaColors.text1, fontSize: 13)),
            ),
            if (_steamStatus?['connected'] == true)
              TextButton(onPressed: _disconnectSteam, child: Text(t.commonDisconnect))
            else
              TextButton.icon(
                icon: _connectingSteam
                    ? SizedBox(width: 12, height: 12,
                        child: CircularProgressIndicator(strokeWidth: 2, color: KodaColors.koda))
                    : const Icon(Icons.link, size: 14),
                label: Text(_connectingSteam ? t.settingsStreamingConnecting : t.settingsStreamingConnect),
                onPressed: _connectingSteam ? null : _connectSteam,
              ),
          ]),
          if (_steamStatus?['connected'] == true) ...[
            // Two fully independent switches -- enabling one never
            // enables or implies the other, both server- and client-side.
            SwitchListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              title: Text(t.settingsSteamSharePresence,
                  style: TextStyle(color: KodaColors.text1, fontSize: 13)),
              subtitle: Text(t.settingsSteamSharePresenceSubtitle,
                  style: TextStyle(color: KodaColors.text3, fontSize: 11)),
              value: _steamStatus?['share_presence'] == true,
              activeColor: KodaColors.koda,
              onChanged: _setSteamPresenceSharing,
            ),
            SwitchListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              title: Text(t.settingsSteamShareLibrary,
                  style: TextStyle(color: KodaColors.text1, fontSize: 13)),
              subtitle: Text(t.settingsSteamShareLibrarySubtitle,
                  style: TextStyle(color: KodaColors.text3, fontSize: 11)),
              value: _steamStatus?['share_library'] == true,
              activeColor: KodaColors.koda,
              onChanged: _setSteamLibrarySharing,
            ),
            const SizedBox(height: 4),
            Row(children: [
              TextButton.icon(
                icon: _syncingSteamLibrary
                    ? SizedBox(width: 12, height: 12,
                        child: CircularProgressIndicator(strokeWidth: 2, color: KodaColors.koda))
                    : const Icon(Icons.sync, size: 14),
                label: Text(t.steamSyncNow),
                onPressed: _syncingSteamLibrary ? null : _syncSteamLibraryNow,
              ),
              const Spacer(),
              TextButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(
                    builder: (_) => const SteamLibraryManageScreen())),
                child: Text(t.steamManageLibraryTitle),
              ),
            ]),
          ] else
            TextButton(
              onPressed: _loadSteamStatus,
              child: Text(t.settingsRefreshStatus,
                  style: TextStyle(color: KodaColors.text3, fontSize: 11)),
            ),
        ],
      ]),
    );
  }

  Widget _buildSpotifyCard() {
    final t = AppLocalizations.of(context);
    final connected = _spotifyStatus?['connected'] == true;
    final isListening = _spotifyStatus?['is_listening'] == true;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: KodaColors.card, borderRadius: BorderRadius.circular(12),
          border: Border.all(color: KodaColors.border)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Icon(Icons.music_note_outlined, size: 16, color: KodaColors.accent),
          const SizedBox(width: 8),
          Text(t.settingsSpotifyTitle,
              style: TextStyle(color: KodaColors.text1, fontSize: 14, fontWeight: FontWeight.w600)),
        ]),
        const SizedBox(height: 6),
        Text(t.settingsSpotifyDescription,
            style: TextStyle(color: KodaColors.text3, fontSize: 11)),
        const SizedBox(height: 12),
        if (_loadingSpotify)
          Center(child: SizedBox(width: 18, height: 18,
              child: CircularProgressIndicator(strokeWidth: 2, color: KodaColors.koda)))
        else ...[
          Row(children: [
            Icon(connected ? Icons.check_circle : Icons.circle_outlined,
                size: 16, color: connected ? KodaColors.mint : KodaColors.text3),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                  connected
                      ? t.settingsSpotifyConnected(_spotifyStatus?['external_username'] ?? '')
                      : t.settingsSpotifyNotConnected,
                  style: TextStyle(color: KodaColors.text1, fontSize: 13)),
            ),
            if (connected)
              TextButton(onPressed: _disconnectSpotify, child: Text(t.commonDisconnect))
            else
              TextButton.icon(
                icon: _connectingSpotify
                    ? SizedBox(width: 12, height: 12,
                        child: CircularProgressIndicator(strokeWidth: 2, color: KodaColors.koda))
                    : const Icon(Icons.link, size: 14),
                label: Text(_connectingSpotify ? t.settingsStreamingConnecting : t.settingsStreamingConnect),
                onPressed: _connectingSpotify ? null : _connectSpotify,
              ),
          ]),
          if (connected && isListening) ...[
            const SizedBox(height: 10),
            Row(children: [
              if ((_spotifyStatus?['album_art_url'] as String?) != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.network(_spotifyStatus!['album_art_url'] as String,
                      width: 36, height: 36, fit: BoxFit.cover),
                ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                    t.settingsSpotifyNowPlaying(
                        _spotifyStatus?['track_name'] ?? '', _spotifyStatus?['artist_name'] ?? ''),
                    style: TextStyle(color: KodaColors.text2, fontSize: 12),
                    overflow: TextOverflow.ellipsis),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(t.settingsSpotifyShareHint,
                  style: TextStyle(color: KodaColors.text3, fontSize: 10, fontStyle: FontStyle.italic)),
            ),
          ] else if (connected)
            TextButton(
              onPressed: _loadSpotifyStatus,
              child: Text(t.settingsRefreshStatus,
                  style: TextStyle(color: KodaColors.text3, fontSize: 11)),
            ),
        ],
      ]),
    );
  }

  Widget _buildThroneCard() {
    final t = AppLocalizations.of(context);
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: KodaColors.card, borderRadius: BorderRadius.circular(12),
          border: Border.all(color: KodaColors.border)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Icon(Icons.card_giftcard_outlined, size: 16, color: KodaColors.gold),
          SizedBox(width: 8),
          Text(t.settingsThroneTitle,
              style: TextStyle(color: KodaColors.text1, fontSize: 14, fontWeight: FontWeight.w600)),
        ]),
        const SizedBox(height: 6),
        Text(t.settingsThroneDescription,
            style: TextStyle(color: KodaColors.text3, fontSize: 11)),
        const SizedBox(height: 12),
        if (_loadingThroneUrl)
          Center(child: SizedBox(width: 18, height: 18,
              child: CircularProgressIndicator(strokeWidth: 2, color: KodaColors.koda)))
        else if (_throneWebhookUrl == null)
          TextButton(onPressed: _loadThroneWebhookUrl, child: Text(t.settingsThroneGetUrl))
        else
          Row(children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                    color: KodaColors.elevated, borderRadius: BorderRadius.circular(8)),
                child: Text(_throneWebhookUrl!,
                    style: TextStyle(color: KodaColors.text2, fontSize: 11),
                    overflow: TextOverflow.ellipsis),
              ),
            ),
            IconButton(
              icon: Icon(Icons.copy, size: 16, color: KodaColors.text3),
              tooltip: t.settingsThroneCopyTooltip,
              onPressed: () {
                Clipboard.setData(ClipboardData(text: _throneWebhookUrl!));
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(t.settingsThroneCopiedToast)));
              },
            ),
            IconButton(
              icon: Icon(Icons.refresh, size: 16, color: KodaColors.text3),
              tooltip: t.settingsThroneRegenerateTooltip,
              onPressed: _regenerateThroneWebhookUrl,
            ),
          ]),
      ]),
    );
  }

  Future<void> _loadThroneWebhookUrl() async {
    setState(() => _loadingThroneUrl = true);
    final url = await KodaApi.instance.getThroneWebhookUrl();
    if (mounted) setState(() { _throneWebhookUrl = url; _loadingThroneUrl = false; });
  }

  Future<void> _regenerateThroneWebhookUrl() async {
    final t = AppLocalizations.of(context);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: Text(t.settingsThroneRegenerateConfirmTitle,
            style: TextStyle(color: KodaColors.text1)),
        content: Text(
            t.settingsThroneRegenerateConfirmBody,
            style: TextStyle(color: KodaColors.text3)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: Text(t.commonCancel)),
          TextButton(onPressed: () => Navigator.pop(context, true), child: Text(t.settingsThroneRegenerate)),
        ],
      ),
    );
    if (confirmed != true) return;
    setState(() => _loadingThroneUrl = true);
    final url = await KodaApi.instance.regenerateThroneWebhookUrl();
    if (mounted) setState(() { _throneWebhookUrl = url; _loadingThroneUrl = false; });
  }

  // -- Profile editor ---------------------------------------------------------

  Widget _buildProfileEditor(KodaUser? user) {
    final t = AppLocalizations.of(context);
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
            label: Text(t.settingsUploadPhoto),
          ),
          const SizedBox(height: 4),
          Text(t.settingsOrPasteUrl,
              style: TextStyle(color: KodaColors.text3, fontSize: 11)),
        ]),
      ),
      const SizedBox(height: 12),

      // Avatar URL input (fallback / manual)
      KodaTextField(
        controller: _avatarUrlCtrl,
        hintText: t.settingsAvatarUrlHint,
      ),
      const SizedBox(height: 6),
      Text(t.settingsAvatarUploadNote,
          style: TextStyle(color: KodaColors.text3, fontSize: 11)),
      const SizedBox(height: 20),

      // Display name
      Text(t.settingsDisplayNameLabel,
          style: TextStyle(color: KodaColors.text3, fontSize: 11,
              fontWeight: FontWeight.w700, letterSpacing: 1)),
      const SizedBox(height: 8),
      KodaTextField(controller: _displayNameCtrl, hintText: t.settingsDisplayNameHint),
      const SizedBox(height: 20),

      // Bio
      Text(t.settingsBioLabel,
          style: TextStyle(color: KodaColors.text3, fontSize: 11,
              fontWeight: FontWeight.w700, letterSpacing: 1)),
      const SizedBox(height: 8),
      KodaTextField(controller: _bioCtrl, hintText: t.settingsBioHint),
      const SizedBox(height: 20),

      // Pronouns
      Text(t.settingsPronounsLabel,
          style: TextStyle(color: KodaColors.text3, fontSize: 11,
              fontWeight: FontWeight.w700, letterSpacing: 1)),
      const SizedBox(height: 8),
      KodaTextField(controller: _pronounsCtrl, hintText: t.settingsPronounsHint),
      const SizedBox(height: 8),
      SwitchListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(t.settingsShowPronounsTitle,
            style: TextStyle(color: KodaColors.text1, fontSize: 13)),
        subtitle: Text(t.settingsShowPronounsSubtitle,
            style: TextStyle(color: KodaColors.text3, fontSize: 11)),
        value: _showPronouns,
        activeThumbColor: KodaColors.koda,
        onChanged: (v) => setState(() => _showPronouns = v),
      ),
      const SizedBox(height: 20),

      // Status
      Text(t.settingsStatusLabel,
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
                      color: statusColor(s), shape: BoxShape.circle),
                ),
                const SizedBox(width: 8),
                Text(_statusLabels(t)[s] ?? s,
                    style: TextStyle(color: KodaColors.text1, fontSize: 13)),
              ]),
            )).toList(),
            onChanged: (v) => setState(() => _status = v ?? 'online'),
          ),
        ),
      ),
      const SizedBox(height: 20),

      // Custom status -- a short line shown next to the dot above,
      // wherever this user is rendered elsewhere (member list, DM
      // list, profile popover). Always public when set, unlike
      // pronouns -- matches Discord, no show/hide toggle.
      Text(t.settingsCustomStatusLabel,
          style: TextStyle(color: KodaColors.text3, fontSize: 11,
              fontWeight: FontWeight.w700, letterSpacing: 1)),
      const SizedBox(height: 8),
      KodaTextField(controller: _customStatusCtrl, hintText: t.settingsCustomStatusHint),
      const SizedBox(height: 28),

      // Save / Cancel
      Row(children: [
        Expanded(
          child: OutlinedButton(
            onPressed: _savingProfile ? null : _cancelEditing,
            child: Text(t.commonCancel),
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
                : Text(t.commonSave, style: TextStyle(color: Colors.white)),
          ),
        ),
      ]),
    ]);
  }

  // -- Helpers ----------------------------------------------------------------

  Widget _shell(String title, Widget child) => SingleChildScrollView(
        padding: const EdgeInsets.all(28),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: TextStyle(color: KodaColors.text1,
              fontSize: 20, fontWeight: FontWeight.w800)),
          Divider(color: KodaColors.border, height: 24),
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
          title: Text(title, style: TextStyle(color: KodaColors.text1, fontSize: 13)),
          subtitle: Text(subtitle,
              style: TextStyle(color: KodaColors.text3, fontSize: 11)),
          trailing: Icon(Icons.chevron_right, color: KodaColors.text3, size: 18),
          onTap: onTap,
        ),
      );
}

