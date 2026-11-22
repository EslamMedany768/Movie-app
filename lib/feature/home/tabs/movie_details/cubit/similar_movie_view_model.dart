import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entity/MoviesEntity.dart';
import 'package:movies_app/domain/use_cases/get_similar_movies_use_case.dart';
import 'package:movies_app/feature/home/tabs/movie_details/cubit/similar_movie_states.dart';

@injectable
class SimilarMovieViewModel extends Cubit<SimilarMovieStates> {
  GetSimilarMoviesUseCase getSimilarMoviesUseCase;

  SimilarMovieViewModel({required this.getSimilarMoviesUseCase})
    : super(SimilarMovieInitialState());

   getSimilarMovies(int movieId) async {
    emit(SimilarMovieLoadingState());

    var either = await getSimilarMoviesUseCase.invoke(movieId);
    either.fold(
      (left) {
        emit(SimilarMovieErrorState(error: left.error));
      },
      (r) {
        emit(
          SimilarMovieSuccessState(similarMovie: r.results!.take(4).toList()),
        );
      },
    );
  }
}
