import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failures/failures.dart';
import 'package:movies_app/domain/entity/GenreListEntity.dart';
import 'package:movies_app/domain/repositorty/repositories/discover_repository.dart';
@injectable
class GetGenreListUseCase {
  DiscoverRepository discoverRepository;

  GetGenreListUseCase({required this.discoverRepository});

  Future<Either<Failures, GenreListEntity>> invoke() {
    return discoverRepository.getGenreList();
  }
}
