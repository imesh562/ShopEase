import 'package:shopease/features/data/models/responses/product_data_reponse.dart';

abstract class CartRepository {
  Future<List<Product>> getCartItems();

  Future<void> removeProduct(int productId);

  Future<void> clearCart();

  Future<void> addItemsToCart(Product product, int count);
}
