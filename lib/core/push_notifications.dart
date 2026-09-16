// lib/core/push_notifications.dart
//
// Mobile OS push notifications (Android via FCM, iOS via FCM's own APNs
// bridge) -- the one delivery path that reaches a device's system tray
// while the app is backgrounded or fully killed, which nothing else in
// this app can do. The in-app toast (lib/shared/toast.dart) and the
// desktop tray notification (home_screen.dart's _showTrayNotification)
// both need a live Phoenix socket connection -- i.e. the app actually
// running -- so they simply can't fire once the app is gone from memory.
//
// Desktop is untouched: firebase_messaging has no Windows/Linux
// implementation, and doesn't need one -- local_notifier already covers
// desktop tray notifications over the same live socket connection those
// platforms keep open while running.
//
// One-time setup this depends on (Firebase project, config files, APNs
// key) is documented in PUSH_NOTIFICATIONS.md at the repo root -- this
// file is written to fail safe (never throw past init()/unregister())
// when that setup hasn't happened yet, so push staying unconfigured
// never breaks login or the home screen.

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'api.dart';
import 'platform.dart';
import 'secure_storage.dart';

class PushNotifications {
  PushNotifications._();
  static final PushNotifications instance = PushNotifications._();

  bool _initStarted = false;

  /// Call once per app session, after the user is authenticated (see
  /// main.dart's AuthGate and home_screen.dart's initState) -- requests
  /// notification permission, then registers this device's FCM token
  /// with koda-server so it knows where to send a push (see
  /// Koda.Push/Koda.PushTokens server-side). Safe to call repeatedly --
  /// only the first call in a session does anything. Desktop/web are
  /// silent no-ops.
  Future<void> init() async {
    if (_initStarted || !isMobile) return;
    _initStarted = true;

    try {
      await Firebase.initializeApp();
      final messaging = FirebaseMessaging.instance;

      final settings = await messaging.requestPermission(
        alert: true, badge: true, sound: true,
      );
      if (settings.authorizationStatus == AuthorizationStatus.denied) return;

      final token = await messaging.getToken();
      if (token != null) await _registerToken(token);

      // A token can rotate (app reinstall, OS-level backup restore,
      // token expiry) -- keep the server in sync whenever that happens,
      // not just at startup.
      messaging.onTokenRefresh.listen(_registerToken);
    } catch (e) {
      // Push is a nice-to-have layered on top of everything else in this
      // app, never something that should be allowed to break login or
      // the home screen -- a missing/misconfigured Firebase project (no
      // google-services.json yet, e.g.) throws here and is swallowed.
    }
  }

  Future<void> _registerToken(String token) async {
    final deviceId = await SecureStorage.getOrCreateDeviceId();
    await KodaApi.instance.registerPushToken(token, isIOS ? 'ios' : 'android', deviceId: deviceId);
  }

  /// Call on logout so this device stops receiving push for an account
  /// it's no longer signed into.
  Future<void> unregister() async {
    if (!isMobile) return;
    try {
      final token = await FirebaseMessaging.instance.getToken();
      if (token != null) await KodaApi.instance.unregisterPushToken(token);
    } catch (_) {}
  }
}
