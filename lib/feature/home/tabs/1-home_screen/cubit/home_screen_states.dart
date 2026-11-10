import 'package:movies_app/domain/entity/PopularMoviesEntity.dart';

abstract class HomeScreenStates {}

class HomeScreenGetPopularMoviesSuccessState extends HomeScreenStates {
  PopularMoviesEntity response;

  HomeScreenGetPopularMoviesSuccessState({required this.response});
}

class HomeScreenGetPopularMoviesErrorState extends HomeScreenStates {
  String error;

  HomeScreenGetPopularMoviesErrorState({required this.error});
}

class HomeScreenGetPopularMoviesLoadingState extends HomeScreenStates {
  HomeScreenGetPopularMoviesLoadingState();
}
