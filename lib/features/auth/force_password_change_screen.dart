// lib/features/auth/force_password_change_screen.dart
//
// Shown when the server returns must_change_password: true on login
// (this is exactly how the Kestrel_MacKnight admin account, and any
// future admin-created account, gets its temp password replaced).
// The user cannot dismiss this screen until a new password is set.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/api.dart';
import '../../core/theme.dart';
import '../../core/providers.dart';
import '../../shared/widgets.dart';
import '../home/home_screen.dart';

class ForcePasswordChangeScreen extends ConsumerStatefulWidget {
  final String username;
  const ForcePasswordChangeScreen({super.key, required this.username});

  @override
  ConsumerState<ForcePasswordChangeScreen> createState() =>
      _ForcePasswordChangeScreenState();
}

class _ForcePasswordChangeScreenState
    extends ConsumerState<ForcePasswordChangeScreen> {
  final _newPassword = TextEditingController();
  final _confirm = TextEditingController();
  bool _busy = false;
  String? _error;

  bool get _hasLength => _newPassword.text.length >= 12;
  bool get _hasUpper  => _newPassword.text.contains(RegExp(r'[A-Z]'));
  bool get _hasLower  => _newPassword.text.contains(RegExp(r'[a-z]'));
  bool get _hasDigit  => _newPassword.text.contains(RegExp(r'[0-9]'));
  bool get _match     => _newPassword.text == _confirm.text && _confirm.text.isNotEmpty;
  bool get _valid     => _hasLength && _hasUpper && _hasLower && _hasDigit && _match;

  Future<void> _submit() async {
    if (!_valid) return;
    setState(() { _busy = true; _error = null; });

    final result = await KodaApi.instance.forceChangePassword(
      password: _newPassword.text,
      passwordConfirmation: _confirm.text,
    );

    if (!mounted) return;
    setState(() => _busy = false);

    if (result != null) {
      final token = result['token'] as String?;
      if (token != null) KodaApi.instance.setToken(token);
      ref.read(authProvider.notifier).setUser(result['user']);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
        (route) => false,
      );
    } else {
      setState(() => _error = 'Could not update password. Try again.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KodaColors.voidBg,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Column(children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: KodaColors.gold.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: KodaColors.gold.withOpacity(0.3)),
                ),
                child: Column(children: [
                  const Icon(Icons.lock_reset, color: KodaColors.gold, size: 40),
                  const SizedBox(height: 12),
                  Text('Welcome, ${widget.username}',
                      style: const TextStyle(
                          color: KodaColors.text1,
                          fontSize: 20,
                          fontWeight: FontWeight.w800)),
                  const SizedBox(height: 8),
                  const Text(
                    'Your account requires a new password before you can continue.',
                    style: TextStyle(color: KodaColors.text2, fontSize: 13),
                    textAlign: TextAlign.center,
                  ),
                ]),
              ),
              const SizedBox(height: 24),
              if (_error != null) KodaErrorBanner(message: _error!),
              KodaTextField(controller: _newPassword, hintText: 'New password',
                  obscureText: true, onChanged: (_) => setState(() {})),
              const SizedBox(height: 10),
              KodaTextField(controller: _confirm, hintText: 'Confirm new password',
                  obscureText: true, onChanged: (_) => setState(() {})),
              const SizedBox(height: 14),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: KodaColors.card,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: KodaColors.border),
                ),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  _req('At least 12 characters', _hasLength),
                  _req('One uppercase letter', _hasUpper),
                  _req('One lowercase letter', _hasLower),
                  _req('One number', _hasDigit),
                  _req('Passwords match', _match),
                ]),
              ),
              const SizedBox(height: 20),
              KodaPrimaryButton(
                  label: 'Set New Password',
                  onPressed: _valid ? _submit : null,
                  busy: _busy),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _req(String label, bool met) => Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Row(children: [
          Icon(met ? Icons.check_circle : Icons.radio_button_unchecked,
              size: 14, color: met ? KodaColors.mint : KodaColors.text3),
          const SizedBox(width: 7),
          Text(label,
              style: TextStyle(
                  fontSize: 12, color: met ? KodaColors.mint : KodaColors.text3)),
        ]),
      );
}
