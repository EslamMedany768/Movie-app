import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entity/GenreListEntity.dart';
import 'package:movies_app/domain/use_cases/get_genre_list_use_case.dart';
import 'package:movies_app/feature/home/tabs/3-explore_screen/cubit/browse_screen_states.dart';
import 'package:movies_app/feature/home/tabs/3-explore_screen/widgets/custom_tab_bar_widget.dart';
import 'package:provider/provider.dart';

@injectable
class BrowseScreenViewModel extends Cubit<BrowseScreenStates> {
  GetGenreListUseCase genreListUseCase;
  List<GenresEntity>? genreList=[];





  BrowseScreenViewModel({required this.genreListUseCase})
    : super(GetGenreListLoadingState());

  getGenreList() async {
    var either = await genreListUseCase.invoke();
    either.fold(
      (error) {
        emit(GetGenreListErrorState(error: error.error));
      },
      (response) {
        emit(GetGenreListSuccessState(genreList: response));
        genreList=response.genres!;
      },
    );
  }
}
