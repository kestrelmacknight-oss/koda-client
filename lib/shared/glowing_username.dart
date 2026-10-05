// lib/shared/glowing_username.dart
//
// Username glow effects (see koda-server's Koda.Invites.apply_rewards/3,
// the "titan_glow" backer reward) -- fully new, no prior art to extend.
// "titan" is the only glow today, but [glows] is a list (KodaUser.glows)
// so a second one later is just another case in _glowGradientFor, not a
// restructure. Renders the plain [child] unchanged when the owner has
// no glow, so every existing call site stays visually identical until
// someone actually earns one.

import 'package:flutter/material.dart';

List<Color>? _glowGradientFor(List<String> glows) {
  if (glows.contains('titan')) {
    return const [Color(0xFFFFF3C4), Color(0xFFFFD36B), Color(0xFFFFF3C4)];
  }
  return null;
}

/// Wraps [child] (expected to be a `Text` showing a username/display
/// name) in a slow-moving shimmer gradient when [glows] names an owned
/// glow effect. A continuous, gentle animation -- not flashy enough to
/// be distracting in a message list, just enough to read as "this
/// person's name is special."
class GlowingUsername extends StatefulWidget {
  final List<String> glows;
  final Widget child;
  const GlowingUsername({super.key, required this.glows, required this.child});

  @override
  State<GlowingUsername> createState() => _GlowingUsernameState();
}

class _GlowingUsernameState extends State<GlowingUsername> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this, duration: const Duration(seconds: 3))..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = _glowGradientFor(widget.glows);
    if (colors == null) return widget.child;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) {
            // Slides the gradient across the text's own width over the
            // animation's full cycle -- a continuous shimmer rather than
            // a static tri-color fill.
            final shift = _controller.value * bounds.width * 2 - bounds.width;
            return LinearGradient(
              colors: colors,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              transform: _SlideGradient(shift),
            ).createShader(bounds);
          },
          child: child,
        );
      },
      child: widget.child,
    );
  }
}

class _SlideGradient extends GradientTransform {
  final double dx;
  const _SlideGradient(this.dx);
  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) => Matrix4.translationValues(dx, 0, 0);
}
