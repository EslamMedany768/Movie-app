import 'package:dartz/dartz.dart';
import 'package:movies_app/core/failures/failures.dart';
import 'package:movies_app/domain/entity/MoviesEntity.dart';

abstract class HomeRepository {
  Future<Either<Failures, MoviesResponseEntity>> getPopularMovies();

  Future<Either<Failures, MoviesResponseEntity>> getSpecificMovies(String categoryId);
}
