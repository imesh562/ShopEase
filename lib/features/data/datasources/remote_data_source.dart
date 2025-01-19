import 'dart:core';

import 'package:shopease/core/network/api_helper.dart';
import 'package:shopease/core/network/mock_api_helper.dart';
import 'package:shopease/features/data/datasources/shared_preference.dart';
import 'package:shopease/features/data/models/requests/product_data_request.dart';
import 'package:shopease/features/data/models/responses/product_data_reponse.dart';

abstract class RemoteDataSource {
  Future<ProductDataResponse> getProductsAPI(
      ProductDataRequest productDataRequest);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final APIHelper apiHelper;
  final MockAPIHelper mockAPIHelper;
  final AppSharedData appSharedData;

  RemoteDataSourceImpl({
    required this.apiHelper,
    required this.appSharedData,
    required this.mockAPIHelper,
  });

  @override
  Future<ProductDataResponse> getProductsAPI(
      ProductDataRequest productDataRequest) async {
    try {
      final response = await mockAPIHelper.post(
        "product-service/get-products",
        body: productDataRequest.toJson(),
      );
      return ProductDataResponse.fromJson(response.data);
    } on Exception {
      rethrow;
    }
  }
}
