// lib/features/home/gif_picker_dialog.dart
//
// Giphy search/trending grid. Picking a GIF just returns its URL -- the
// caller sends it as a normal attachment (attachment_content_type:
// image/gif), reusing the existing attachment pipeline rather than
// needing anything GIF-specific downstream.

import 'dart:async';
import 'package:flutter/material.dart';
import '../../core/api.dart';
import '../../core/theme.dart';
import '../../shared/widgets.dart';

class GifPickerDialog extends StatefulWidget {
  const GifPickerDialog({super.key});
  @override
  State<GifPickerDialog> createState() => _GifPickerDialogState();
}

class _GifPickerDialogState extends State<GifPickerDialog> {
  final _queryCtrl = TextEditingController();
  List<Map<String, dynamic>> _gifs = [];
  bool _loading = true;
  String? _error;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _load(trending: true);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _queryCtrl.dispose();
    super.dispose();
  }

  Future<void> _load({bool trending = false}) async {
    setState(() { _loading = true; _error = null; });
    final query = _queryCtrl.text.trim();
    final result = trending || query.isEmpty
        ? await KodaApi.instance.getTrendingGifs()
        : await KodaApi.instance.searchGifs(query);
    if (!mounted) return;
    setState(() {
      _gifs = result.data ?? [];
      _loading = false;
      // Surface the server's actual reason (e.g. "GIF search is not
      // configured" if GIPHY_API_KEY is missing/wrong) rather than a
      // generic "no results" message that looks identical to a real
      // empty search -- that ambiguity was the whole reason this was
      // hard to diagnose before.
      _error = _gifs.isEmpty ? (result.errorCode ?? 'No GIFs found') : null;
    });
  }

  void _onQueryChanged(String _) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 400), () => _load());
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: KodaColors.card,
      child: SizedBox(
        width: 440,
        height: 480,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: KodaTextField(
              controller: _queryCtrl,
              hintText: 'Search GIFs...',
              onChanged: _onQueryChanged,
              onSubmitted: (_) => _load(),
            ),
          ),
          const Divider(color: KodaColors.border, height: 1),
          Expanded(
            child: _loading
                ? const Center(child: CircularProgressIndicator(color: KodaColors.koda))
                : _gifs.isEmpty
                    ? Center(child: Text(_error ?? 'No GIFs found',
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: KodaColors.text3, fontSize: 12)))
                    : GridView.builder(
                        padding: const EdgeInsets.all(12),
                        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 150,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          childAspectRatio: 1,
                        ),
                        itemCount: _gifs.length,
                        itemBuilder: (_, i) {
                          final g = _gifs[i];
                          return InkWell(
                            borderRadius: BorderRadius.circular(8),
                            onTap: () => Navigator.pop(context, g),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                g['preview_url'] as String? ?? g['url'] as String? ?? '',
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) => Container(
                                    color: KodaColors.elevated,
                                    child: const Icon(Icons.broken_image_outlined,
                                        color: KodaColors.text3)),
                              ),
                            ),
                          );
                        },
                      ),
          ),
        ]),
      ),
    );
  }
}
