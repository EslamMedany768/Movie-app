import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/model/UserDm.dart';
import 'package:movies_app/domain/entity/MoviesEntity.dart';
import 'package:movies_app/domain/repositorty/repositories/history_repository.dart';

import '../../core/failures/failures.dart';
@injectable
class AddMovieToHistoryUseCase {
  HistoryRepository historyRepository;

  AddMovieToHistoryUseCase({required this.historyRepository});

  Future<Either<Failures, String>> invoke(
    UserDm user,
    MovieEntity movie,
  ) {
    return historyRepository.addMovieToHistory(user, movie);
  }
}
