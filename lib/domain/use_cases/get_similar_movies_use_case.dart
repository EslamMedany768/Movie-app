import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failures/failures.dart';
import 'package:movies_app/domain/repositorty/repositories/home_repository.dart';

import '../entity/MoviesEntity.dart';

@injectable
class GetSimilarMoviesUseCase {
  HomeRepository homeRepository;

  GetSimilarMoviesUseCase({required this.homeRepository});

  Future<Either<Failures, MoviesResponseEntity>> invoke(int movieId) {
    return homeRepository.getSimilarMovie(movieId);
  }
}
