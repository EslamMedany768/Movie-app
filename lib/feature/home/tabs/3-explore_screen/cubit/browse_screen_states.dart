import 'package:movies_app/domain/entity/GenreListEntity.dart';

 class BrowseScreenStates {}

class GetGenreListSuccessState extends BrowseScreenStates{

  GenreListEntity genreList;

  GetGenreListSuccessState({required this.genreList});
}

class GetGenreListErrorState extends BrowseScreenStates{
  String error;

  GetGenreListErrorState({required this.error});
}

class GetGenreListLoadingState extends BrowseScreenStates{}
