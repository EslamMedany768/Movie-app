import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/api/api_manager.dart';
import 'package:movies_app/core/api/end_points.dart';
import 'package:movies_app/core/failures/failures.dart';
import 'package:movies_app/data/model/MovieDm.dart';
import 'package:movies_app/domain/entity/MoviesEntity.dart';
import 'package:movies_app/domain/repositorty/data_sources/remote_data_source/search_remote_data_source.dart';

import '../../../core/api/api_constant.dart';

@Injectable(as: SearchRemoteDataSource)
class SearchRemoteDataSourceImpl extends SearchRemoteDataSource {
  ApiManager apiManager;

  SearchRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, MovieResponseDm>> getSearchMovie(
    String movieName,
  ) async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response = await apiManager.getData(
          endPoint: EndPoints.apiRequestSearchMovie,
          headers: {"Authorization": "Bearer ${ApiConstant.token}"},
          queryParam: {"query": movieName},
        );
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(MovieResponseDm.fromJson(response.data));
        } else {
          return Left(ServerError(error: response.statusMessage!));
        }
      } else {
        return Left(NetworkError(error: "check your internet"));
      }
    } catch (e) {
      return Left(Failures(error: e.toString()));
    }
  }
}
