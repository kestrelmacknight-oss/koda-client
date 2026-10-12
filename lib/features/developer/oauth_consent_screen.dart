// lib/features/developer/oauth_consent_screen.dart
//
// The native consent step for the third-party developer platform's
// OAuth2 flow (Phase 2) -- reached via a koda://oauth/authorize or
// https://koda.fyi/oauth/authorize deep link (see core/deep_links.dart,
// home_screen.dart's _handleOAuthDeepLink). Koda has no web login page
// at all, so rather than a server-rendered consent page, this runs
// inside the already-logged-in app -- the client's Guardian JWT is
// already attached to every request (core/api.dart's Dio interceptor),
// so Allow/Deny needs no extra login step of its own.

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/api.dart';
import '../../core/deep_links.dart';
import '../../core/theme.dart';
import '../../l10n/generated/app_localizations.dart';

// Mirrors koda-server's Koda.Developers.@scope_routes -- a human
// description per scope, shown on the consent screen. Keep in sync by
// hand (different repo/language, same reasoning as other client-side
// mirrors of a server-side enum this session).
const _scopeDescriptions = {
  'identify': 'See your username and basic profile',
};

class OAuthConsentScreen extends StatefulWidget {
  final OAuthAuthorizeRequest request;
  const OAuthConsentScreen({super.key, required this.request});

  @override
  State<OAuthConsentScreen> createState() => _OAuthConsentScreenState();
}

class _OAuthConsentScreenState extends State<OAuthConsentScreen> {
  Map<String, dynamic>? _app;
  bool _loading = true;
  bool _notFound = false;
  bool _submitting = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final app = await KodaApi.instance.getOAuthAppInfo(widget.request.clientId);
    if (!mounted) return;
    setState(() { _app = app; _notFound = app == null; _loading = false; });
  }

  Future<void> _respond(bool allow) async {
    if (!allow) {
      Navigator.pop(context);
      return;
    }
    setState(() => _submitting = true);
    // Non-null by construction here -- only the bot.install scope
    // (never routed to this screen, see home_screen.dart's
    // _handleOAuthDeepLink) can have a null redirectUri.
    final redirectTo = await KodaApi.instance.approveOAuthAuthorize(
      clientId: widget.request.clientId,
      redirectUri: widget.request.redirectUri!,
      scope: widget.request.scope,
      state: widget.request.state,
      codeChallenge: widget.request.codeChallenge,
    );
    if (!mounted) return;
    final t = AppLocalizations.of(context);
    if (redirectTo == null) {
      setState(() => _submitting = false);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(t.oauthConsentError)));
      return;
    }
    final uri = Uri.parse(redirectTo);
    if (await canLaunchUrl(uri)) await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final scopes = widget.request.scope.split(' ').where((s) => s.isNotEmpty).toList();

    return Scaffold(
      backgroundColor: KodaColors.voidBg,
      appBar: AppBar(
        backgroundColor: KodaColors.bg2,
        title: Text(t.oauthConsentTitle, style: TextStyle(color: KodaColors.text1, fontSize: 16)),
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator(color: KodaColors.koda))
          : _notFound
              ? Center(child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(t.oauthConsentUnknownApp,
                      style: TextStyle(color: KodaColors.text3, fontSize: 13),
                      textAlign: TextAlign.center),
                ))
              : Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(t.oauthConsentAllowQuestion(_app!['name'] as String? ?? ''),
                        style: TextStyle(color: KodaColors.text1, fontSize: 18, fontWeight: FontWeight.w700)),
                    if ((_app!['description'] as String?)?.isNotEmpty == true) ...[
                      const SizedBox(height: 8),
                      Text(_app!['description'] as String,
                          style: TextStyle(color: KodaColors.text3, fontSize: 13)),
                    ],
                    const SizedBox(height: 20),
                    Text(t.oauthConsentWillBeAbleTo,
                        style: TextStyle(color: KodaColors.text2, fontSize: 12, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 8),
                    for (final scope in scopes)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Icon(Icons.check_circle_outline, size: 16, color: KodaColors.koda),
                          const SizedBox(width: 8),
                          Expanded(child: Text(_scopeDescriptions[scope] ?? scope,
                              style: TextStyle(color: KodaColors.text1, fontSize: 13))),
                        ]),
                      ),
                    const Spacer(),
                    Row(children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: _submitting ? null : () => _respond(false),
                          child: Text(t.oauthConsentDeny),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: KodaColors.koda, foregroundColor: Colors.black),
                          onPressed: _submitting ? null : () => _respond(true),
                          child: _submitting
                              ? SizedBox(width: 16, height: 16,
                                  child: CircularProgressIndicator(strokeWidth: 2, color: Colors.black))
                              : Text(t.oauthConsentAllow),
                        ),
                      ),
                    ]),
                  ]),
                ),
    );
  }
}
