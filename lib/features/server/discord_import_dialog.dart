// lib/features/server/discord_import_dialog.dart

import 'package:flutter/material.dart';
import '../../core/api.dart';
import '../../core/theme.dart';
import '../../shared/widgets.dart';

class DiscordImportDialog extends StatefulWidget {
  final String serverId;
  final VoidCallback onImported;

  const DiscordImportDialog({
    super.key,
    required this.serverId,
    required this.onImported,
  });

  @override
  State<DiscordImportDialog> createState() => _DiscordImportDialogState();
}

class _DiscordImportDialogState extends State<DiscordImportDialog> {
  final _codeCtrl = TextEditingController();
  bool _replace      = false;
  bool _loading      = false;
  bool _previewed    = false;
  Map<String, dynamic>? _previewData;
  String? _error;

  @override
  void dispose() {
    _codeCtrl.dispose();
    super.dispose();
  }

  String _extractCode(String input) {
    final trimmed = input.trim();
    if (trimmed.contains('discord.new/')) {
      return trimmed.split('discord.new/').last.split('/').first.trim();
    }
    if (trimmed.contains('/template/')) {
      return trimmed.split('/template/').last.split('/').first.trim();
    }
    return trimmed;
  }

  Future<void> _fetchPreview() async {
    final code = _extractCode(_codeCtrl.text);
    if (code.isEmpty) return;
    setState(() { _loading = true; _error = null; _previewData = null; });

    final result = await KodaApi.instance.previewDiscordTemplate(code);
    if (!mounted) return;

    if (result != null && result['ok'] == true) {
      setState(() {
        _previewData = result['template'] as Map<String, dynamic>?;
        _previewed   = true;
        _loading     = false;
      });
    } else {
      setState(() {
        _error   = result?['error'] as String? ?? 'Could not fetch template.';
        _loading = false;
      });
    }
  }

  Future<void> _apply() async {
    if (_previewData == null) return;
    setState(() { _loading = true; _error = null; });

    final code   = _extractCode(_codeCtrl.text);
    final result = await KodaApi.instance.applyDiscordTemplate(
      serverId: widget.serverId,
      code:     code,
      replace:  _replace,
    );

    if (!mounted) return;
    if (result == true) {
      Navigator.pop(context);
      widget.onImported();
    } else {
      setState(() {
        _error   = 'Failed to apply template. Please try again.';
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final preview = _previewData;

    return Dialog(
      backgroundColor: KodaColors.card,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 520),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(children: [
                const Icon(Icons.download_outlined, color: KodaColors.koda, size: 20),
                const SizedBox(width: 10),
                const Text('Import Discord Template',
                    style: TextStyle(color: KodaColors.text1, fontSize: 16,
                        fontWeight: FontWeight.w700)),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.close, size: 18, color: KodaColors.text3),
                  onPressed: () => Navigator.pop(context),
                ),
              ]),
              const SizedBox(height: 6),
              const Text(
                'Paste a discord.new link or template code to import '
                'roles, categories, and channels into this server.',
                style: TextStyle(color: KodaColors.text3, fontSize: 12),
              ),
              const SizedBox(height: 20),

              // Code input
              Row(children: [
                Expanded(
                  child: KodaTextField(
                    controller: _codeCtrl,
                    hintText: 'discord.new/ABC123 or template code',
                    onSubmitted: (_) => _fetchPreview(),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: KodaColors.elevated,
                    foregroundColor: KodaColors.text1,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
                  onPressed: _loading ? null : _fetchPreview,
                  child: const Text('Preview'),
                ),
              ]),

              // Error
              if (_error != null) ...[
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: KodaColors.accent.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: KodaColors.accent.withOpacity(0.3)),
                  ),
                  child: Text(_error!,
                      style: const TextStyle(color: KodaColors.accent, fontSize: 12)),
                ),
              ],

              // Preview panel
              if (preview != null) ...[
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: KodaColors.elevated,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: KodaColors.border),
                  ),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(preview['name'] as String? ?? 'Template',
                        style: const TextStyle(color: KodaColors.text1,
                            fontWeight: FontWeight.w600, fontSize: 14)),
                    const SizedBox(height: 10),
                    _previewRow(Icons.shield_outlined,
                        '${(preview['roles'] as List).length} roles'),
                    _previewRow(Icons.folder_outlined,
                        '${(preview['categories'] as List).length} categories'),
                    _previewRow(Icons.tag,
                        '${(preview['channels'] as List).length} channels'),
                  ]),
                ),

                const SizedBox(height: 20),

                // Replace toggle -- bold, red, distinct
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: _replace
                        ? KodaColors.accent.withOpacity(0.12)
                        : KodaColors.elevated,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: _replace
                          ? KodaColors.accent.withOpacity(0.5)
                          : KodaColors.border,
                      width: _replace ? 1.5 : 1,
                    ),
                  ),
                  child: Row(children: [
                    Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(
                          'REPLACE EXISTING STRUCTURE',
                          style: TextStyle(
                            color: _replace ? KodaColors.accent : KodaColors.text2,
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          _replace
                              ? 'All existing channels, categories and roles will be permanently deleted.'
                              : 'Template will be added to your existing server structure.',
                          style: TextStyle(
                            color: _replace
                                ? KodaColors.accent.withOpacity(0.8)
                                : KodaColors.text3,
                            fontSize: 11,
                          ),
                        ),
                      ]),
                    ),
                    Switch(
                      value: _replace,
                      activeColor: KodaColors.accent,
                      onChanged: (v) async {
                        if (v) {
                          final confirmed = await showDialog<bool>(
                            context: context,
                            builder: (_) => AlertDialog(
                              backgroundColor: KodaColors.card,
                              title: const Text('Replace server structure?',
                                  style: TextStyle(color: KodaColors.accent)),
                              content: const Text(
                                'This will permanently delete ALL existing channels, '
                                'categories, and roles before importing. '
                                'This cannot be undone.',
                                style: TextStyle(color: KodaColors.text2, fontSize: 13),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context, false),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pop(context, true),
                                  child: const Text('Yes, Replace',
                                      style: TextStyle(color: KodaColors.accent,
                                          fontWeight: FontWeight.w700)),
                                ),
                              ],
                            ),
                          );
                          if (mounted) setState(() => _replace = confirmed ?? false);
                        } else {
                          setState(() => _replace = false);
                        }
                      },
                    ),
                  ]),
                ),

                const SizedBox(height: 20),

                // Apply button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: KodaColors.koda,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: _loading ? null : _apply,
                    child: _loading
                        ? const SizedBox(width: 18, height: 18,
                            child: CircularProgressIndicator(
                                strokeWidth: 2, color: Colors.white))
                        : Text(
                            _replace
                                ? 'Replace & Import Template'
                                : 'Add Template to Server',
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          ),
                  ),
                ),
              ],

              if (_loading && !_previewed) ...[
                const SizedBox(height: 20),
                const Center(child: CircularProgressIndicator(color: KodaColors.koda)),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _previewRow(IconData icon, String text) => Padding(
    padding: const EdgeInsets.only(bottom: 5),
    child: Row(children: [
      Icon(icon, size: 14, color: KodaColors.text3),
      const SizedBox(width: 6),
      Text(text, style: const TextStyle(color: KodaColors.text2, fontSize: 12)),
    ]),
  );
}