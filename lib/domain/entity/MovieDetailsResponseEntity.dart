class MovieDetailsResponseEntity {
  MovieDetailsResponseEntity({
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originCountry,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.softcore,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  bool? adult;
  String? backdropPath;
  BelongsToCollectionEntity? belongsToCollection;
  num? budget;
  List<GenresEntity>? genres;
  String? homepage;
  num? id;
  String? imdbId;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  num? popularity;
  String? posterPath;
  List<ProductionCompaniesEntity>? productionCompanies;
  List<ProductionCountriesEntity>? productionCountries;
  String? releaseDate;
  num? revenue;
  num? runtime;
  bool? softcore;
  List<SpokenLanguagesEntity>? spokenLanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  num? voteAverage;
  num? voteCount;
}

class SpokenLanguagesEntity {
  SpokenLanguagesEntity({this.englishName, this.iso6391, this.name});

  String? englishName;
  String? iso6391;
  String? name;
}

class ProductionCountriesEntity {
  ProductionCountriesEntity({this.iso31661, this.name});

  String? iso31661;
  String? name;
}

class ProductionCompaniesEntity {
  ProductionCompaniesEntity({this.id, this.logoPath, this.name, this.originCountry});

  num? id;
  String? logoPath;
  String? name;
  String? originCountry;
}

class GenresEntity {
  GenresEntity({this.id, this.name});

  num? id;
  String? name;
}

class BelongsToCollectionEntity {
  BelongsToCollectionEntity({this.id, this.name, this.posterPath, this.backdropPath});

  num? id;
  String? name;
  String? posterPath;
  String? backdropPath;
}
