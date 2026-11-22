import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/api/api_manager.dart';
import 'package:movies_app/core/api/end_points.dart';
import 'package:movies_app/core/failures/failures.dart';
import 'package:movies_app/data/model/GenreListDm.dart';
import 'package:movies_app/data/model/MovieDetailsResponseDm.dart';
import 'package:movies_app/domain/entity/GenreListEntity.dart';
import 'package:movies_app/domain/entity/MovieDetailsResponseEntity.dart';
import 'package:movies_app/domain/repositorty/data_sources/remote_data_source/discover_remote_data_source.dart';

import '../../../core/api/api_constant.dart';
import '../../../domain/entity/MoviesEntity.dart';
import '../../model/MovieDm.dart';

@Injectable(as: DiscoverRemoteDataSource)
class DiscoverRemoteDataSourceImpl implements DiscoverRemoteDataSource {
  ApiManager apiManager;

  DiscoverRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, GenreListDm>> getGenreList() async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response = await apiManager.getData(
          endPoint: EndPoints.apiRequestGenreList,
          headers: {"Authorization": "Bearer ${ApiConstant.token}"},
        );
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(GenreListDm.fromJson(response.data));
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

  @override
  Future<Either<Failures, MovieDetailsResponseDm>> getMovieDetails(
    int movieId,
  ) async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response = await apiManager.getData(
          endPoint: "${EndPoints.apiRequestMovieDetails}$movieId",
          headers: {"Authorization": "Bearer ${ApiConstant.token}"}
        );
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(MovieDetailsResponseDm.fromJson(response.data));
        } else {

        return Left(ServerError(error: response.statusMessage!));
        }
      } else {
        return Left(NetworkError(error: "please check Internet"));
      }
    } catch (e) {
      print(e);
      return Left(ServerError(error: e.toString()));
    }
  }
  @override
  Future<Either<Failures, MoviesResponseEntity>> getSpecificMovies(
      categoryId,
      ) async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response = await apiManager.getData(
          endPoint: EndPoints.apiRequestSpecificMovies + categoryId,
          headers: {"Authorization": "Bearer ${ApiConstant.token}"},
        );
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(MovieResponseDm.fromJson(response.data));
        } else {
          return Left(ServerError(error: response.statusMessage!));
        }
      } else {
        return Left(NetworkError(error: "Check Your Internet"));
      }
    } catch (e) {
      return Left(Failures(error: e.toString()));
    }
  }
}
