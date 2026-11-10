import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source/remote_data_source_impl/home_remote_data_source_impl.dart';
import 'package:movies_app/data/repository/home_repository_impl.dart';
import 'package:movies_app/domain/use_cases/get_popular_movies_use_case.dart';

import 'home_screen_states.dart';
@injectable
class HomeScreenViewModel extends Cubit<HomeScreenStates> {
  GetPopularMoviesUseCase getPopularMoviesUseCase;

  HomeScreenViewModel({required this.getPopularMoviesUseCase})
    : super(HomeScreenGetPopularMoviesLoadingState());

  getPopularMovies() async {
    emit(HomeScreenGetPopularMoviesLoadingState());
    var either = await getPopularMoviesUseCase.invoke();
    either.fold(
      (error) {
        emit(HomeScreenGetPopularMoviesErrorState(error: error.error));
      },
      (response) {
        emit(HomeScreenGetPopularMoviesSuccessState(response: response));
      },
    );
  }
}
