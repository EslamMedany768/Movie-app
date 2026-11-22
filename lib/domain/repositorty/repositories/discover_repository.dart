import 'package:dartz/dartz.dart';
import 'package:movies_app/core/failures/failures.dart';
import 'package:movies_app/domain/entity/GenreListEntity.dart';

import '../../entity/MovieDetailsResponseEntity.dart';

abstract class DiscoverRepository {
  Future<Either<Failures, GenreListEntity>> getGenreList();
  Future<Either<Failures,MovieDetailsResponseEntity>> getMovieDetails(int movieId);
}
