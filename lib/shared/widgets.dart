// lib/shared/widgets.dart

import 'package:flutter/gestures.dart' show PointerDeviceKind;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../core/theme.dart';
import '../l10n/generated/app_localizations.dart';
import 'tier_badge.dart';

class KodaTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final bool autofocus;

  const KodaTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.keyboardType,
    this.onChanged,
    this.onSubmitted,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      autofocus: autofocus,
      textInputAction: onSubmitted != null ? TextInputAction.send : TextInputAction.newline,
      style: TextStyle(color: KodaColors.text1, fontSize: 14),
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
      ),
    );
  }
}

class KodaAvatar extends StatelessWidget {
  final String username;
  final double size;
  final String? avatarUrl;
  /// 'spark' | 'pulse' | 'free' | null -- see lib/shared/tier_badge.dart.
  /// Purely decorative; omit where the caller doesn't have tier info handy.
  final String? tier;

  const KodaAvatar({
    super.key,
    required this.username,
    this.size = 40,
    this.avatarUrl,
    this.tier,
  });

  @override
  Widget build(BuildContext context) {
    final avatar = (avatarUrl != null && avatarUrl!.isNotEmpty)
        ? ClipOval(
            child: Image.network(
              avatarUrl!,
              width: size,
              height: size,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => _initialCircle(),
            ),
          )
        : _initialCircle();
    // One label for the whole visual unit (frame + image/initial) --
    // ExcludeSemantics on the content stops the inner Image/Text from
    // also being announced as a separate, redundant node.
    final t = AppLocalizations.of(context);
    return Semantics(
      label: t.widgetsAvatarSemanticLabel(username),
      image: true,
      child: ExcludeSemantics(
        child: TierFramedAvatar(tier: tier, avatarSize: size, child: avatar),
      ),
    );
  }

  Widget _initialCircle() {
    final initial = username.isNotEmpty ? username[0].toUpperCase() : '?';
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [KodaColors.koda, KodaColors.mint],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(initial,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: size * 0.42)),
    );
  }
}

class KodaPrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool busy;

  const KodaPrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.busy = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: busy ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: KodaColors.koda,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: busy
            ? const SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(
                    strokeWidth: 2, color: Colors.white))
            : Text(label,
                style: const TextStyle(
                    fontWeight: FontWeight.w600, fontSize: 14)),
      ),
    );
  }
}

/// A tappable region that's also keyboard-focusable and activatable
/// (Tab to reach it, Enter/Space to trigger it), with a visible focus
/// ring -- accessibility Phase 4 (keyboard navigation). Use this in
/// place of the bare `Semantics(button: true, child: GestureDetector(...))`
/// pattern Phase 3 used: that gave screen readers a label but never
/// added a real focus node, so Tab still skipped right over it. Skip
/// this wrapper for anything already backed by a naturally-focusable
/// Material widget (InkWell, IconButton, ListTile, PopupMenuButton) --
/// those already get Tab/Enter for free.
class KodaTappable extends StatefulWidget {
  final VoidCallback onTap;
  /// Right-click, kept working exactly as before for callers migrating
  /// off a raw GestureDetector -- the position callers need for
  /// showMenu(...) comes from these TapUpDetails, same as today.
  final void Function(TapUpDetails)? onSecondaryTapUp;
  final String? semanticLabel;
  final BorderRadius? borderRadius;
  /// Forwarded to Semantics.selected -- e.g. the currently-open server
  /// in the rail, or the selected day in a calendar grid.
  final bool? selected;
  final Widget child;

  const KodaTappable({
    super.key,
    required this.onTap,
    this.onSecondaryTapUp,
    this.semanticLabel,
    this.borderRadius,
    this.selected,
    required this.child,
  });

  @override
  State<KodaTappable> createState() => _KodaTappableState();
}

class _OpenContextMenuIntent extends Intent {
  const _OpenContextMenuIntent();
}

class _KodaTappableState extends State<KodaTappable> {
  // FocusableActionDetector only flips this for keyboard-driven focus
  // (not a mouse click), matching how Material's own focus rings behave.
  bool _showFocusRing = false;

  @override
  Widget build(BuildContext context) {
    final radius = widget.borderRadius ?? BorderRadius.circular(6);
    return Semantics(
      button: true,
      selected: widget.selected,
      label: widget.semanticLabel,
      child: FocusableActionDetector(
        mouseCursor: SystemMouseCursors.click,
        onShowFocusHighlight: (show) {
          if (mounted) setState(() => _showFocusRing = show);
        },
        // Windows/Linux's standard "open the context menu for the
        // focused item" shortcuts -- the keyboard equivalent of a
        // right-click, for tap targets too compact for a visible
        // second trigger button (e.g. the 48x48 server rail icons).
        shortcuts: widget.onSecondaryTapUp == null
            ? null
            : const {
                SingleActivator(LogicalKeyboardKey.contextMenu): _OpenContextMenuIntent(),
                SingleActivator(LogicalKeyboardKey.f10, shift: true): _OpenContextMenuIntent(),
              },
        actions: {
          ActivateIntent: CallbackAction<ActivateIntent>(onInvoke: (_) {
            widget.onTap();
            return null;
          }),
          if (widget.onSecondaryTapUp != null)
            _OpenContextMenuIntent: CallbackAction<_OpenContextMenuIntent>(onInvoke: (_) {
              final box = context.findRenderObject() as RenderBox?;
              if (box != null) {
                final position = box.localToGlobal(box.size.center(Offset.zero));
                widget.onSecondaryTapUp!(
                    TapUpDetails(globalPosition: position, kind: PointerDeviceKind.unknown));
              }
              return null;
            }),
        },
        child: GestureDetector(
          onTap: widget.onTap,
          onSecondaryTapUp: widget.onSecondaryTapUp,
          child: ExcludeSemantics(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: radius,
                border: Border.all(
                  color: _showFocusRing ? KodaColors.koda : Colors.transparent,
                  width: 2,
                ),
              ),
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}

class KodaErrorBanner extends StatelessWidget {
  final String message;
  const KodaErrorBanner({super.key, required this.message});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(bottom: 14),
        decoration: BoxDecoration(
          color: KodaColors.accent.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: KodaColors.accent.withValues(alpha: 0.3)),
        ),
        child: Row(children: [
          Icon(Icons.error_outline, color: KodaColors.accent, size: 16),
          const SizedBox(width: 8),
          Expanded(
              child: Text(message,
                  style: TextStyle(
                      color: KodaColors.accent, fontSize: 12))),
        ]),
      );
}


