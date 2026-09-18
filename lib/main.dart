// lib/main.dart

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:audio_session/audio_session.dart';
import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:window_manager/window_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/api.dart';
import 'core/crypto/dm_session_manager.dart';
import 'core/platform.dart';
import 'core/providers.dart';
import 'core/push_notifications.dart';
import 'core/socket.dart';
import 'core/theme.dart';
import 'core/tray_service.dart';
import 'features/auth/auth_screen.dart';
import 'features/auth/child_lockout_screen.dart';
import 'features/home/home_screen.dart';
import 'features/voice/pop_out_video_window.dart';
import 'shared/update_nudge.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  if (isDesktop) {
    // Check if this is a pop-out window BEFORE initializing window_manager
    // window_manager only works in the main Flutter engine
    final windowController = await WindowController.fromCurrentEngine();
    final rawArgs = windowController.arguments;
    final arguments = rawArgs.isNotEmpty
        ? Map<String, dynamic>.from(jsonDecode(rawArgs))
        : <String, dynamic>{};

    if (arguments['type'] == 'voice_popout') {
      // Pop-out window -- don't initialize window_manager
      runApp(ProviderScope(child: PopOutVideoWindow(
        windowId: windowController.windowId,
        arguments: rawArgs,
      )));
      return;
    }

    // Main window only
    await windowManager.ensureInitialized();
    const windowOptions = WindowOptions(
      center: true,
      title: 'Koda',
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });

    await TrayService.instance.init();
  }

  try {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration(
      androidAudioAttributes: AndroidAudioAttributes(
        contentType: AndroidAudioContentType.music,
        flags: AndroidAudioFlags.none,
        usage: AndroidAudioUsage.media,
      ),
      androidAudioFocusGainType: AndroidAudioFocusGainType.gain,
      androidWillPauseWhenDucked: false,
    ));
  } catch (_) {}

  runApp(const ProviderScope(child: KodaApp()));
}

class KodaApp extends StatelessWidget {
  const KodaApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Koda',
      debugShowCheckedModeBanner: false,
      theme: kodaTheme(),
      home: const AuthGate(),
    );
  }
}

class AuthGate extends ConsumerStatefulWidget {
  const AuthGate({super.key});
  @override
  ConsumerState<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends ConsumerState<AuthGate> {
  bool _lockedOut = false;
  StreamSubscription<void>? _lockoutSub;
  StreamSubscription<void>? _socketCloseSub;

  @override
  void initState() {
    super.initState();
    _checkSession();

    // Public, no-auth endpoint -- runs regardless of login state, so an
    // old build gets nudged whether or not the person's signed in yet.
    // Post-frame so the Navigator this needs is definitely ready (this
    // widget IS MaterialApp's `home`, so there's no Navigator above it
    // to rely on any earlier than that).
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) maybeShowUpdateNudge(context);
    });

    // Fires when any request comes back 403 outside_allowed_hours --
    // covers the case where a child's account gets locked out mid-use
    // (schedule window closes) while some screen other than login is on
    // top. See KodaApi.lockoutStream's doc comment.
    _lockoutSub = KodaApi.instance.lockoutStream.listen((_) {
      if (mounted) setState(() => _lockedOut = true);
      ref.read(authProvider.notifier).doneLoading();
    });

    // A live child session can be force-disconnected the instant their
    // window closes (koda-server's Koda.Parental.ScheduleSweeper), but
    // the socket close event itself carries no reason. Ask /auth/me --
    // it's gated by the same schedule check, so if that's what happened
    // it'll push onto lockoutStream above. Harmless no-op for every
    // ordinary disconnect (network blip, backgrounding, logout, etc.),
    // and only bothered for child sessions in the first place.
    _socketCloseSub = KodaSocket.instance.closeEvents.listen((_) {
      if (KodaApi.instance.hasToken && ref.read(authProvider).user?.isChild == true) {
        KodaApi.instance.me();
      }
    });
  }

  @override
  void dispose() {
    _lockoutSub?.cancel();
    _socketCloseSub?.cancel();
    super.dispose();
  }

  Future<void> _checkSession() async {
    await KodaApi.instance.loadStoredToken();
    if (KodaApi.instance.hasToken) {
      final result = await KodaApi.instance.me();
      if (result.ok && mounted) {
        ref.read(authProvider.notifier).setUser(result.data!['user']);
        // Returning to an already-logged-in session (app relaunch with a
        // stored token, no auth_screen involved) -- this is the one
        // choke point that covers that path, so it's also where SPK
        // rotation gets checked on every launch. Both are cheap no-ops
        // when there's nothing to do, and non-fatal: DMs just keep using
        // whatever keys are already on record until a later launch
        // succeeds.
        unawaited(() async {
          try {
            await DmSessionManager.instance.ensureMyKeysExist();
            await DmSessionManager.instance.rotateSignedPrekeyIfDue();
          } catch (_) {}
        }());
        return;
      }
      if (result.isOutsideAllowedHours && mounted) {
        setState(() => _lockedOut = true);
        ref.read(authProvider.notifier).doneLoading();
        return;
      }
    }
    if (mounted) ref.read(authProvider.notifier).doneLoading();
  }

  void _handleLockoutLogout() {
    unawaited(() async {
      // Unregister before logout() clears the token -- unregistering needs auth.
      await PushNotifications.instance.unregister();
      await KodaApi.instance.logout();
    }());
    ref.read(authProvider.notifier).clear();
    setState(() => _lockedOut = false);
  }

  @override
  Widget build(BuildContext context) {
    if (_lockedOut) {
      return ChildLockoutScreen(onLogout: _handleLockoutLogout);
    }
    final auth = ref.watch(authProvider);
    if (auth.loading) {
      return const Scaffold(
        backgroundColor: Color(0xFF0d0e1a),
        body: Center(child: CircularProgressIndicator(color: Color(0xFF2DD4A0))),
      );
    }
    return auth.user != null ? const HomeScreen() : const AuthScreen();
  }
}

