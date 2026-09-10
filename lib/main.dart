// lib/main.dart
//
// Koda Alpha v0.34 -- entry point.
// On launch: load any stored token, verify it against api.koda.fyi,
// and route to either the main app or the sign-in screen.

import 'package:flutter/material.dart';
import 'package:audio_session/audio_session.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/api.dart';
import 'core/providers.dart';
import 'core/theme.dart';
import 'features/auth/auth_screen.dart';
import 'features/home/home_screen.dart';
import 'package:audio_session/audio_session.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Prevent Windows from ducking other app audio when Koda voice is active.
  // Using media usage instead of communications category.
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
        backgroundColor: KodaColors.voidBg,
        body: Center(child: CircularProgressIndicator(color: KodaColors.koda)),
      );
    }

    return auth.user == null ? const AuthScreen() : const HomeScreen();
  }
}


