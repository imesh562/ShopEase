import 'package:dartz/dartz.dart';
import 'package:shopease/features/data/models/requests/product_data_request.dart';
import 'package:shopease/features/data/models/responses/product_data_reponse.dart';

import '../../../error/failures.dart';

abstract class Repository {
  Future<Either<Failure, ProductDataResponse>> getProductsAPI(
      ProductDataRequest productDataRequest);
}
