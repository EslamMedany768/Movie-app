import 'package:dartz/dartz.dart';
import 'package:movies_app/core/failures/failures.dart';
import 'package:movies_app/domain/entity/MoviesEntity.dart';

abstract class HomeRemoteDataSource {
  Future<Either<Failures, MoviesResponseEntity>> getPopularMovies();
///28%2C53%2C80
  Future<Either<Failures, MoviesResponseEntity>> getSpecificMovies(String categoryId);
}
