// lib/features/visp/visp_avatar.dart
//
// Visp's visual identity: the circular brand mark (assets/visp/visp_avatar.png)
// with a slow ambient glow, and a kaomoji "face" overlaid directly on top
// of the badge -- that overlay IS Visp's face, reacting to its current
// state (thinking, asking a clarifying question, plan/answer ready,
// error). The kaomoji is plain text (not baked into the image) sitting
// on a small translucent scrim for legibility against the bright badge
// art underneath -- swapping a text string per VispMood is trivial and
// scales to any size via FittedBox, where trying to swap in different
// raster/vector face art wouldn't be. There's no real "smoke"
// reanimation here (that would need layered source art this single
// flattened PNG doesn't have) -- the glow pulse is the honest substitute
// for that at this pass.
//
// Visibility is a per-device preference (VispAvatarPrefs, off toggle
// lives in Settings > My Account) -- callers check
// VispAvatarPrefs.isEnabled() themselves and fall back to the plain
// Icons.auto_awesome sparkle when disabled, same as before this avatar
// existed.

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/theme.dart';

const _kShowVispAvatarKey = 'koda_show_visp_avatar';

class VispAvatarPrefs {
  VispAvatarPrefs._();

  /// Defaults to true (shown) -- see this file's header for why hiding
  /// it is opt-out, not opt-in.
  static Future<bool> isEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_kShowVispAvatarKey) ?? true;
  }

  static Future<void> setEnabled(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kShowVispAvatarKey, value);
  }
}

/// Small "In Development" pill shown wherever Visp is actually invoked
/// (dialog headers, the Boost ROI advisor) -- Visp depends on a
/// self-hosted Ollama instance that isn't yet reachable from production
/// (see koda-server's runtime.exs), so responses can be flaky or
/// unavailable while that gets sorted out and the model itself keeps
/// getting tuned locally. This is purely a "manage expectations" label,
/// not a feature gate -- Visp still works whenever Ollama is reachable.
class VispDevBadge extends StatelessWidget {
  const VispDevBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: KodaColors.koda.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: KodaColors.koda.withValues(alpha: 0.4)),
      ),
      child: Text('IN DEVELOPMENT',
          style: TextStyle(color: KodaColors.koda, fontSize: 9,
              fontWeight: FontWeight.w700, letterSpacing: 0.4)),
    );
  }
}

enum VispMood { idle, thinking, asking, planReady, error }

/// Plain-text kaomoji per mood -- this is Visp's "face". Kept as a pure
/// function (not baked into VispAvatar itself) so callers can lay it out
/// however fits their surface -- as a subtitle under the avatar, inline
/// next to a title, etc.
String vispKaomoji(VispMood mood) {
  switch (mood) {
    case VispMood.idle:      return '( ◡‿◡ )';
    case VispMood.thinking:  return '( ・_・)..';
    case VispMood.asking:    return '( ⚈▽⚈ )?';
    case VispMood.planReady: return '(๑˃ᴗ˂)ﻭ';
    case VispMood.error:     return '(╥﹏╥)';
  }
}

class VispAvatar extends StatefulWidget {
  final double size;
  /// null means "just the badge, no face" -- every current call site
  /// passes a real mood, but this stays optional for any future spot
  /// that wants the plain circular mark on its own.
  final VispMood? mood;
  const VispAvatar({super.key, this.size = 36, this.mood});

  @override
  State<VispAvatar> createState() => _VispAvatarState();
}

class _VispAvatarState extends State<VispAvatar> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 3))
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mood = widget.mood;
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final glow = 0.35 + _controller.value * 0.35;
        return Container(
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: KodaColors.koda.withValues(alpha: glow * 0.5),
                blurRadius: widget.size * 0.4,
                spreadRadius: widget.size * 0.05,
              ),
            ],
          ),
          child: child,
        );
      },
      child: ClipOval(
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/visp/visp_avatar.png',
              fit: BoxFit.cover,
              width: widget.size,
              height: widget.size,
            ),
            if (mood != null) _FaceOverlay(size: widget.size, mood: mood),
          ],
        ),
      ),
    );
  }
}

/// The kaomoji, centered on the badge on a small translucent dark scrim
/// so it reads clearly against the bright logo art underneath. Padding
/// and font size both scale with [size] so this holds up from a small
/// inline icon replacement up to a large dialog-header avatar; FittedBox
/// guarantees the (variable-length) kaomoji string never overflows the
/// circle at any size.
class _FaceOverlay extends StatelessWidget {
  final double size;
  final VispMood mood;
  const _FaceOverlay({required this.size, required this.mood});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(size * 0.09),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: size * 0.06, vertical: size * 0.03),
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.6),
          borderRadius: BorderRadius.circular(size),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            vispKaomoji(mood),
            maxLines: 1,
            style: TextStyle(
              color: Colors.white,
              fontSize: size * 0.4,
              fontWeight: FontWeight.w600,
              height: 1,
            ),
          ),
        ),
      ),
    );
  }
}
