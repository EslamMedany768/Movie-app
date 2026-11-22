import 'package:movies_app/domain/entity/MoviesEntity.dart';

abstract class ProfileHistoryStates {}

class ProfileHistoryInitialState extends ProfileHistoryStates {}

class ProfileAddMovieToHistorySuccessStates extends ProfileHistoryStates {
  String message;

  ProfileAddMovieToHistorySuccessStates({required this.message});
}

class ProfileAddMovieToHistoryErrorStates extends ProfileHistoryStates {
  String error;

  ProfileAddMovieToHistoryErrorStates({required this.error});
}

class GetMovieHistorySuccessState extends ProfileHistoryStates {
  List<MovieEntity> moviesHistory;

  GetMovieHistorySuccessState({required this.moviesHistory});
}

class GetMovieHistoryErrorState extends ProfileHistoryStates {
  String error;

  GetMovieHistoryErrorState({required this.error});
}

class GetMovieHistoryLoadingState extends ProfileHistoryStates {}
