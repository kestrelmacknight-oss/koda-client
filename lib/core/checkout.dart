// lib/core/checkout.dart
//
// Shared "open Stripe Checkout in the browser, wait for confirmation"
// flow used by every paid flow (tips, Koda subscriptions, server
// subscriptions, digital goods, stage tickets). Desktop -- this app's
// actual primary platform -- has no native Stripe SDK, so payment is
// collected on Stripe's own hosted Checkout page in the system browser
// instead; this app never touches card data at all.
//
// Completion is detected through the existing notification pipeline: a
// "payment_confirmed" notification is pushed to the buyer's own socket
// topic once the server's webhook confirms the underlying PaymentIntent
// (see koda-server's Koda.Notifications.notify_and_push/5), and
// home_screen.dart's single existing socket listener already feeds every
// notification into notificationsProvider -- so waiting for one here is
// just watching that provider, not polling or a deep-link callback
// (neither exists on desktop).

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'notifications_provider.dart';
import 'theme.dart';

/// Opens [checkoutUrl] in the system browser, then shows a waiting
/// dialog until a "payment_confirmed" notification satisfying [matches]
/// arrives, or the user cancels. Returns true if payment was confirmed
/// while the dialog was open, false otherwise (cancelled, or the
/// browser couldn't be opened at all).
Future<bool> launchCheckoutAndWait(
  BuildContext context,
  WidgetRef ref, {
  required String checkoutUrl,
  required bool Function(Map<String, dynamic> data) matches,
}) async {
  final uri = Uri.tryParse(checkoutUrl);
  if (uri == null || !await canLaunchUrl(uri)) return false;
  await launchUrl(uri, mode: LaunchMode.externalApplication);
  if (!context.mounted) return false;

  final result = await showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (_) => _CheckoutWaitDialog(matches: matches),
  );
  return result ?? false;
}

class _CheckoutWaitDialog extends ConsumerWidget {
  final bool Function(Map<String, dynamic> data) matches;
  const _CheckoutWaitDialog({required this.matches});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(notificationsProvider, (previous, next) {
      final grew = next.notifications.length > (previous?.notifications.length ?? 0);
      if (!grew) return;
      final latest = next.notifications.first;
      if (latest['type'] != 'payment_confirmed') return;
      final data = latest['data'] as Map<String, dynamic>? ?? {};
      if (matches(data) && Navigator.of(context).canPop()) {
        Navigator.of(context).pop(true);
      }
    });

    return PopScope(
      canPop: false,
      child: AlertDialog(
        backgroundColor: KodaColors.card,
        title: const Text('Waiting for payment',
            style: TextStyle(color: KodaColors.text1, fontSize: 15)),
        content: const Column(mainAxisSize: MainAxisSize.min, children: [
          CircularProgressIndicator(color: KodaColors.koda),
          SizedBox(height: 16),
          Text(
            "Complete your payment in the browser tab that just opened. "
            "This updates automatically once it's confirmed — you don't "
            "need to come back and click anything.",
            style: TextStyle(color: KodaColors.text2, fontSize: 13),
            textAlign: TextAlign.center,
          ),
        ]),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }
}
