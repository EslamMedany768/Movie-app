import 'package:dartz/dartz.dart';
import '../../../../core/failures/failures.dart';
import '../../../entity/MoviesEntity.dart';

abstract class SearchRemoteDataSource {
  Future<Either<Failures, MoviesResponseEntity>> getSearchMovie(String movieName);
}
