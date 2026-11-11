import 'package:movies_app/domain/entity/MoviesEntity.dart';

abstract class HomeScreenStates {}

class GetMoviesSuccessState extends HomeScreenStates {
  MoviesResponseEntity response;

  GetMoviesSuccessState({required this.response});
}

class GetPopularMoviesErrorState extends HomeScreenStates {
  String error;

  GetPopularMoviesErrorState({required this.error});
}


class GetSpecificMoviesErrorState extends HomeScreenStates {
  String error;

  GetSpecificMoviesErrorState({required this.error});
}

class GetPopularMoviesLoadingState extends HomeScreenStates {
  GetPopularMoviesLoadingState();
}
class GetSpecificMoviesLoading extends HomeScreenStates {
  GetSpecificMoviesLoading();
}
