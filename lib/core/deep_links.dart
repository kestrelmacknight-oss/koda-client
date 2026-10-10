// lib/core/deep_links.dart
//
// Invite/join deep links -- both the koda:// custom scheme and
// https://koda.fyi/invite/<code> Universal/App Links resolve here to the
// same thing: an invite code to preview and (if the user chooses) redeem.
// Also handles koda://oauth/authorize and https://koda.fyi/oauth/authorize
// links (the third-party developer platform's OAuth2 consent step, Phase
// 2) -- same dispatcher, same cold/warm handling, see OAuthAuthorizeRequest
// below. Android + iOS only, see pubspec.yaml's app_links entry for why
// desktop is out of scope -- a desktop Koda user driving an OAuth consent
// from a browser has no deep-link path back into the app today; this is a
// known Phase 2 gap, not an oversight, flagged for a follow-up rather than
// solved here.
//
// A link can arrive three ways, all handled the same way below:
//   - cold start (app wasn't running) -- AppLinks.getInitialAppLink()
//   - warm resume (app was backgrounded) -- AppLinks.uriLinkStream
//   - nothing's listening yet (either pre-login, or HomeScreen's own
//     initState just hasn't subscribed yet) -- held in _pendingCode/
//     _pendingOAuthRequest until something calls consumePendingInviteCode()/
//     consumePendingOAuthRequest() (see main.dart's AuthGate/HomeScreen
//     wiring).
import 'dart:async';

import 'package:app_links/app_links.dart';
import 'platform.dart';

/// Parsed from an /oauth/authorize link -- see OAuthConsentScreen, which
/// is what actually renders the Allow/Deny decision.
class OAuthAuthorizeRequest {
  final String clientId;
  final String redirectUri;
  final String scope;
  final String? state;
  final String? codeChallenge;
  const OAuthAuthorizeRequest({
    required this.clientId, required this.redirectUri, required this.scope,
    this.state, this.codeChallenge,
  });
}

class DeepLinks {
  DeepLinks._();
  static final DeepLinks instance = DeepLinks._();

  final _controller = StreamController<String>.broadcast();
  final _oauthController = StreamController<OAuthAuthorizeRequest>.broadcast();

  /// Emits an invite code every time a link resolves while something is
  /// already listening (i.e. the app is past login) -- see HomeScreen's
  /// subscription, which mirrors _subscribeVoicePresence's pattern.
  Stream<String> get inviteCodes => _controller.stream;

  /// Emits a parsed OAuth authorize request -- see HomeScreen's
  /// subscription, which opens OAuthConsentScreen.
  Stream<OAuthAuthorizeRequest> get oauthRequests => _oauthController.stream;

  String? _pendingCode;
  OAuthAuthorizeRequest? _pendingOAuthRequest;
  StreamSubscription<Uri>? _sub;
  bool _initStarted = false;

  /// Call once per app session, as early as possible (see main.dart) --
  /// safe to call repeatedly, and a no-op on desktop/web.
  Future<void> init() async {
    if (_initStarted || !isMobile) return;
    _initStarted = true;

    final appLinks = AppLinks();

    try {
      final initial = await appLinks.getInitialLink();
      if (initial != null) _handle(initial);
    } catch (_) {}

    _sub = appLinks.uriLinkStream.listen(_handle, onError: (_) {});
  }

  void _handle(Uri uri) {
    final code = _inviteCodeFrom(uri);
    if (code != null) {
      if (_controller.hasListener) {
        _controller.add(code);
      } else {
        // Nothing's listening yet -- almost always because the link arrived
        // before login (cold start on the auth screen). Held for whoever
        // calls consumePendingInviteCode() once a user is signed in.
        _pendingCode = code;
      }
      return;
    }

    final oauthRequest = _oauthRequestFrom(uri);
    if (oauthRequest != null) {
      if (_oauthController.hasListener) {
        _oauthController.add(oauthRequest);
      } else {
        _pendingOAuthRequest = oauthRequest;
      }
    }
  }

  /// Extracts an invite code from either link shape:
  ///   koda://invite/<code>              (host = "invite")
  ///   https://koda.fyi/invite/<code>     (first path segment = "invite")
  /// Returns null for any link this app doesn't recognize, so an
  /// unrelated/future link shape is silently ignored rather than crashing.
  String? _inviteCodeFrom(Uri uri) {
    final segments = uri.pathSegments;
    if (uri.scheme == 'koda' && uri.host == 'invite' && segments.isNotEmpty) {
      return segments.first;
    }
    if (segments.length >= 2 && segments[0] == 'invite') {
      return segments[1];
    }
    return null;
  }

  /// Returns and clears any invite code that arrived before something was
  /// listening on [inviteCodes] -- call once right after a user becomes
  /// authenticated (see main.dart's AuthGate).
  String? consumePendingInviteCode() {
    final code = _pendingCode;
    _pendingCode = null;
    return code;
  }

  /// Extracts an OAuth authorize request from either link shape:
  ///   koda://oauth/authorize?...                 (host = "oauth")
  ///   https://koda.fyi/oauth/authorize?...        (path segments oauth/authorize)
  /// Returns null for any link that doesn't match, or that's missing a
  /// required param -- same "silently ignore, never crash" discipline as
  /// _inviteCodeFrom.
  OAuthAuthorizeRequest? _oauthRequestFrom(Uri uri) {
    final segments = uri.pathSegments;
    final isCustomScheme = uri.scheme == 'koda' && uri.host == 'oauth' &&
        segments.isNotEmpty && segments.first == 'authorize';
    final isUniversalLink = segments.length >= 2 && segments[0] == 'oauth' && segments[1] == 'authorize';
    if (!isCustomScheme && !isUniversalLink) return null;

    final q = uri.queryParameters;
    final clientId = q['client_id'];
    final redirectUri = q['redirect_uri'];
    final scope = q['scope'];
    if (clientId == null || redirectUri == null || scope == null) return null;

    return OAuthAuthorizeRequest(
      clientId: clientId, redirectUri: redirectUri, scope: scope,
      state: q['state'], codeChallenge: q['code_challenge'],
    );
  }

  /// Returns and clears any OAuth request that arrived before something
  /// was listening on [oauthRequests] -- call once HomeScreen subscribes.
  OAuthAuthorizeRequest? consumePendingOAuthRequest() {
    final request = _pendingOAuthRequest;
    _pendingOAuthRequest = null;
    return request;
  }

  Future<void> dispose() async {
    await _sub?.cancel();
    _sub = null;
  }
}
