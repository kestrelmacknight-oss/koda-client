// lib/core/background_sync.dart
//
// Push-triggered background message sync (mobile only). Today, a push
// arriving while the app is backgrounded or killed does nothing but
// show the OS tray notification -- no app code runs, so reopening the
// app always means a fresh socket connect + fetch before anything
// shows. This closes that gap for the two push types that represent
// new message content: a channel mention and a DM.
//
// Scoped narrowly on purpose: every other push type (friend requests,
// payment confirmations, etc.) is completely untouched, still the
// normal notification+data shape handled entirely by the OS. Only
// Koda.Chat's notify_mention/5 and notify_dm_recipient/5 set
// `sync: true` server-side (see Koda.Push.do_send/6), which sends a
// data-only FCM message instead -- the only kind that reliably reaches
// this handler rather than being auto-displayed and swallowed by the
// OS. `content-available: 1` in that same payload's APNs block is what
// lets this run on iOS at all.
//
// firebaseBackgroundHandler runs in its own isolate (a Flutter/Firebase
// requirement for background delivery), spun up fresh with none of the
// main isolate's state -- it re-initializes Firebase and restores the
// auth token/user id from SecureStorage itself. The actual fetch →
// decrypt → cache chain it calls into (KodaApi, decryptMessages,
// DmSessionManager, SecureStorage) is already plain Dart with no
// Riverpod/widget-tree coupling, so nothing else needed to change for
// it to be callable from here.

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'api.dart';
import 'crypto/dm_session_manager.dart';
import 'message_utils.dart';
import 'secure_storage.dart';

const _syncNotificationChannel = AndroidNotificationChannel(
  'koda_sync', 'Messages',
  description: 'New mentions and direct messages',
  importance: Importance.high,
);

// Same fixed, plain-English strings Koda.Chat already hardcodes
// server-side for these two push types (push_title: "New mention" /
// "New message") -- not localized, same as every other push
// notification in this app today (none of them are), and this handler
// has no BuildContext to localize through even if they were.
const _titleByType = {
  'mention': 'New mention',
  'role_mention': 'New mention',
  'dm_message': 'New message',
};

@pragma('vm:entry-point')
Future<void> firebaseBackgroundHandler(RemoteMessage message) async {
  try {
    await Firebase.initializeApp();

    final token = await SecureStorage.loadToken();
    final myUserId = await SecureStorage.loadUserId();
    if (token == null || myUserId == null) return; // signed out -- nothing to sync
    KodaApi.instance.setToken(token);

    final type = message.data['type'] as String?;
    switch (type) {
      case 'mention':
      case 'role_mention':
        final channelId = message.data['channel_id'] as String?;
        if (channelId == null) return;
        final messages = await KodaApi.instance.getMessages(channelId);
        await decryptMessages(messages, channelId: channelId, myUserId: myUserId);
      case 'dm_message':
        final conversationId = message.data['conversation_id'] as String?;
        if (conversationId == null) return;
        await _syncDmConversation(conversationId);
      default:
        return; // not a sync-eligible type -- nothing to do
    }

    final title = _titleByType[type];
    if (title != null) await _showLocalNotification(title);
  } catch (_) {
    // Best-effort, same fail-safe convention push_notifications.dart's
    // init() already uses -- a sync failure must never crash the
    // background isolate or surface to the user as anything beyond
    // "the OS's own fallback tray entry for this push, same as before
    // this feature existed" (FCM still shows something for a data-only
    // message with no notification block on some OS/launcher
    // combinations; this handler just doesn't get to add the synced
    // local one on top).
  }
}

/// Decrypts and caches (via SecureStorage, same cache
/// _DmScreenState._decryptForDisplay already reads from) whatever's new
/// in this conversation. Deliberately doesn't reconstruct the full
/// display payload (attachment metadata, language detection, etc.) --
/// this handler has nothing to render, only a cache to warm so the UI
/// path finds it already there.
Future<void> _syncDmConversation(String conversationId) async {
  final myDeviceId = await SecureStorage.getOrCreateDeviceId();
  final messages = await KodaApi.instance.getDmMessages(conversationId, myDeviceId);
  for (final m in messages) {
    if (m['encrypted'] != true) continue;
    final cacheKey = (m['message_group_id'] as String?) ?? m['id'] as String?;
    if (cacheKey == null) continue;
    if (await SecureStorage.getCachedDecryptedContent(cacheKey) != null) continue;
    try {
      final plain = await DmSessionManager.instance
          .decryptReceived(conversationId: conversationId, message: m);
      await SecureStorage.cacheDecryptedContent(cacheKey, plain);
    } catch (_) {
      continue; // one undecryptable message shouldn't block the rest
    }
  }
}

Future<void> _showLocalNotification(String title) async {
  final plugin = FlutterLocalNotificationsPlugin();
  await plugin.initialize(const InitializationSettings(
    android: AndroidInitializationSettings('@mipmap/ic_launcher'),
    iOS: DarwinInitializationSettings(),
  ));
  await plugin
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(_syncNotificationChannel);

  await plugin.show(
    DateTime.now().millisecondsSinceEpoch ~/ 1000,
    title,
    null,
    NotificationDetails(
      android: AndroidNotificationDetails(
        _syncNotificationChannel.id, _syncNotificationChannel.name,
        channelDescription: _syncNotificationChannel.description,
        importance: Importance.high, priority: Priority.high,
      ),
      iOS: const DarwinNotificationDetails(),
    ),
  );
}
