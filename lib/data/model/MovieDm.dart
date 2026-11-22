import 'package:movies_app/domain/entity/MoviesEntity.dart';

class MovieResponseDm extends MoviesResponseEntity {
  MovieResponseDm({
    super.page,
    super.results,
    super.totalPages,
    super.totalResults,
  });

  MovieResponseDm.fromJson(dynamic json) {
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(MovieDm.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}

class MovieDm extends MovieEntity {
  static String historyCollection = "History";

  MovieDm({
    super.adult,
    super.backdropPath,
    super.genreIds,
    super.id,
    super.title,
    super.originalLanguage,
    super.originalTitle,
    super.overview,
    super.popularity,
    super.posterPath,
    super.releaseDate,
    super.softcore,
    super.video,
    super.voteAverage,
    super.voteCount,
  });

  MovieDm.fromMovieEntity(MovieEntity movieEntity) {
    id = movieEntity.id;
    title = movieEntity.title;
    genreIds=movieEntity.genreIds;
    adult=movieEntity.adult;
    backdropPath=movieEntity.backdropPath;
    originalLanguage = movieEntity.originalLanguage;
    originalTitle = movieEntity.originalTitle;
    overview = movieEntity.overview;
    popularity = movieEntity.popularity;
    posterPath = movieEntity.posterPath;
    releaseDate = movieEntity.releaseDate;
    softcore = movieEntity.softcore;
    video = movieEntity.video;
    voteAverage = movieEntity.voteAverage;
    voteCount = movieEntity.voteCount;
  }
  MovieEntity toMovieEntity(){
   return MovieEntity(
      id: id,
      title: title,
      originalLanguage: originalLanguage,
      originalTitle: originalTitle,
      overview: overview,
      popularity: popularity,
      posterPath: posterPath,
      releaseDate: releaseDate,
      softcore: softcore,
      video: video,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }

  MovieDm.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<num>() : [];
    id = json['id'];
    title = json['title'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    softcore = json['softcore'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  static Map<String, dynamic> toJson(MovieDm movie) {
    return {
      "adult": movie.adult,
      "backdrop_path": movie.backdropPath,
      "genre_ids": movie.genreIds,
      "id": movie.id,
      "title": movie.title,
      "original_language": movie.originalLanguage,
      "original_title": movie.originalTitle,
      "overview": movie.overview,
      "popularity": movie.popularity,
      "poster_path": movie.posterPath,
      "release_date": movie.releaseDate,
      "softcore": movie.softcore,
      "video": movie.video,
      "vote_average": movie.voteAverage,
      "vote_count": movie.voteCount,
    };
  }
}
