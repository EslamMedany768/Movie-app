import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failures/failures.dart';
import 'package:movies_app/domain/entity/MoviesEntity.dart';
import 'package:movies_app/domain/repositorty/data_sources/remote_data_source/search_remote_data_source.dart';
import 'package:movies_app/domain/repositorty/repositories/search_repository.dart';

@Injectable(as: SearchRepository)
class SearchRepositoryImpl extends SearchRepository {
  SearchRemoteDataSource searchRemoteDataSource;

  SearchRepositoryImpl({required this.searchRemoteDataSource});

  @override
  Future<Either<Failures, MoviesResponseEntity>> getSearchMovie(
    String movieName,
  ) async {
    var either = await searchRemoteDataSource.getSearchMovie(movieName);
    return either.fold(
      (error) {
        return Left(error);
      },
      (response) {
        return Right(response);
      },
    );
    return searchRemoteDataSource.getSearchMovie(movieName);
  }
}
