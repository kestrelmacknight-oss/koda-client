// lib/core/deep_links.dart
//
// Invite/join deep links -- both the koda:// custom scheme and
// https://koda.fyi/invite/<code> Universal/App Links resolve here to the
// same thing: an invite code to preview and (if the user chooses) redeem.
// Android + iOS only, see pubspec.yaml's app_links entry for why desktop
// is out of scope.
//
// A link can arrive three ways, all handled the same way below:
//   - cold start (app wasn't running) -- AppLinks.getInitialAppLink()
//   - warm resume (app was backgrounded) -- AppLinks.uriLinkStream
//   - the user isn't logged in yet -- the code is held in _pendingCode
//     until something calls consumePendingInviteCode() after auth
//     completes (see main.dart's AuthGate/HomeScreen wiring).
import 'dart:async';

import 'package:app_links/app_links.dart';
import 'platform.dart';

class DeepLinks {
  DeepLinks._();
  static final DeepLinks instance = DeepLinks._();

  final _controller = StreamController<String>.broadcast();

  /// Emits an invite code every time a link resolves while something is
  /// already listening (i.e. the app is past login) -- see HomeScreen's
  /// subscription, which mirrors _subscribeVoicePresence's pattern.
  Stream<String> get inviteCodes => _controller.stream;

  String? _pendingCode;
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
    if (code == null) return;

    if (_controller.hasListener) {
      _controller.add(code);
    } else {
      // Nothing's listening yet -- almost always because the link arrived
      // before login (cold start on the auth screen). Held for whoever
      // calls consumePendingInviteCode() once a user is signed in.
      _pendingCode = code;
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

  Future<void> dispose() async {
    await _sub?.cancel();
    _sub = null;
  }
}
