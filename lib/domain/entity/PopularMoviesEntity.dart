class PopularMoviesEntity {
  PopularMoviesEntity({
      this.page, 
      this.results, 
      this.totalPages, 
      this.totalResults,});


  num? page;
  List<ResultsEntity>? results;
  num? totalPages;
  num? totalResults;



}

class ResultsEntity {
  ResultsEntity({
      this.adult, 
      this.backdropPath, 
      this.genreIds, 
      this.id, 
      this.title, 
      this.originalLanguage, 
      this.originalTitle, 
      this.overview, 
      this.popularity, 
      this.posterPath, 
      this.releaseDate, 
      this.softcore, 
      this.video, 
      this.voteAverage, 
      this.voteCount,});


  bool? adult;
  String? backdropPath;
  List<num>? genreIds;
  num? id;
  String? title;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  num? popularity;
  String? posterPath;
  String? releaseDate;
  bool? softcore;
  bool? video;
  num? voteAverage;
  num? voteCount;



}