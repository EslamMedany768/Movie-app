class EndPoints {
  static const String apiRequestPopularMovies = "/3/movie/popular";

  ///todo:add id of categories movies in apiManager
  static const String apiRequestGenreList = "/3/genre/movie/list?language=en";

  static const String apiRequestSpecificMovies =
      "/3/discover/movie?include"
      "_adult=false&include_video=false&language=en-US&page=1&"
      "sort_by=popularity.desc&with_genres=";
}
