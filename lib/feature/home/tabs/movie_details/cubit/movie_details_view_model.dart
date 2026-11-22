import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entity/ScreenShotResponseEntity.dart';
import 'package:movies_app/domain/use_cases/get_cast_of_movie_use_case.dart';
import 'package:movies_app/domain/use_cases/get_movie_details_use_case.dart';
import 'package:movies_app/domain/use_cases/get_screen_shots_use_case.dart';
import 'package:movies_app/feature/home/tabs/movie_details/cubit/movie_details_states.dart';

import '../../../../../domain/entity/CastResponseEntity.dart';
import '../../../../../domain/entity/MovieDetailsResponseEntity.dart';

@injectable
class MovieDetailsViewModel extends Cubit<MovieDetailsStates> {
  List<CastEntity> castResponse=[];
  List<BackdropsEntity> screenShots=[];
  MovieDetailsResponseEntity? movieDetailsResponse;
  GetMovieDetailsUseCase getMovieDetailsUseCase;
  GetScreenShotsUseCase getScreenShotsUseCase;
  GetCastOfMovieUseCase getCastOfMovieUseCase;
  bool isAppBarVisible=true;

  MovieDetailsViewModel({
    required this.getMovieDetailsUseCase,
    required this.getScreenShotsUseCase,
    required this.getCastOfMovieUseCase,
  }) : super(MovieDetailsLoadingState());

  void getMovieDetails(int movieId) async {
    emit(MovieDetailsLoadingState());
    var either = await getMovieDetailsUseCase.invoke(movieId);
    either.fold(
      (error) {
        emit(MovieDetailsErrorState(error: error.error));
      },
      (response) {
        movieDetailsResponse = response;
        emit(MovieDetailsSuccessState());
      },
    );
  }

  void getScreenShots(int movieId) async {
    emit(MovieDetailsLoadingState());
    var either = await getScreenShotsUseCase.invoke(movieId);
    either.fold(
      (error) {
        emit(MovieDetailsErrorState(error: error.error));
      },
      (response) {
        screenShots = response.backdrops!.take(3).toList();
        emit(MovieDetailsSuccessState());
      },
    );
  }

  void getCastOfMovie(int movieId) async {
    emit(MovieDetailsLoadingState());
    var either = await getCastOfMovieUseCase.invoke(movieId);
    either.fold(
      (error) {
        emit(MovieDetailsErrorState(error: error.error));
      },
      (response) {
        castResponse = response.cast!.take(5).toList();
        emit(MovieDetailsSuccessState());
      },
    );
  }
}
