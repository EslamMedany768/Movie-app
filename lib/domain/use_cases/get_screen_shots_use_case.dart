import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failures/failures.dart';
import 'package:movies_app/domain/entity/ScreenShotResponseEntity.dart';
import 'package:movies_app/domain/repositorty/repositories/home_repository.dart';

@injectable
class GetScreenShotsUseCase {
  HomeRepository homeRepository;

  GetScreenShotsUseCase({required this.homeRepository});

  Future<Either<Failures, ScreenShotResponseEntity>> invoke(int movieId) {
    return homeRepository.getScreenShots(movieId);
  }
}
