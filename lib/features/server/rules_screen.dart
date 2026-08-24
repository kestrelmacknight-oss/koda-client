// lib/features/server/rules_screen.dart
//
// Shown as a modal when a user joins a server that has a rules channel.
// User must accept before accessing any channels.
// Admins/mods can edit the rules content from server settings.

import 'package:flutter/material.dart';
import '../../core/api.dart';
import '../../core/theme.dart';

class RulesScreen extends StatefulWidget {
  final String serverId;
  final String serverName;
  final String rulesContent;
  final VoidCallback onAccepted;

  const RulesScreen({
    super.key,
    required this.serverId,
    required this.serverName,
    required this.rulesContent,
    required this.onAccepted,
  });

  @override
  State<RulesScreen> createState() => _RulesScreenState();
}

class _RulesScreenState extends State<RulesScreen> {
  bool _loading = false;
  bool _scrolledToBottom = false;
  final _scroll = ScrollController();

  @override
  void initState() {
    super.initState();
    _scroll.addListener(() {
      if (_scroll.position.pixels >= _scroll.position.maxScrollExtent - 40) {
        if (!_scrolledToBottom) setState(() => _scrolledToBottom = true);
      }
    });
    // Auto-enable if rules are short
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scroll.position.maxScrollExtent == 0) {
        setState(() => _scrolledToBottom = true);
      }
    });
  }

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  Future<void> _accept() async {
    setState(() => _loading = true);
    final ok = await KodaApi.instance.acceptRules(widget.serverId);
    if (!mounted) return;
    if (ok) {
      widget.onAccepted();
    } else {
      setState(() => _loading = false);
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not accept rules. Try again.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KodaColors.voidBg,
      appBar: AppBar(
        backgroundColor: KodaColors.bg2,
        automaticallyImplyLeading: false,
        title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(widget.serverName,
              style: const TextStyle(color: KodaColors.text1,
                  fontSize: 15, fontWeight: FontWeight.w700)),
          const Text('Server Rules',
              style: TextStyle(color: KodaColors.text3, fontSize: 11)),
        ]),
      ),
      body: Column(children: [
        // Rules content
        Expanded(
          child: SingleChildScrollView(
            controller: _scroll,
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: KodaColors.card,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: KodaColors.border),
                  ),
                  child: Text(
                    widget.rulesContent,
                    style: const TextStyle(
                        color: KodaColors.text1,
                        fontSize: 14,
                        height: 1.6),
                  ),
                ),
                if (!_scrolledToBottom) ...[
                  const SizedBox(height: 12),
                  const Center(
                    child: Text('Scroll down to read all rules',
                        style: TextStyle(color: KodaColors.text3, fontSize: 12)),
                  ),
                ],
              ],
            ),
          ),
        ),

        // Accept bar
        Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: KodaColors.border))),
          child: Column(children: [
            const Text(
              'By clicking Accept, you agree to follow these rules.\nViolations may result in removal from the server.',
              textAlign: TextAlign.center,
              style: TextStyle(color: KodaColors.text3, fontSize: 11),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _scrolledToBottom
                      ? KodaColors.koda
                      : KodaColors.elevated,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: (_scrolledToBottom && !_loading) ? _accept : null,
                child: _loading
                    ? const SizedBox(width: 18, height: 18,
                        child: CircularProgressIndicator(
                            strokeWidth: 2, color: Colors.white))
                    : Text(
                        _scrolledToBottom
                            ? 'I Accept the Rules'
                            : 'Read all rules to continue',
                        style: TextStyle(
                            color: _scrolledToBottom
                                ? Colors.black
                                : KodaColors.text3,
                            fontWeight: FontWeight.w700),
                      ),
              ),
            ),
          ]),
        ),
      ]),
    );
  }
}