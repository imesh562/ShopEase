part of 'product_bloc.dart';

@immutable
abstract class ProductEvent extends BaseEvent {}

class GetProductsDataEvent extends ProductEvent {
  final ProductDataRequest productDataRequest;
  final bool isRefresh;

  GetProductsDataEvent({
    required this.productDataRequest,
    this.isRefresh = true,
  });
}

class AddToCartEvent extends ProductEvent {
  final Product product;
  final int cartCount;

  AddToCartEvent({
    required this.product,
    required this.cartCount,
  });
}

class ClearCartEvent extends ProductEvent {}

class RemoveProductFromCartEvent extends ProductEvent {
  final int productId;

  RemoveProductFromCartEvent({required this.productId});
}

class GetCartProductsEvent extends ProductEvent {}
