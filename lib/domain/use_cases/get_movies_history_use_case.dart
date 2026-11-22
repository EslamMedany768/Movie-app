import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failures/failures.dart';
import 'package:movies_app/data/model/UserDm.dart';
import 'package:movies_app/domain/entity/MoviesEntity.dart';
import 'package:movies_app/domain/repositorty/repositories/history_repository.dart';

@injectable
class GetMoviesHistoryUseCase {
  HistoryRepository historyRepository;

  GetMoviesHistoryUseCase({required this.historyRepository});

  Future<Either<Failures, List<MovieEntity>>> invoke(UserDm user) {
    return historyRepository.getMoviesHistory(user);
  }
}
