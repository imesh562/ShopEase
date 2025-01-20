part of 'product_bloc.dart';

@immutable
abstract class ProductState extends BaseState<ProductState> {}

class ProductInitial extends ProductState {}

class GetProductsDataSuccessState extends ProductState {
  final List<Product> products;
  final bool isRefresh;

  GetProductsDataSuccessState({
    required this.products,
    required this.isRefresh,
  });
}

class AddToCartSuccessState extends ProductState {}

class ClearCartSuccessState extends ProductState {}

class RemoveProductFromCartSuccessState extends ProductState {}

class GetCartItemsSuccessState extends ProductState {
  final List<Product> cartItems;

  GetCartItemsSuccessState({required this.cartItems});
}
