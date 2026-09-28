// lib/features/auth/forgot_password_screen.dart

import 'package:flutter/material.dart';
import '../../core/api.dart';
import '../../core/theme.dart';
import '../../l10n/generated/app_localizations.dart';
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
    // Captured before the await below, so we don't touch a
    // possibly-unmounted context afterward.
    final t = AppLocalizations.of(context);
    if (_email.text.trim().isEmpty) {
      setState(() => _error = t.forgotPasswordEnterEmailError);
      return;
    }
    setState(() { _busy = true; _error = null; });
    await KodaApi.instance.requestPasswordReset(_email.text.trim());
    if (!mounted) return;
    setState(() {
      _busy = false;
      _codeSent = true;
      _info = t.forgotPasswordCodeSentInfo;
    });
  }

  Future<void> _confirmReset() async {
    // Captured before the await below, so we don't touch a
    // possibly-unmounted context afterward.
    final t = AppLocalizations.of(context);
    if (_code.text.trim().isEmpty || _newPassword.text.length < 8) {
      setState(() => _error = t.forgotPasswordEnterCodeError);
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
      setState(() => _error = t.forgotPasswordInvalidCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: KodaColors.voidBg,
      appBar: AppBar(backgroundColor: KodaColors.voidBg, elevation: 0,
          title: Text(t.forgotPasswordTitle)),
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
                      style: TextStyle(color: KodaColors.mint, fontSize: 12)),
                ),
              KodaTextField(controller: _email, hintText: t.forgotPasswordEmailHint,
                  keyboardType: TextInputType.emailAddress),
              const SizedBox(height: 14),
              if (!_codeSent)
                KodaPrimaryButton(label: t.forgotPasswordSendCodeButton, onPressed: _requestCode, busy: _busy)
              else ...[
                KodaTextField(controller: _code, hintText: t.forgotPasswordCodeHint),
                const SizedBox(height: 10),
                KodaTextField(controller: _newPassword, hintText: t.forgotPasswordNewPasswordHint, obscureText: true),
                const SizedBox(height: 14),
                KodaPrimaryButton(label: t.forgotPasswordSetNewPasswordButton, onPressed: _confirmReset, busy: _busy),
              ],
            ]),
          ),
        ),
      ),
    );
  }
}
