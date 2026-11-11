class EndPoints {
  static const String apiRequestPopularMovies = "/3/movie/popular";

  ///todo:add id of categories movies in apiManager
  ///{
  //   "genres": [
  //     {
  //       "id": 28,
  //       "name": "Action"
  //     },
  //     {
  //       "id": 12,
  //       "name": "Abenteuer"
  //     },
  //     {
  //       "id": 16,
  //       "name": "Animation"
  //     },
  //     {
  //       "id": 35,
  //       "name": "Komödie"
  //     },
  //     {
  //       "id": 80,
  //       "name": "Krimi"
  //     },
  //     {
  //       "id": 99,
  //       "name": "Dokumentarfilm"
  //     },
  //     {
  //       "id": 18,
  //       "name": "Drama"
  //     },
  //     {
  //       "id": 10751,
  //       "name": "Familie"
  //     },
  //     {
  //       "id": 14,
  //       "name": "Fantasy"
  //     },
  //     {
  //       "id": 36,
  //       "name": "Historie"
  //     },
  //     {
  //       "id": 27,
  //       "name": "Horror"
  //     },
  //     {
  //       "id": 10402,
  //       "name": "Musik"
  //     },
  //     {
  //       "id": 9648,
  //       "name": "Mystery"
  //     },
  //     {
  //       "id": 10749,
  //       "name": "Liebesfilm"
  //     },
  //     {
  //       "id": 878,
  //       "name": "Science Fiction"
  //     },
  //     {
  //       "id": 10770,
  //       "name": "TV-Film"
  //     },
  //     {
  //       "id": 53,
  //       "name": "Thriller"
  //     },
  //     {
  //       "id": 10752,
  //       "name": "Kriegsfilm"
  //     },
  //     {
  //       "id": 37,
  //       "name": "Western"
  //     }
  //   ]
  // }
  static const String apiRequestSpecificMovies =
      "/3/discover/movie?include"
      "_adult=false&include_video=false&language=en-US&page=1&"
      "sort_by=popularity.desc&with_genres=";

}
