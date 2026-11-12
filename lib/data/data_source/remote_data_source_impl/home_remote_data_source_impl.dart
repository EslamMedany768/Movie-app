import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/api/api_constant.dart';
import 'package:movies_app/core/api/api_manager.dart';
import 'package:movies_app/core/api/end_points.dart';
import 'package:movies_app/data/model/MovieDm.dart';
import 'package:movies_app/domain/repositorty/data_sources/remote_data_source/home_remote_data_source.dart';

import '../../../core/failures/failures.dart';
import '../../../domain/entity/MoviesEntity.dart';

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  ApiManager apiManager;

  HomeRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, MoviesResponseEntity>> getPopularMovies() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile)) {
      var response = await apiManager.getData(
        endPoint: EndPoints.apiRequestPopularMovies,
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
