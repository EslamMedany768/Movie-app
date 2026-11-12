import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entity/GenreListEntity.dart';
import 'package:movies_app/domain/use_cases/get_genre_list_use_case.dart';
import 'package:movies_app/feature/home/tabs/3-explore_screen/cubit/browse_screen_states.dart';
import 'package:movies_app/feature/home/tabs/3-explore_screen/widgets/custom_tab_bar_widget.dart';
import 'package:provider/provider.dart';

import '../../../../../domain/entity/MoviesEntity.dart';
import '../../../../../domain/use_cases/get_specific_movies_use_case.dart';

@injectable
class BrowseScreenViewModel extends Cubit<BrowseScreenStates> {
  GetSpecificMoviesUseCase getSpecificMoviesUseCase;
  GetGenreListUseCase genreListUseCase;
  List<GenresEntity>? genreList = [];
  List<MovieEntity>? genreMovies=[];
  bool isEmpty = true;

  BrowseScreenViewModel({
    required this.genreListUseCase,
    required this.getSpecificMoviesUseCase,
  }) : super(GetGenreListLoadingState());

  getGenreList() async {
    // emit(GetGenreListLoadingState());
    var either = await genreListUseCase.invoke();
    either.fold(
      (error) {
        emit(GetGenreListErrorState(error: error.error));
      },
      (response) {
        emit(GetGenreListSuccessState(genreList: response));
        genreList = response.genres!;
      },
    );
  }

  getSpecificMovies(String categoryId) async {
    // emit(GetGenreListLoadingState());
    var either = await getSpecificMoviesUseCase.invoke(categoryId);
    either.fold(
      (error) {
        emit(DiscoverMoviesGetSpecificMoviesErrorState(error: error.error));
      },
      (response) {
        emit(GetGenreListSuccessState(genreList: null));
        genreMovies = response.results;
        isEmpty = false;
      },
    );
  }
}
