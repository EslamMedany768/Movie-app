import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failures/failures.dart';
import 'package:movies_app/domain/entity/MoviesEntity.dart';
import 'package:movies_app/domain/repositorty/repositories/home_repository.dart';
import 'package:movies_app/domain/repositorty/repositories/search_repository.dart';

@injectable
class GetSearchMovieUseCase {
  SearchRepository searchRepository;

  GetSearchMovieUseCase({required this.searchRepository});

  Future<Either<Failures, MoviesResponseEntity>> invoke(String movieName) {
    return searchRepository.getSearchMovie(movieName);
  }
}
