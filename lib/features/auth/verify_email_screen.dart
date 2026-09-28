// lib/features/auth/verify_email_screen.dart

import 'package:flutter/material.dart';
import '../../core/api.dart';
import '../../core/theme.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../shared/widgets.dart';
import 'auth_screen.dart';

class VerifyEmailScreen extends StatefulWidget {
  final String email;
  const VerifyEmailScreen({super.key, required this.email});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final _code = TextEditingController();
  bool _busy = false;
  String? _error;
  String? _info;

  Future<void> _verify() async {
    // Captured before the await below, so we don't touch a
    // possibly-unmounted context afterward.
    final t = AppLocalizations.of(context);
    if (_code.text.trim().length != 6) {
      setState(() => _error = t.verifyEmailEnterCodeError);
      return;
    }
    setState(() { _busy = true; _error = null; });

    final ok = await KodaApi.instance.verifyEmail(_code.text.trim());

    if (!mounted) return;
    setState(() => _busy = false);

    if (ok) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const AuthScreen()),
        (route) => false,
      );
    } else {
      setState(() => _error = t.verifyEmailInvalidCode);
    }
  }

  Future<void> _resend() async {
    // Captured before the await below, so we don't touch a
    // possibly-unmounted context afterward.
    final t = AppLocalizations.of(context);
    setState(() => _info = null);
    final ok = await KodaApi.instance.resendVerification();
    if (!mounted) return;
    setState(() => _info =
        ok ? t.verifyEmailResentInfo(widget.email) : t.verifyEmailResendFailed);
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: KodaColors.voidBg,
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 380),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Icon(Icons.mark_email_unread_outlined,
                  color: KodaColors.koda, size: 40),
              const SizedBox(height: 16),
              Text(t.verifyEmailTitle,
                  style: TextStyle(
                      color: KodaColors.text1,
                      fontSize: 20,
                      fontWeight: FontWeight.w800)),
              const SizedBox(height: 8),
              Text(t.verifyEmailSentCode(widget.email),
                  style: TextStyle(color: KodaColors.text2, fontSize: 13),
                  textAlign: TextAlign.center),
              const SizedBox(height: 24),
              if (_error != null) KodaErrorBanner(message: _error!),
              if (_info != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: Text(_info!,
                      style: TextStyle(color: KodaColors.mint, fontSize: 12)),
                ),
              KodaTextField(controller: _code, hintText: t.verifyEmailCodeHint,
                  keyboardType: TextInputType.number),
              const SizedBox(height: 16),
              KodaPrimaryButton(label: t.verifyEmailVerifyButton, onPressed: _verify, busy: _busy),
              const SizedBox(height: 12),
              TextButton(
                onPressed: _resend,
                child: Text(t.verifyEmailResendButton,
                    style: TextStyle(color: KodaColors.text3, fontSize: 12)),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
