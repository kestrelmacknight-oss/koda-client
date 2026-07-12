// lib/features/auth/forgot_password_screen.dart

import 'package:flutter/material.dart';
import '../../core/api.dart';
import '../../core/theme.dart';
import '../../shared/widgets.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});
  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _email = TextEditingController();
  final _code = TextEditingController();
  final _newPassword = TextEditingController();

  bool _busy = false;
  bool _codeSent = false;
  String? _error;
  String? _info;

  Future<void> _requestCode() async {
    if (_email.text.trim().isEmpty) {
      setState(() => _error = 'Enter your email address.');
      return;
    }
    setState(() { _busy = true; _error = null; });
    await KodaApi.instance.requestPasswordReset(_email.text.trim());
    if (!mounted) return;
    setState(() {
      _busy = false;
      _codeSent = true;
      _info = 'If that account exists, a reset code has been sent.';
    });
  }

  Future<void> _confirmReset() async {
    if (_code.text.trim().isEmpty || _newPassword.text.length < 8) {
      setState(() => _error = 'Enter the code and a password of at least 8 characters.');
      return;
    }
    setState(() { _busy = true; _error = null; });

    final ok = await KodaApi.instance.confirmPasswordReset(
      email: _email.text.trim(),
      code: _code.text.trim(),
      newPassword: _newPassword.text,
    );

    if (!mounted) return;
    setState(() => _busy = false);

    if (ok) {
      Navigator.pop(context);
    } else {
      setState(() => _error = 'Invalid or expired code.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KodaColors.voidBg,
      appBar: AppBar(backgroundColor: KodaColors.voidBg, elevation: 0,
          title: const Text('Reset password')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 380),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              if (_error != null) KodaErrorBanner(message: _error!),
              if (_info != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: Text(_info!,
                      style: const TextStyle(color: KodaColors.mint, fontSize: 12)),
                ),
              KodaTextField(controller: _email, hintText: 'Email address',
                  keyboardType: TextInputType.emailAddress),
              const SizedBox(height: 14),
              if (!_codeSent)
                KodaPrimaryButton(label: 'Send reset code', onPressed: _requestCode, busy: _busy)
              else ...[
                KodaTextField(controller: _code, hintText: '6-digit code'),
                const SizedBox(height: 10),
                KodaTextField(controller: _newPassword, hintText: 'New password', obscureText: true),
                const SizedBox(height: 14),
                KodaPrimaryButton(label: 'Set new password', onPressed: _confirmReset, busy: _busy),
              ],
            ]),
          ),
        ),
      ),
    );
  }
}
