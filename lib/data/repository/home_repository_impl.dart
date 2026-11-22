import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failures/failures.dart';
import 'package:movies_app/domain/entity/CastResponseEntity.dart';
import 'package:movies_app/domain/entity/MoviesEntity.dart';
import 'package:movies_app/domain/entity/ScreenShotResponseEntity.dart';
import 'package:movies_app/domain/repositorty/data_sources/remote_data_source/home_remote_data_source.dart';
import 'package:movies_app/domain/repositorty/repositories/home_repository.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl({required this.homeRemoteDataSource});

  @override
  Future<Either<Failures, MoviesResponseEntity>> getPopularMovies() async {
    var either = await homeRemoteDataSource.getPopularMovies();
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, MoviesResponseEntity>> getSpecificMovies(
    categoryId,
  ) async {
    // TODO: implement getSpecificMovies
    var either = await homeRemoteDataSource.getSpecificMovies(categoryId);
    return either.fold(
      (error) {
        return Left(error);
      },
      (response) {
        return Right(response);
      },
    );
  }

  @override
  Future<Either<Failures, MoviesResponseEntity>> getSimilarMovie(
    int movieId,
  ) async {
    var either = await homeRemoteDataSource.getSimilarMovie(movieId);
    return either.fold(
      (error) {
        return Left(error);
      },
      (response) {
        return Right(response);
      },
    );
  }

  @override
  Future<Either<Failures, ScreenShotResponseEntity>> getScreenShots(
    int movieId,
  ) async {
    var either = await homeRemoteDataSource.getScreenShots(movieId);
    return either.fold(
      (error) {
        return Left(error);
      },
      (response) {
        return Right(response);
      },
    );
  }

  @override
  Future<Either<Failures, CastResponseEntity>> getCastOfMovie(
    int movieId,
  ) async {
    var either = await homeRemoteDataSource.getCastOfMovie(movieId);
    return either.fold(
      (error) {
        return Left(error);
      },
      (response) {
        return Right(response);
      },
    );
  }
}
