
import '../../../../../domain/entity/MoviesEntity.dart';

abstract class SimilarMovieStates {}

class SimilarMovieInitialState extends SimilarMovieStates {}

class SimilarMovieSuccessState extends SimilarMovieStates {
  List<MovieEntity> similarMovie;

  SimilarMovieSuccessState({required this.similarMovie});
}

class SimilarMovieErrorState extends SimilarMovieStates {
  String error;

  SimilarMovieErrorState({required this.error});
}

class SimilarMovieLoadingState extends SimilarMovieStates {}
