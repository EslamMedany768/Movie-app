import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source/remote_data_source_impl/home_remote_data_source_impl.dart';
import 'package:movies_app/data/repository/home_repository_impl.dart';
import 'package:movies_app/domain/use_cases/get_popular_movies_use_case.dart';
import 'package:movies_app/domain/use_cases/get_specific_movies_use_case.dart';

import '../../../../../domain/entity/MoviesEntity.dart';
import 'home_screen_states.dart';

@injectable
class HomeScreenViewModel extends Cubit<HomeScreenStates> {
  GetPopularMoviesUseCase getPopularMoviesUseCase;
  GetSpecificMoviesUseCase getSpecificMoviesUseCase;


  HomeScreenViewModel({
    required this.getPopularMoviesUseCase,
    required this.getSpecificMoviesUseCase,
  }) : super(GetSpecificMoviesLoading());

  getPopularMovies() async {
    emit(GetSpecificMoviesLoading());
    var either = await getPopularMoviesUseCase.invoke();
    either.fold(
      (error) {
        emit(GetPopularMoviesErrorState(error: error.error));
      },
      (response) {
        emit(GetMoviesSuccessState(response: response));
      },
    );
  }

  getSpecificMovies(String categoryId) async {
    emit(GetSpecificMoviesLoading());
    var either = await getSpecificMoviesUseCase.invoke(categoryId);
    either.fold(
      (error) {
        emit(GetSpecificMoviesErrorState(error: error.error));
      },
      (response) {
        emit(GetMoviesSuccessState(response: response));

      },
    );
  }
}
