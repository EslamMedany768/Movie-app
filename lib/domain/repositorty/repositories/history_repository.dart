import 'package:dartz/dartz.dart';
import 'package:movies_app/core/failures/failures.dart';
import 'package:movies_app/data/model/UserDm.dart';
import 'package:movies_app/domain/entity/MoviesEntity.dart';

abstract class HistoryRepository {
  Future<Either<Failures, String>> addMovieToHistory(
    UserDm user,
    MovieEntity movie,
  );
  Future<Either<Failures, List<MovieEntity>>> getMoviesHistory(
    UserDm user,
  );
}
