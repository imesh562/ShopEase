import 'dart:async';

import 'package:hive/hive.dart';
import 'package:shopease/features/data/models/responses/product_data_reponse.dart';

import '../../domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  Future<Box<Product>> openPostBox() async {
    return await Hive.openBox<Product>('cart_items');
  }

  @override
  Future<void> addItemsToCart(Product product, int count) async {
    final box = await openPostBox();
    final existingProductKey = box.keys.cast<dynamic>().firstWhere(
          (key) => box.get(key)?.id == product.id,
          orElse: () => null,
        );

    if (existingProductKey != null) {
      final existingProduct = box.get(existingProductKey);
      if (existingProduct != null) {
        existingProduct.itemCount = existingProduct.itemCount! + count;
        await box.put(existingProductKey, existingProduct);
      }
    } else {
      product.itemCount = count;
      await box.add(product);
    }
  }

  @override
  Future<void> clearCart() async {
    try {
      if (Hive.isBoxOpen('cart_items')) {
        final box = await openPostBox();
        await box.clear();
        print("All cached Hive data cleared.");
      } else {
        print("Hive box is not open, skipping clearing data.");
      }
    } catch (e) {
      print("Error clearing cached data: $e");
    }
  }

  @override
  Future<List<Product>> getCartItems() async {
    final box = await openPostBox();
    return box.values.toList();
  }

  @override
  Future<void> removeProduct(int productId) async {
    final box = await openPostBox();
    final keysToDelete =
        box.keys.where((k) => box.get(k)?.id == productId).toList();
    await box.deleteAll(keysToDelete);
  }
}
