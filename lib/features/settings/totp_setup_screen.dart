// lib/features/settings/totp_setup_screen.dart

import 'package:flutter/material.dart';
import '../../core/api.dart';
import '../../core/theme.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../shared/widgets.dart';

class TotpSetupScreen extends StatefulWidget {
  const TotpSetupScreen({super.key});
  @override
  State<TotpSetupScreen> createState() => _TotpSetupScreenState();
}

class _TotpSetupScreenState extends State<TotpSetupScreen> {
  String? _secret;
  bool _loading = true;
  bool _enabled = false;
  final _code = TextEditingController();
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadSecret();
  }

  Future<void> _loadSecret() async {
    final result = await KodaApi.instance.totpSetup();
    if (!mounted) return;
    setState(() {
      _secret = result?['secret'];
      _loading = false;
    });
  }

  Future<void> _verify() async {
    setState(() => _error = null);
    final t = AppLocalizations.of(context);
    final ok = await KodaApi.instance.totpVerify(_code.text.trim());
    if (!mounted) return;
    if (ok) {
      setState(() => _enabled = true);
    } else {
      setState(() => _error = t.totpSetupInvalidCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: KodaColors.voidBg,
      appBar: AppBar(backgroundColor: KodaColors.voidBg, elevation: 0,
          // Exact match with the Settings nav entry's own title.
          title: Text(t.settingsTwoFactorTitle)),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(24),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 420),
                child: _enabled
                    ? Column(mainAxisSize: MainAxisSize.min, children: [
                        Icon(Icons.check_circle, color: KodaColors.mint, size: 40),
                        SizedBox(height: 12),
                        Text(t.totpSetupEnabledMessage,
                            style: TextStyle(color: KodaColors.text1, fontSize: 15)),
                      ])
                    : Column(mainAxisSize: MainAxisSize.min, children: [
                        Text(
                          t.totpSetupScanInstructions,
                          style: TextStyle(color: KodaColors.text2, fontSize: 13)),
                        const SizedBox(height: 16),
                        Container(
                          padding: const EdgeInsets.all(14),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: KodaColors.card,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: KodaColors.border),
                          ),
                          child: SelectableText(_secret ?? '',
                              style: TextStyle(
                                  color: KodaColors.mint, fontFamily: 'Consolas', fontSize: 13)),
                        ),
                        const SizedBox(height: 20),
                        if (_error != null) KodaErrorBanner(message: _error!),
                        KodaTextField(controller: _code, hintText: t.totpSetupCodeHint),
                        const SizedBox(height: 14),
                        KodaPrimaryButton(label: t.totpSetupVerifyButton, onPressed: _verify),
                      ]),
              ),
            ),
    );
  }
}
