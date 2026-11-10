import 'package:movies_app/domain/entity/PopularMoviesEntity.dart';

class PopularMovieDm extends PopularMoviesEntity {
  PopularMovieDm({
    super.page,
    super.results,
    super.totalPages,
    super.totalResults,
  });

  PopularMovieDm.fromJson(dynamic json) {
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(ResultsDm.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }


}

class ResultsDm extends ResultsEntity {
  ResultsDm({
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

  ResultsDm.fromJson(dynamic json) {
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
