// lib/shared/tier_badge.dart
//
// Visual assets for the Spark/Pulse subscription tiers (see
// lib/features/marketplace/marketplace_screen.dart) -- a small profile
// badge and a decorative avatar frame per tier. These are hand-drawn
// placeholder SVGs (assets/badges/, assets/frames/), deliberately simple
// "clip art" quality: swap the files for real designed assets later
// without touching any Dart code, since everything here just resolves a
// tier string to a fixed asset path.

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

String? _badgeAssetFor(String? tier) => switch (tier) {
      'spark' => 'assets/badges/spark_badge.svg',
      'pulse' => 'assets/badges/pulse_badge.svg',
      _ => null,
    };

String? _frameAssetFor(String? tier) => switch (tier) {
      'spark' => 'assets/frames/spark_frame.svg',
      'pulse' => 'assets/frames/pulse_frame.svg',
      _ => null,
    };

String _tierLabel(String tier) => switch (tier) {
      'spark' => 'Spark subscriber',
      'pulse' => 'Pulse subscriber',
      _ => '',
    };

/// A small circular badge for [tier] ('spark'/'pulse'), or nothing for
/// 'free'/null -- meant to sit next to a username, matching Discord's
/// Nitro-badge-next-to-name pattern.
class TierBadge extends StatelessWidget {
  final String? tier;
  final double size;
  const TierBadge({super.key, required this.tier, this.size = 14});

  @override
  Widget build(BuildContext context) {
    final asset = _badgeAssetFor(tier);
    if (asset == null) return const SizedBox.shrink();
    return Tooltip(
      message: _tierLabel(tier!),
      child: SvgPicture.asset(asset, width: size, height: size),
    );
  }
}

/// Wraps [child] (expected to be a circular avatar of [avatarSize]) with
/// [tier]'s decorative ring when the tier has one, otherwise returns
/// [child] unchanged. The frame asset is drawn ~20% larger than the
/// avatar so its ring sits just outside the avatar's edge.
class TierFramedAvatar extends StatelessWidget {
  final String? tier;
  final double avatarSize;
  final Widget child;
  const TierFramedAvatar({
    super.key,
    required this.tier,
    required this.avatarSize,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final asset = _frameAssetFor(tier);
    if (asset == null) return child;
    final frameSize = avatarSize * 1.22;
    return SizedBox(
      width: frameSize,
      height: frameSize,
      child: Stack(alignment: Alignment.center, children: [
        SizedBox(width: avatarSize, height: avatarSize, child: child),
        IgnorePointer(
          child: SvgPicture.asset(asset, width: frameSize, height: frameSize),
        ),
      ]),
    );
  }
}
