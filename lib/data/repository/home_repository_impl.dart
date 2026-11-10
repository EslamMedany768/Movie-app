import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failures/failures.dart';
import 'package:movies_app/domain/entity/PopularMoviesEntity.dart';
import 'package:movies_app/domain/repositorty/data_sources/remote_data_source/home_remote_data_source.dart';
import 'package:movies_app/domain/repositorty/repositories/home_repository.dart';
@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl({required this.homeRemoteDataSource});

  @override
  Future<Either<Failures, PopularMoviesEntity>> getPopularMovies() async {
    var either = await homeRemoteDataSource.getMoviesPopular();
    return either.fold((error) => Left(error), (response) => Right(response));

  }
}
