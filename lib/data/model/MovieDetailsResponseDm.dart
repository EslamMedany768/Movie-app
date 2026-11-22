import 'package:movies_app/domain/entity/MovieDetailsResponseEntity.dart';

class MovieDetailsResponseDm extends MovieDetailsResponseEntity{
  MovieDetailsResponseDm({
      super.adult,
      super.backdropPath,
      super.belongsToCollection,
      super.budget,
      super.genres,
      super.homepage,
      super.id,
      super.imdbId,
      super.originCountry,
      super.originalLanguage,
      super.originalTitle,
      super.overview,
      super.popularity,
      super.posterPath,
      super.productionCompanies,
      super.productionCountries,
      super.releaseDate,
      super.revenue,
      super.runtime,
      super.softcore,
      super.spokenLanguages,
      super.status,
      super.tagline,
      super.title,
      super.video,
      super.voteAverage,
      super.voteCount,});

  MovieDetailsResponseDm.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    belongsToCollection = json['belongs_to_collection'] != null ? BelongsToCollectionDm.fromJson(json['belongs_to_collection']) : null;
    budget = json['budget'];
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(GenresDm.fromJson(v));
      });
    }
    homepage = json['homepage'];
    id = json['id'];
    imdbId = json['imdb_id'];
    originCountry = json['origin_country'] != null ? json['origin_country'].cast<String>() : [];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    if (json['production_companies'] != null) {
      productionCompanies = [];
      json['production_companies'].forEach((v) {
        productionCompanies?.add(ProductionCompaniesDm.fromJson(v));
      });
    }
    if (json['production_countries'] != null) {
      productionCountries = [];
      json['production_countries'].forEach((v) {
        productionCountries?.add(ProductionCountriesDm.fromJson(v));
      });
    }
    releaseDate = json['release_date'];
    revenue = json['revenue'];
    runtime = json['runtime'];
    softcore = json['softcore'];
    if (json['spoken_languages'] != null) {
      spokenLanguages = [];
      json['spoken_languages'].forEach((v) {
        spokenLanguages?.add(SpokenLanguagesDm.fromJson(v));
      });
    }
    status = json['status'];
    tagline = json['tagline'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }




}

class SpokenLanguagesDm extends SpokenLanguagesEntity{
  SpokenLanguagesDm({
      super.englishName,
    super.iso6391,
    super.name,});

  SpokenLanguagesDm.fromJson(dynamic json) {
    englishName = json['english_name'];
    iso6391 = json['iso_639_1'];
    name = json['name'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['english_name'] = englishName;
    map['iso_639_1'] = iso6391;
    map['name'] = name;
    return map;
  }

}

class ProductionCountriesDm extends ProductionCountriesEntity{
  ProductionCountriesDm({
      super.iso31661,
    super.name,});

  ProductionCountriesDm.fromJson(dynamic json) {
    iso31661 = json['iso_3166_1'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['iso_3166_1'] = iso31661;
    map['name'] = name;
    return map;
  }

}

class ProductionCompaniesDm extends ProductionCompaniesEntity{
  ProductionCompaniesDm({
      super.id,
    super.logoPath,
    super.name,
    super.originCountry,});

  ProductionCompaniesDm.fromJson(dynamic json) {
    id = json['id'];
    logoPath = json['logo_path'];
    name = json['name'];
    originCountry = json['origin_country'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['logo_path'] = logoPath;
    map['name'] = name;
    map['origin_country'] = originCountry;
    return map;
  }

}

class GenresDm extends GenresEntity{
  GenresDm({
      super.id,
    super.name,});

  GenresDm.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}

class BelongsToCollectionDm extends BelongsToCollectionEntity{
  BelongsToCollectionDm({
      super.id,
      super.name,
      super.posterPath,
      super.backdropPath,});

  BelongsToCollectionDm.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    posterPath = json['poster_path'];
    backdropPath = json['backdrop_path'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['poster_path'] = posterPath;
    map['backdrop_path'] = backdropPath;
    return map;
  }

}