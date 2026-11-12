import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/api/api_manager.dart';
import 'package:movies_app/core/failures/failures.dart';
import 'package:movies_app/domain/entity/GenreListEntity.dart';
import 'package:movies_app/domain/repositorty/data_sources/remote_data_source/discover_remote_data_source.dart';
import 'package:movies_app/domain/repositorty/repositories/discover_repository.dart';

@Injectable(as: DiscoverRepository)
class DiscoverRepositoryImpl implements DiscoverRepository {
  DiscoverRemoteDataSource discoverRemoteDataSource;

  DiscoverRepositoryImpl({required this.discoverRemoteDataSource});

  @override
  Future<Either<Failures, GenreListEntity>> getGenreList() async {
    var either = await discoverRemoteDataSource.getGenreList();
    return either.fold(
      (error) {
        return Left(error);
      },
      (response) {
        return Right(response);
      },
    );
  }

}
