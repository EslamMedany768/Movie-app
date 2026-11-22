import 'package:movies_app/domain/entity/MovieDetailsResponseEntity.dart';

abstract class MovieDetailsStates {}

class MovieDetailsSuccessState extends MovieDetailsStates {

}

class MovieDetailsErrorState extends MovieDetailsStates {
  String error;
  MovieDetailsErrorState({required this.error});
}

class MovieDetailsLoadingState extends MovieDetailsStates {
  MovieDetailsLoadingState();
}
