import 'dart:async';

import 'package:bloc/src/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopease/features/data/datasources/shared_preference.dart';
import 'package:shopease/features/data/models/requests/product_data_request.dart';
import 'package:shopease/features/domain/repositories/repository.dart';
import 'package:shopease/utils/device_info.dart';

import '../../../../error/failures.dart';
import '../../../../error/messages.dart';
import '../../../data/models/common/common_error_response.dart';
import '../../../data/models/responses/product_data_reponse.dart';
import '../../../domain/repositories/cart_repository.dart';
import '../base_bloc.dart';
import '../base_event.dart';
import '../base_state.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Base<ProductEvent, BaseState<ProductState>> {
  final AppSharedData appSharedData;
  final Repository repository;
  final DeviceInfo deviceInfo;
  final CartRepository cartRepo;

  ProductBloc({
    required this.appSharedData,
    required this.repository,
    required this.deviceInfo,
    required this.cartRepo,
  }) : super(ProductInitial()) {
    on<GetProductsDataEvent>(_getProductsData);
    on<AddToCartEvent>(_addToCart);
    on<ClearCartEvent>(_clearCart);
    on<RemoveProductFromCartEvent>(_removeProduct);
    on<GetCartProductsEvent>(_getCartProducts);
  }

  Future<void> _getProductsData(
      GetProductsDataEvent event, Emitter<BaseState<ProductState>> emit) async {
    final result = await repository.getProductsAPI(event.productDataRequest);
    emit(result.fold((l) {
      if (l is ServerFailure) {
        return APIFailureState(errorResponseModel: l.errorResponse);
      } else if (l is AuthorizedFailure) {
        return AuthorizedFailureState(errorResponseModel: l.errorResponse);
      } else if (l is ForceUpdateFailure) {
        return ForceUpdateState(errorResponseModel: l.errorResponse);
      } else if (l is MaintenanceFailure) {
        return MaintenanceState(errorResponseModel: l.errorResponse);
      } else {
        return APIFailureState(
            errorResponseModel: ErrorResponseModel(
                responseError: ErrorMessages.ERROR_SOMETHING_WENT_WRONG,
                responseCode: ''));
      }
    }, (r) {
      if (r.success) {
        return GetProductsDataSuccessState(
          products: r.data ?? [],
          isRefresh: event.isRefresh,
        );
      } else {
        return APIFailureState(
            errorResponseModel:
                ErrorResponseModel(responseError: r.message, responseCode: ''));
      }
    }));
  }

  Future<void> _addToCart(
      AddToCartEvent event, Emitter<BaseState<ProductState>> emit) async {
    try {
      emit(APILoadingState());
      cartRepo.addItemsToCart(event.product, event.cartCount);
      emit(AddToCartSuccessState());
    } on Exception catch (e) {
      emit(
        APIFailureState(
          errorResponseModel: ErrorResponseModel(
              responseError: ErrorMessages.ERROR_SOMETHING_WENT_WRONG,
              responseCode: ''),
        ),
      );
    }
  }

  Future<void> _clearCart(
      ClearCartEvent event, Emitter<BaseState<ProductState>> emit) async {
    try {
      emit(APILoadingState());
      cartRepo.clearCart();
      emit(ClearCartSuccessState());
    } on Exception catch (e) {
      emit(
        APIFailureState(
          errorResponseModel: ErrorResponseModel(
              responseError: ErrorMessages.ERROR_SOMETHING_WENT_WRONG,
              responseCode: ''),
        ),
      );
    }
  }

  Future<void> _removeProduct(RemoveProductFromCartEvent event,
      Emitter<BaseState<ProductState>> emit) async {
    try {
      emit(APILoadingState());
      cartRepo.removeProduct(event.productId);
      emit(RemoveProductFromCartSuccessState());
    } on Exception catch (e) {
      emit(
        APIFailureState(
          errorResponseModel: ErrorResponseModel(
              responseError: ErrorMessages.ERROR_SOMETHING_WENT_WRONG,
              responseCode: ''),
        ),
      );
    }
  }

  Future<void> _getCartProducts(
      GetCartProductsEvent event, Emitter<BaseState<ProductState>> emit) async {
    try {
      emit(APILoadingState());
      List<Product> cartItems = await cartRepo.getCartItems();
      emit(GetCartItemsSuccessState(cartItems: cartItems));
    } on Exception catch (e) {
      emit(
        APIFailureState(
          errorResponseModel: ErrorResponseModel(
              responseError: ErrorMessages.ERROR_SOMETHING_WENT_WRONG,
              responseCode: ''),
        ),
      );
    }
  }
}
