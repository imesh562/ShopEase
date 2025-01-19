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
import '../base_bloc.dart';
import '../base_event.dart';
import '../base_state.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Base<ProductEvent, BaseState<ProductState>> {
  final AppSharedData appSharedData;
  final Repository repository;
  final DeviceInfo deviceInfo;

  ProductBloc({
    required this.appSharedData,
    required this.repository,
    required this.deviceInfo,
  }) : super(ProductInitial()) {
    on<GetProductsDataEvent>(_getProductsData);
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
}
