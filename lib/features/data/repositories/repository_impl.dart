import 'package:dartz/dartz.dart';
import 'package:shopease/error/failures.dart';
import 'package:shopease/features/data/models/requests/product_data_request.dart';
import 'package:shopease/features/data/models/responses/product_data_reponse.dart';

import '../../../core/network/network_info.dart';
import '../../../error/exceptions.dart';
import '../../../error/messages.dart';
import '../../domain/repositories/repository.dart';
import '../datasources/remote_data_source.dart';
import '../models/common/common_error_response.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  RepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, ProductDataResponse>> getProductsAPI(
      ProductDataRequest productDataRequest) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await remoteDataSource.getProductsAPI(productDataRequest);
        return Right(response);
      } on ServerException catch (ex) {
        return Left(ServerFailure(ex.errorResponseModel));
      } on UnAuthorizedException catch (ex) {
        return Left(AuthorizedFailure(ex.errorResponseModel));
      } on DioException catch (e) {
        return Left(ServerFailure(e.errorResponseModel));
      } on ForceUpdateException catch (e) {
        return Left(ForceUpdateFailure(e.errorResponseModel));
      } on MaintenanceException catch (e) {
        return Left(MaintenanceFailure(e.errorResponseModel));
      } on Exception {
        return Left(
          ServerFailure(
            ErrorResponseModel(
                responseError: ErrorMessages.ERROR_SOMETHING_WENT_WRONG,
                responseCode: ''),
          ),
        );
      }
    } else {
      return Left(ConnectionFailure());
    }
  }
}
