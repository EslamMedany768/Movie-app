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


}
