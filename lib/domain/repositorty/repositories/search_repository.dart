import 'package:dartz/dartz.dart';
import 'package:movies_app/core/failures/failures.dart';
import 'package:movies_app/domain/entity/MoviesEntity.dart';

abstract class SearchRepository {
  Future<Either<Failures, MoviesResponseEntity>> getSearchMovie(String movieName);
}
