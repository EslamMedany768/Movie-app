import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failures/failures.dart';
import 'package:movies_app/domain/entity/MoviesEntity.dart';
import 'package:movies_app/domain/repositorty/repositories/home_repository.dart';
@injectable
class GetSpecificMoviesUseCase {
  HomeRepository homeRepository;

  GetSpecificMoviesUseCase({required this.homeRepository});

  Future<Either<Failures, MoviesResponseEntity>> invoke(String categoryId) {
    return homeRepository.getSpecificMovies(categoryId);
  }
}
