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
