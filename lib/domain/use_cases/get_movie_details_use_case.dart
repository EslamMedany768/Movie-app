import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failures/failures.dart';
import 'package:movies_app/domain/entity/MovieDetailsResponseEntity.dart';
import 'package:movies_app/domain/repositorty/repositories/discover_repository.dart';

@injectable
class GetMovieDetailsUseCase {
  DiscoverRepository discoverRepository;

  GetMovieDetailsUseCase({required this.discoverRepository});

  Future<Either<Failures,MovieDetailsResponseEntity>> invoke(int movieId){
   return discoverRepository.getMovieDetails(movieId);
  }

}
