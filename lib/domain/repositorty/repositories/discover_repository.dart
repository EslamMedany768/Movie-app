import 'package:dartz/dartz.dart';
import 'package:movies_app/core/failures/failures.dart';
import 'package:movies_app/domain/entity/GenreListEntity.dart';

abstract class DiscoverRepository {
  Future<Either<Failures, GenreListEntity>> getGenreList();

}
