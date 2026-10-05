// lib/shared/tier_badge.dart
//
// Visual assets for the Spark/Pulse subscription tiers (see
// lib/features/marketplace/marketplace_screen.dart) -- a small profile
// badge and a decorative avatar frame per tier. These are hand-drawn
// placeholder SVGs (assets/badges/, assets/frames/), deliberately simple
// "clip art" quality: swap the files for real designed assets later
// without touching any Dart code, since everything here just resolves a
// tier string to a fixed asset path.
//
// Backer-reward badges/frames (see koda-server's
// Koda.Invites.apply_rewards/3) are additive on top of this: a user can
// own any number of them independently of whatever koda_tier they're
// currently on, so they're passed in as plain string lists rather than
// folded into the single tier switch above.

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../l10n/generated/app_localizations.dart';

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

const _rewardBadgeAssets = {
  'alpha_spark': 'assets/badges/alpha_spark_badge.svg',
  'founder': 'assets/badges/founder_badge.svg',
};

// Priority order when a user owns more than one reward frame -- only
// "founders_animated" exists today, but this stays a list (not a bare
// nullable) so a second one later just slots in without restructuring
// the lookup. Checked *before* the tier-derived frame, so earning a
// reward frame always shows it over whatever Spark/Pulse frame the
// account also has.
const _rewardFrameAssets = {
  'founders_animated': 'assets/frames/founders_animated_frame.svg',
};
const _rewardFramePriority = ['founders_animated'];

String? _rewardFrameAssetFor(List<String> ownedFrames) {
  for (final id in _rewardFramePriority) {
    if (ownedFrames.contains(id)) return _rewardFrameAssets[id];
  }
  return null;
}

// 'spark'/'pulse' stay as fixed internal lookup keys; only the
// display label needs to be localized, which needs a BuildContext.
String _tierLabel(AppLocalizations t, String tier) => switch (tier) {
      'spark' => t.tierBadgeSparkSubscriber,
      'pulse' => t.tierBadgePulseSubscriber,
      _ => '',
    };

String _rewardBadgeLabel(AppLocalizations t, String badge) => switch (badge) {
      'alpha_spark' => t.tierBadgeAlphaSpark,
      'founder' => t.tierBadgeFounder,
      _ => '',
    };

/// A small circular badge for [tier] ('spark'/'pulse'), or nothing for
/// 'free'/null -- meant to sit next to a username, matching Discord's
/// Nitro-badge-next-to-name pattern. [rewardBadges] (e.g. KodaUser.badges)
/// renders alongside it, one icon per owned backer-reward badge -- both
/// can show at once, since they're independent (a free-tier account can
/// still hold "alpha_spark" from a backer code).
class TierBadge extends StatelessWidget {
  final String? tier;
  final double size;
  final List<String> rewardBadges;
  const TierBadge({super.key, required this.tier, this.size = 14, this.rewardBadges = const []});

  @override
  Widget build(BuildContext context) {
    final tierAsset = _badgeAssetFor(tier);
    final rewards = [
      for (final b in rewardBadges)
        if (_rewardBadgeAssets[b] != null) (badge: b, asset: _rewardBadgeAssets[b]!)
    ];
    if (tierAsset == null && rewards.isEmpty) return const SizedBox.shrink();
    final t = AppLocalizations.of(context);
    return Row(mainAxisSize: MainAxisSize.min, children: [
      if (tierAsset != null)
        Padding(
          padding: EdgeInsets.only(right: rewards.isEmpty ? 0 : 3),
          child: Tooltip(
            message: _tierLabel(t, tier!),
            child: SvgPicture.asset(tierAsset, width: size, height: size),
          ),
        ),
      for (var i = 0; i < rewards.length; i++)
        Padding(
          padding: EdgeInsets.only(right: i == rewards.length - 1 ? 0 : 3),
          child: Tooltip(
            message: _rewardBadgeLabel(t, rewards[i].badge),
            child: SvgPicture.asset(rewards[i].asset, width: size, height: size),
          ),
        ),
    ]);
  }
}

/// Wraps [child] (expected to be a circular avatar of [avatarSize]) with
/// a decorative ring, otherwise returns [child] unchanged. A reward
/// frame (e.g. KodaUser.ownedFrames) always wins over [tier]'s own
/// frame when the user has both -- earning a backer reward should
/// never look like a downgrade from a Spark/Pulse frame they also have.
class TierFramedAvatar extends StatelessWidget {
  final String? tier;
  final double avatarSize;
  final Widget child;
  final List<String> ownedFrames;
  const TierFramedAvatar({
    super.key,
    required this.tier,
    required this.avatarSize,
    required this.child,
    this.ownedFrames = const [],
  });

  @override
  Widget build(BuildContext context) {
    final rewardAsset = _rewardFrameAssetFor(ownedFrames);
    final asset = rewardAsset ?? _frameAssetFor(tier);
    if (asset == null) return child;
    final frameSize = avatarSize * 1.22;
    final frame = rewardAsset != null
        ? _PulsingGlow(child: SvgPicture.asset(asset, width: frameSize, height: frameSize))
        : SvgPicture.asset(asset, width: frameSize, height: frameSize);
    return SizedBox(
      width: frameSize,
      height: frameSize,
      child: Stack(alignment: Alignment.center, children: [
        SizedBox(width: avatarSize, height: avatarSize, child: child),
        IgnorePointer(child: frame),
      ]),
    );
  }
}

/// The "animated" half of founders_animated_frame.svg -- a slow,
/// continuous glow pulse (opacity + slight scale) rather than anything
/// that needs real motion-graphics work, matching every other asset
/// here's "simple placeholder, swap later" scope.
class _PulsingGlow extends StatefulWidget {
  final Widget child;
  const _PulsingGlow({required this.child});
  @override
  State<_PulsingGlow> createState() => _PulsingGlowState();
}

class _PulsingGlowState extends State<_PulsingGlow> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this, duration: const Duration(seconds: 2))..repeat(reverse: true);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final t = _controller.value;
        return Opacity(
          opacity: 0.75 + 0.25 * t,
          child: Transform.scale(scale: 1.0 + 0.04 * t, child: child),
        );
      },
      child: widget.child,
    );
  }
}
