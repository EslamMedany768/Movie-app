import 'package:dartz/dartz.dart';
import 'package:movies_app/core/failures/failures.dart';
import 'package:movies_app/domain/entity/MoviesEntity.dart';

import '../../../entity/CastResponseEntity.dart';
import '../../../entity/ScreenShotResponseEntity.dart';


abstract class HomeRemoteDataSource {
  Future<Either<Failures, MoviesResponseEntity>> getPopularMovies();

  Future<Either<Failures, MoviesResponseEntity>> getSpecificMovies(String categoryId);
  Future<Either<Failures, CastResponseEntity>> getCastOfMovie(int movieId);

  Future<Either<Failures, MoviesResponseEntity>> getSimilarMovie(
      int movieId,
      );
  Future<Either<Failures, ScreenShotResponseEntity>> getScreenShots(
      int movieId,
      );
}
