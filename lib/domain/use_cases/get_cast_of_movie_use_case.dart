import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failures/failures.dart';
import 'package:movies_app/domain/entity/CastResponseEntity.dart';
import 'package:movies_app/domain/repositorty/repositories/home_repository.dart';

@injectable
class GetCastOfMovieUseCase {
  HomeRepository homeRepository;

  GetCastOfMovieUseCase({required this.homeRepository});

  Future<Either<Failures, CastResponseEntity>> invoke(int movieId) {
    return homeRepository.getCastOfMovie(movieId);
  }
}
