// lib/main.dart
//
// Koda Alpha v0.34 -- entry point.
// On launch: load any stored token, verify it against api.koda.fyi,
// and route to either the main app or the sign-in screen.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/api.dart';
import 'core/config.dart';
import 'package:url_launcher/url_launcher.dart';
import 'core/providers.dart';
import 'core/theme.dart';
import 'features/auth/auth_screen.dart';
import 'features/home/home_screen.dart';

void main() {
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

/// Checks for a stored session on launch and routes accordingly.
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
    _checkVersion();
  }

  Future<void> _checkVersion() async {
    final info = await KodaApi.instance.checkVersion();
    if (info == null || !mounted) return;
    final serverVersion = info['version'] as String? ?? '';
    final required = info['required'] == true;
    final downloadUrl = info['download_url'] as String? ?? 'https://koda.fyi/download';
    final notes = info['release_notes'] as String? ?? '';
    if (serverVersion == KodaConfig.appVersion && !required) return;
    if (serverVersion.isEmpty) return;
    showDialog(
      context: context,
      barrierDismissible: !required,
      builder: (_) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: Row(children: [
          const Icon(Icons.system_update, color: KodaColors.koda, size: 20),
          const SizedBox(width: 8),
          Text(required ? 'Update Required' : 'Update Available',
              style: const TextStyle(color: KodaColors.text1, fontSize: 16)),
        ]),
        content: Column(mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Version ${serverVersion} is available.',
              style: const TextStyle(color: KodaColors.text2, fontSize: 13)),
          if (notes.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(notes, style: const TextStyle(
                color: KodaColors.text3, fontSize: 12)),
          ],
          if (required) ...[
            const SizedBox(height: 10),
            const Text('This update is required to continue using Koda.',
                style: TextStyle(color: KodaColors.accent, fontSize: 12)),
          ],
        ]),
        actions: [
          if (!required)
            TextButton(onPressed: () => Navigator.pop(context),
                child: const Text('Later')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: KodaColors.koda,
                foregroundColor: Colors.black),
            onPressed: () async {
              final uri = Uri.parse(downloadUrl);
              if (await canLaunchUrl(uri)) await launchUrl(uri,
                  mode: LaunchMode.externalApplication);
            },
            child: const Text('Download Update'),
          ),
        ],
      ),
    );
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


