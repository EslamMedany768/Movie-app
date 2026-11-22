import 'package:movies_app/domain/entity/MoviesEntity.dart';

abstract class SearchStates {}

class SearchInitialState extends SearchStates {}

class SearchSuccessState extends SearchStates {
  MoviesResponseEntity moviesResponse;

  SearchSuccessState({required this.moviesResponse});
}

class SearchErrorState extends SearchStates {
  String error;

  SearchErrorState({required this.error});
}

class SearchLoadingState extends SearchStates {}
