
import 'package:dartz/dartz.dart';
import 'package:movies_app/core/failures/failures.dart';
import 'package:movies_app/domain/entity/PopularMoviesEntity.dart';

abstract class HomeRepository {

  Future<Either<Failures, PopularMoviesEntity>> getPopularMovies();
}
