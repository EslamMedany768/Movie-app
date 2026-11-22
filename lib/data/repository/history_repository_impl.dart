import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failures/failures.dart';
import 'package:movies_app/data/model/UserDm.dart';
import 'package:movies_app/domain/entity/MoviesEntity.dart';
import 'package:movies_app/domain/repositorty/data_sources/remote_data_source/history_remote_data_sorce.dart';
import 'package:movies_app/domain/repositorty/repositories/history_repository.dart';

@Injectable(as: HistoryRepository)
class HistoryRepositoryImpl extends HistoryRepository {
  HistoryRemoteDataSource historyRemoteDataSource;

  HistoryRepositoryImpl({required this.historyRemoteDataSource});

  @override
  Future<Either<Failures, String>> addMovieToHistory(
    UserDm user,
    MovieEntity movie,
  ) async {
    var either = await historyRemoteDataSource.addMovieToHistory(user, movie);
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
  Future<Either<Failures, List<MovieEntity>>> getMoviesHistory(
    UserDm user,
  ) async {
    var either = await historyRemoteDataSource.getMoviesHistory(user);
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
