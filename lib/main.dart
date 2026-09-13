// lib/main.dart

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:audio_session/audio_session.dart';
import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:window_manager/window_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/api.dart';
import 'core/platform.dart';
import 'core/providers.dart';
import 'core/theme.dart';
import 'features/auth/auth_screen.dart';
import 'features/home/home_screen.dart';
import 'features/voice/pop_out_video_window.dart';

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
  @override
  void initState() {
    super.initState();
    _checkSession();
  }

  Future<void> _checkSession() async {
    await KodaApi.instance.loadStoredToken();
    if (KodaApi.instance.hasToken) {
      final me = await KodaApi.instance.me();
      if (me != null && mounted) {
        ref.read(authProvider.notifier).setUser(me['user']);
        return;
      }
    }
    if (mounted) ref.read(authProvider.notifier).doneLoading();
  }

  @override
  Widget build(BuildContext context) {
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

