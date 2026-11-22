import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failures/failures.dart';
import 'package:movies_app/core/utils/firebase_utils.dart';
import 'package:movies_app/data/model/MovieDm.dart';
import 'package:movies_app/data/model/UserDm.dart';
import 'package:movies_app/domain/entity/MoviesEntity.dart';
import 'package:movies_app/domain/repositorty/data_sources/remote_data_source/history_remote_data_sorce.dart';

@Injectable(as: HistoryRemoteDataSource)
class HistoryRemoteDataSourceImpl extends HistoryRemoteDataSource {
  FirebaseUtils firebaseUtils;

  HistoryRemoteDataSourceImpl({required this.firebaseUtils});

  @override
  Future<Either<Failures, String>> addMovieToHistory(
    UserDm user,
    MovieEntity movie,
  ) async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        return firebaseUtils
            .addHistoryMovies(user: user, movie: MovieDm.fromMovieEntity(movie))
            .then<Either<Failures, String>>((value) {
              return Right("Movie Added Successfully");
            })
            .onError<Either<Failures, String>>(
              (error, stackTrace) => Left(ServerError(error: error.toString())),
            );
      } else {
        return Left(NetworkError(error: "please check your internet"));
      }
    } catch (e) {
      return Left(Failures(error: e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<MovieEntity>>> getMoviesHistory(
    UserDm user,
  ) async {
    try {
      var connectionResult = await Connectivity().checkConnectivity();
      if (connectionResult.contains(ConnectivityResult.mobile) ||
          connectionResult.contains(ConnectivityResult.wifi)) {
        try {
          var collectionResponse = await firebaseUtils.getMoviesHistory(user);
          var movieList = collectionResponse.docs.map((e) {
            return e.data().toMovieEntity();
          }).toList();
          return Right(movieList);
        } catch (e) {
          return Left(ServerError(error: e.toString()));
        }
      } else {
        return Left(NetworkError(error: "check your internet"));
      }
    } catch (e) {
      return Left(Failures(error: e.toString()));
    }
  }
}
