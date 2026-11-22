class ScreenShotResponseEntity {
  ScreenShotResponseEntity({
      this.id, 
      this.backdrops, 
      this.logos, 
      this.posters,});

  num? id;
  List<BackdropsEntity>? backdrops;
  List<LogosEntity>? logos;
  List<PostersEntity>? posters;


}

class PostersEntity {
  PostersEntity({
      this.aspectRatio, 
      this.height, 
      this.iso31661, 
      this.iso6391, 
      this.filePath, 
      this.voteAverage, 
      this.voteCount, 
      this.width,});

  num? aspectRatio;
  num? height;
  String? iso31661;
  String? iso6391;
  String? filePath;
  num? voteAverage;
  num? voteCount;
  num? width;


}

class LogosEntity {
  LogosEntity({
      this.aspectRatio, 
      this.height, 
      this.iso31661, 
      this.iso6391, 
      this.filePath, 
      this.voteAverage, 
      this.voteCount, 
      this.width,});

  num? aspectRatio;
  num? height;
  String? iso31661;
  String? iso6391;
  String? filePath;
  num? voteAverage;
  num? voteCount;
  num? width;


}

class BackdropsEntity {
  BackdropsEntity({
      this.aspectRatio, 
      this.height, 
      this.iso31661, 
      this.iso6391, 
      this.filePath, 
      this.voteAverage, 
      this.voteCount, 
      this.width,});

  num? aspectRatio;
  num? height;
  dynamic iso31661;
  dynamic iso6391;
  String? filePath;
  num? voteAverage;
  num? voteCount;
  num? width;


}