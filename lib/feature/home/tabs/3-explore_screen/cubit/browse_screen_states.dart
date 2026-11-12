import 'package:movies_app/domain/entity/GenreListEntity.dart';

import '../../../../../domain/entity/MoviesEntity.dart';

class BrowseScreenStates {}

class GetGenreListSuccessState extends BrowseScreenStates {
  GenreListEntity? genreList;

  GetGenreListSuccessState({ this.genreList});
}

class GetGenreListErrorState extends BrowseScreenStates {
  String error;

  GetGenreListErrorState({required this.error});
}

class GetGenreListLoadingState extends BrowseScreenStates {}

class DiscoverMoviesGetSpecificMoviesErrorState extends BrowseScreenStates {
  String error;

  DiscoverMoviesGetSpecificMoviesErrorState({required this.error});
}


