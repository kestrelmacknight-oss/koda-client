// lib/features/auth/auth_screen.dart

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/config.dart';
import '../../core/api.dart';
import '../../core/socket.dart';
import '../../core/kcp_bridge.dart';
import '../../core/providers.dart';
import '../../core/theme.dart';
import '../../shared/widgets.dart';
import 'verify_email_screen.dart';
import 'forgot_password_screen.dart';
import '../home/home_screen.dart';
import 'force_password_change_screen.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});
  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabs = TabController(length: 2, vsync: this);

  final _loginEmail = TextEditingController();
  final _loginPassword = TextEditingController();
  final _regEmail = TextEditingController();
  final _regUsername = TextEditingController();
  final _regPassword = TextEditingController();
  final _regConfirm = TextEditingController();

  bool _busy = false;
  bool _agree = false;
  String? _error;

  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _initKeyBundle() async {
    try {
      final has = await KodaApi.instance.hasKeyBundle();
      if (!has) {
        final bundle = await kcpGenerateBundle();
        await KodaApi.instance.uploadKeyBundle(bundle.toJson());
      }
    } catch (e) {
      // Non-fatal -- E2EE setup failed, app still works
      debugPrint('[KCP] Key bundle init failed: $e');
    }
  }

  Future<void> _login() async {
    if (_loginEmail.text.trim().isEmpty || _loginPassword.text.isEmpty) {
      setState(() => _error = 'Email and password are required.');
      return;
    }
    setState(() { _busy = true; _error = null; });

    final result = await KodaApi.instance
        .login(_loginEmail.text.trim(), _loginPassword.text);

    if (!mounted) return;
    setState(() => _busy = false);

    if (result == null) {
      setState(() => _error = 'Incorrect email or password.');
      return;
    }

    final token = result['token'] as String?;
    if (token != null) {
      KodaApi.instance.setToken(token);
      KodaSocket.instance.connect(token);
      // Generate and upload key bundle if not already on server
      _initKeyBundle();
    }

    if (result['must_change_password'] == true) {
      final username = (result['user']?['username'] as String?) ?? 'there';
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (_) => ForcePasswordChangeScreen(username: username)));
      return;
    }

    ref.read(authProvider.notifier).setUser(result['user']);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => const HomeScreen()));
  }

  Future<void> _register() async {
    if (!_agree) {
      setState(() => _error = 'Please accept the Terms & Conditions.');
      return;
    }
    if (_regEmail.text.trim().isEmpty ||
        _regUsername.text.trim().isEmpty ||
        _regPassword.text.isEmpty) {
      setState(() => _error = 'All fields are required.');
      return;
    }
    if (_regPassword.text != _regConfirm.text) {
      setState(() => _error = 'Passwords do not match.');
      return;
    }
    if (_regPassword.text.length < 8) {
      setState(() => _error = 'Password must be at least 8 characters.');
      return;
    }

    setState(() { _busy = true; _error = null; });

    final result = await KodaApi.instance.register(
      email: _regEmail.text.trim(),
      username: _regUsername.text.trim(),
      password: _regPassword.text,
    );

    if (!mounted) return;
    setState(() => _busy = false);

    if (result == null) {
      setState(() =>
          _error = 'Registration failed. That email may already be in use.');
      return;
    }

    Navigator.push(context, MaterialPageRoute(
        builder: (_) => VerifyEmailScreen(email: _regEmail.text.trim())));
  }

  @override
  void dispose() {
    _tabs.dispose();
    for (final c in [
      _loginEmail, _loginPassword, _regEmail, _regUsername,
      _regPassword, _regConfirm
    ]) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KodaColors.voidBg,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Column(children: [
              Container(
                width: 56, height: 56,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      colors: [KodaColors.koda, KodaColors.mint],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Center(
                    child: Text('K',
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                            color: Colors.white))),
              ),
              const SizedBox(height: 14),
              const Text(KodaConfig.appName,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: KodaColors.text1)),
              Text('${KodaConfig.buildLabel} v${KodaConfig.appVersion}',
                  style: const TextStyle(fontSize: 12, color: KodaColors.gold)),
              const SizedBox(height: 28),

              Container(
                decoration: BoxDecoration(
                    color: KodaColors.elevated,
                    borderRadius: BorderRadius.circular(10)),
                child: TabBar(
                  controller: _tabs,
                  indicator: BoxDecoration(
                      color: KodaColors.koda,
                      borderRadius: BorderRadius.circular(8)),
                  labelColor: Colors.white,
                  unselectedLabelColor: KodaColors.text3,
                  dividerColor: Colors.transparent,
                  padding: const EdgeInsets.all(4),
                  tabs: const [Tab(text: 'Sign In'), Tab(text: 'Create Account')],
                ),
              ),
              const SizedBox(height: 18),

              if (_error != null) KodaErrorBanner(message: _error!),

              SizedBox(
                height: 320,
                child: TabBarView(controller: _tabs, children: [
                  _loginTab(), _registerTab(),
                ]),
              ),

              const SizedBox(height: 22),
              Text.rich(
                TextSpan(style: const TextStyle(color: KodaColors.text3, fontSize: 11), children: [
                  const TextSpan(text: 'By using Koda you agree to our '),
                  TextSpan(
                    text: 'Terms & Conditions',
                    style: const TextStyle(color: KodaColors.koda),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => _openUrl(KodaConfig.termsUrl),
                  ),
                  const TextSpan(text: ' and '),
                  TextSpan(
                    text: 'Privacy Policy',
                    style: const TextStyle(color: KodaColors.koda),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => _openUrl(KodaConfig.privacyUrl),
                  ),
                  const TextSpan(text: '.'),
                ]),
                textAlign: TextAlign.center,
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _loginTab() => Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        KodaTextField(controller: _loginEmail, hintText: 'Email address',
            keyboardType: TextInputType.emailAddress),
        const SizedBox(height: 10),
        KodaTextField(controller: _loginPassword, hintText: 'Password', obscureText: true),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const ForgotPasswordScreen())),
            child: const Text('Forgot password?',
                style: TextStyle(color: KodaColors.koda, fontSize: 12)),
          ),
        ),
        const SizedBox(height: 8),
        KodaPrimaryButton(label: 'Sign In', onPressed: _login, busy: _busy),
      ]);

  Widget _registerTab() => SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          KodaTextField(controller: _regEmail, hintText: 'Email address',
              keyboardType: TextInputType.emailAddress),
          const SizedBox(height: 10),
          KodaTextField(controller: _regUsername, hintText: 'Username'),
          const SizedBox(height: 10),
          KodaTextField(controller: _regPassword, hintText: 'Password', obscureText: true),
          const SizedBox(height: 10),
          KodaTextField(controller: _regConfirm, hintText: 'Confirm password', obscureText: true),
          const SizedBox(height: 14),
          GestureDetector(
            onTap: () => setState(() => _agree = !_agree),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Checkbox(
                value: _agree,
                onChanged: (v) => setState(() => _agree = v ?? false),
                activeColor: KodaColors.koda,
              ),
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 12),
                  child: Text('I agree to the Terms & Conditions and Privacy Policy',
                      style: TextStyle(color: KodaColors.text3, fontSize: 12)),
                ),
              ),
            ]),
          ),
          const SizedBox(height: 12),
          KodaPrimaryButton(label: 'Create Account', onPressed: _register, busy: _busy),
        ]),
      );
}



