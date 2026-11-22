import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/model/UserDm.dart';
import 'package:movies_app/domain/entity/MoviesEntity.dart';
import 'package:movies_app/domain/use_cases/add_movie_to_history_use_case.dart';
import 'package:movies_app/domain/use_cases/get_movies_history_use_case.dart';
import 'package:movies_app/feature/home/tabs/4-profile_screen/cubit/profile_states.dart';

@injectable
class ProfileViewModel extends Cubit<ProfileHistoryStates> {
  AddMovieToHistoryUseCase addMovieToHistoryUseCase;
  GetMoviesHistoryUseCase getMoviesHistoryUseCase;

  ProfileViewModel({
    required this.addMovieToHistoryUseCase,
    required this.getMoviesHistoryUseCase,
  }) : super(ProfileHistoryInitialState());

  addMovieToHistory(UserDm user, MovieEntity movie) async {
    var either = await addMovieToHistoryUseCase.invoke(user, movie);
    either.fold(
      (error) {
        emit(ProfileAddMovieToHistoryErrorStates(error: error.error));
      },
      (response) {
        emit(ProfileAddMovieToHistorySuccessStates(message: response));
      },
    );
  }

 void getMoviesHistory(UserDm user) async {
    // emit(GetMovieHistoryLoadingState());
    var either = await getMoviesHistoryUseCase.invoke(user);
    either.fold(
      (error) {
        emit(GetMovieHistoryErrorState(error: error.error));
      },
      (response) {
        emit(GetMovieHistorySuccessState(moviesHistory: response));
      },
    );
  }
}
