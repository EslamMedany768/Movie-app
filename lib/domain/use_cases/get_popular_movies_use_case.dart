import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failures/failures.dart';
import 'package:movies_app/domain/entity/PopularMoviesEntity.dart';
import 'package:movies_app/domain/repositorty/repositories/home_repository.dart';
@injectable
class GetPopularMoviesUseCase {
  HomeRepository homeRepository;

  GetPopularMoviesUseCase({required this.homeRepository});

  Future<Either<Failures, PopularMoviesEntity>> invoke() {
    return homeRepository.getPopularMovies();
  }
}
