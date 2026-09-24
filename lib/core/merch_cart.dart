// lib/core/merch_cart.dart
//
// Printful merch shopping cart -- in-memory only (not persisted to
// shared_preferences or the synced settings blob, same reasoning as
// any guest-cart pattern: lost on app restart is an acceptable,
// unsurprising default). Scoped to a single server at a time --
// checkout/shipping calls are all server_id-scoped and Printful has
// no cross-store checkout, so adding an item from a different
// server's merch than what's currently in the cart replaces it
// rather than mixing stores.

import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartItem {
  final String variantId; // Koda's local Variant.id, not Printful's
  final String productName;
  final String variantName;
  final String? imageUrl;
  final int unitPriceCents;
  int quantity;

  CartItem({
    required this.variantId,
    required this.productName,
    required this.variantName,
    required this.imageUrl,
    required this.unitPriceCents,
    required this.quantity,
  });

  Map<String, dynamic> toOrderItem() => {'variant_id': variantId, 'quantity': quantity};
}

class MerchCartState {
  final String? serverId;
  final List<CartItem> items;
  const MerchCartState({this.serverId, this.items = const []});

  int get totalItems => items.fold(0, (sum, i) => sum + i.quantity);
  int get subtotalCents => items.fold(0, (sum, i) => sum + i.unitPriceCents * i.quantity);
}

class MerchCartNotifier extends StateNotifier<MerchCartState> {
  MerchCartNotifier() : super(const MerchCartState());

  void addItem({
    required String serverId,
    required String variantId,
    required String productName,
    required String variantName,
    required String? imageUrl,
    required int unitPriceCents,
    required int quantity,
  }) {
    // Different store -- this session's cart follows whichever
    // server's merch is actively being added from, rather than
    // mixing two stores' items into one checkout.
    final items = state.serverId == serverId ? [...state.items] : <CartItem>[];

    final existingIndex = items.indexWhere((i) => i.variantId == variantId);
    if (existingIndex != -1) {
      items[existingIndex].quantity += quantity;
    } else {
      items.add(CartItem(
        variantId: variantId,
        productName: productName,
        variantName: variantName,
        imageUrl: imageUrl,
        unitPriceCents: unitPriceCents,
        quantity: quantity,
      ));
    }
    state = MerchCartState(serverId: serverId, items: items);
  }

  void updateQuantity(String variantId, int quantity) {
    if (quantity < 1) return;
    final items = [...state.items];
    final i = items.indexWhere((i) => i.variantId == variantId);
    if (i == -1) return;
    items[i].quantity = quantity;
    state = MerchCartState(serverId: state.serverId, items: items);
  }

  void removeItem(String variantId) {
    final items = state.items.where((i) => i.variantId != variantId).toList();
    state = MerchCartState(serverId: items.isEmpty ? null : state.serverId, items: items);
  }

  void clear() => state = const MerchCartState();
}

final merchCartProvider = StateNotifierProvider<MerchCartNotifier, MerchCartState>(
    (ref) => MerchCartNotifier());
