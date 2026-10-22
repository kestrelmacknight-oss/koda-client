// lib/features/auth/sso_login_screen.dart
//
// "Sign in with SSO" -- polling-based, not a deep link. lib/core/deep_links.dart's
// koda:// scheme is Android/iOS only (see its header comment), and an SSO
// login is at least as likely from desktop, so this mirrors the
// device-code-style flow CLI/desktop OAuth tools use: open the browser,
// then poll until the server reports the login as completed.

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/api.dart';
import '../../core/socket.dart';
import '../../core/crypto/dm_session_manager.dart';
import '../../core/providers.dart';
import '../../core/theme.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../shared/widgets.dart';
import '../home/home_screen.dart';

class SsoLoginScreen extends ConsumerStatefulWidget {
  const SsoLoginScreen({super.key});
  @override
  ConsumerState<SsoLoginScreen> createState() => _SsoLoginScreenState();
}

class _SsoLoginScreenState extends ConsumerState<SsoLoginScreen> {
  final _emailCtrl = TextEditingController();
  bool _busy = false;
  bool _waiting = false;
  String? _error;
  Timer? _pollTimer;

  @override
  void dispose() {
    _pollTimer?.cancel();
    _emailCtrl.dispose();
    super.dispose();
  }

  Future<void> _start() async {
    final t = AppLocalizations.of(context);
    final email = _emailCtrl.text.trim();
    if (email.isEmpty) return;
    setState(() { _busy = true; _error = null; });

    final result = await KodaApi.instance.startSso(email);
    if (!mounted) return;
    setState(() => _busy = false);

    if (result == null) {
      setState(() => _error = t.ssoNoConfigError);
      return;
    }

    final redirectUrl = result['redirect_url'] as String?;
    final attemptToken = result['attempt_token'] as String?;
    if (redirectUrl == null || attemptToken == null) {
      setState(() => _error = t.ssoGenericError);
      return;
    }

    final uri = Uri.parse(redirectUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }

    setState(() => _waiting = true);
    _pollTimer = Timer.periodic(const Duration(seconds: 2), (_) => _poll(attemptToken));
  }

  Future<void> _poll(String attemptToken) async {
    final status = await KodaApi.instance.pollSsoAttempt(attemptToken);
    if (!mounted) return;

    if (status == null) {
      _pollTimer?.cancel();
      final t = AppLocalizations.of(context);
      setState(() { _waiting = false; _error = t.ssoExpiredError; });
      return;
    }

    if (status['status'] == 'completed') {
      _pollTimer?.cancel();
      await _finishLogin(status['jwt'] as String);
    }
  }

  Future<void> _finishLogin(String token) async {
    KodaApi.instance.setToken(token);
    KodaSocket.instance.connect(token);
    try {
      await DmSessionManager.instance.ensureMyKeysExist();
      await DmSessionManager.instance.rotateSignedPrekeyIfDue();
    } catch (_) {
      // Non-fatal, same as the password-login path -- E2EE setup can
      // catch up on a later launch.
    }

    final me = await KodaApi.instance.me();
    if (!mounted) return;
    final user = me.data?['user'];
    if (user != null) ref.read(authProvider.notifier).setUser(user);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen()));
  }

  void _cancel() {
    _pollTimer?.cancel();
    setState(() => _waiting = false);
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: KodaColors.voidBg,
      appBar: AppBar(
        backgroundColor: KodaColors.bg2,
        title: Text(t.ssoLoginTitle, style: TextStyle(color: KodaColors.text1, fontSize: 16)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: _waiting ? _buildWaiting(t) : _buildEmailForm(t),
      ),
    );
  }

  Widget _buildEmailForm(AppLocalizations t) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(t.ssoLoginDescription, style: TextStyle(color: KodaColors.text3, fontSize: 13)),
      const SizedBox(height: 16),
      KodaTextField(
        controller: _emailCtrl,
        hintText: t.ssoWorkEmailHint,
        keyboardType: TextInputType.emailAddress,
        onSubmitted: (_) => _start(),
      ),
      if (_error != null) ...[
        const SizedBox(height: 8),
        Text(_error!, style: const TextStyle(color: Colors.redAccent, fontSize: 12)),
      ],
      const SizedBox(height: 16),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: KodaColors.koda,
          foregroundColor: Colors.black,
          minimumSize: const Size(double.infinity, 44),
        ),
        onPressed: _busy ? null : _start,
        child: _busy
            ? const SizedBox(width: 18, height: 18,
                child: CircularProgressIndicator(strokeWidth: 2, color: Colors.black))
            : Text(t.commonContinue),
      ),
    ]);
  }

  Widget _buildWaiting(AppLocalizations t) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        CircularProgressIndicator(color: KodaColors.koda),
        const SizedBox(height: 16),
        Text(t.ssoWaitingForBrowser, textAlign: TextAlign.center,
            style: TextStyle(color: KodaColors.text2)),
        const SizedBox(height: 16),
        TextButton(onPressed: _cancel, child: Text(t.commonCancel)),
      ]),
    );
  }
}
