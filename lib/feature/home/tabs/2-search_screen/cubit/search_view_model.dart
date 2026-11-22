import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/use_cases/get_search_movie_use_case.dart';
import 'package:movies_app/feature/home/tabs/2-search_screen/cubit/search_states.dart';
@injectable
class SearchViewModel extends Cubit<SearchStates> {
  TextEditingController controller = TextEditingController();

GetSearchMovieUseCase getSearchMovieUseCase;

  SearchViewModel({required this.getSearchMovieUseCase})
    : super(SearchInitialState());

  void doSearch(String movieName) async {
    emit(SearchLoadingState());
    var either = await getSearchMovieUseCase.invoke(movieName);
    either.fold(
      (error) {
        emit(SearchErrorState(error: error.error));
      },
      (response) {
        emit(SearchSuccessState(moviesResponse: response));
      },
    );
  }
}
