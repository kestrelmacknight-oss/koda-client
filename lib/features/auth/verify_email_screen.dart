// lib/features/auth/verify_email_screen.dart

import 'package:flutter/material.dart';
import '../../core/api.dart';
import '../../core/theme.dart';
import '../../shared/widgets.dart';
import 'auth_screen.dart';

class VerifyEmailScreen extends StatefulWidget {
  final String email;
  final String userId;
  const VerifyEmailScreen({super.key, required this.email, required this.userId});
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final _code = TextEditingController();
  bool _busy = false;
  String? _error;
  String? _info;

  Future<void> _verify() async {
    if (_code.text.trim().length != 6) {
      setState(() => _error = 'Enter the 6-digit code from your email.');
      return;
    }
    setState(() { _busy = true; _error = null; });

    final ok = await KodaApi.instance.verifyEmail(_code.text.trim(), widget.userId);

    if (!mounted) return;
    setState(() => _busy = false);

    if (ok) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const AuthScreen()),
        (route) => false,
      );
    } else {
      setState(() => _error = 'Invalid or expired code.');
    }
  }

  Future<void> _resend() async {
    setState(() => _info = null);
    final ok = await KodaApi.instance.resendVerification();
    setState(() => _info =
        ok ? 'A new code has been sent to ${widget.email}.' : 'Could not resend right now.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KodaColors.voidBg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: KodaColors.text2),
          onPressed: () => Navigator.pop(context),
          tooltip: 'Back to sign in',
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 380),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              const Icon(Icons.mark_email_unread_outlined,
                  color: KodaColors.koda, size: 40),
              const SizedBox(height: 16),
              const Text('Check your email',
                  style: TextStyle(
                      color: KodaColors.text1,
                      fontSize: 20,
                      fontWeight: FontWeight.w800)),
              const SizedBox(height: 8),
              Text('We sent a 6-digit code to ${widget.email}',
                  style: const TextStyle(color: KodaColors.text2, fontSize: 13),
                  textAlign: TextAlign.center),
              const SizedBox(height: 24),
              if (_error != null) KodaErrorBanner(message: _error!),
              if (_info != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: Text(_info!,
                      style: const TextStyle(color: KodaColors.mint, fontSize: 12)),
                ),
              KodaTextField(controller: _code, hintText: '000000',
                  keyboardType: TextInputType.number),
              const SizedBox(height: 16),
              KodaPrimaryButton(label: 'Verify Email', onPressed: _verify, busy: _busy),
              const SizedBox(height: 12),
              TextButton(
                onPressed: _resend,
                child: const Text('Resend code',
                    style: TextStyle(color: KodaColors.text3, fontSize: 12)),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

