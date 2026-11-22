import 'package:movies_app/domain/entity/ScreenShotResponseEntity.dart';

class ScreenShotResponseDm extends ScreenShotResponseEntity{
  ScreenShotResponseDm({
      super.id,
      super.backdrops,
      super.logos,
      super.posters,});

  ScreenShotResponseDm.fromJson(dynamic json) {
    id = json['id'];
    if (json['backdrops'] != null) {
      backdrops = [];
      json['backdrops'].forEach((v) {
        backdrops?.add(BackdropsDm.fromJson(v));
      });
    }
    if (json['logos'] != null) {
      logos = [];
      json['logos'].forEach((v) {
        logos?.add(LogosDm.fromJson(v));
      });
    }
    if (json['posters'] != null) {
      posters = [];
      json['posters'].forEach((v) {
        posters?.add(PostersDm.fromJson(v));
      });
    }
  }



}

class PostersDm extends PostersEntity{
  PostersDm({
      super.aspectRatio,
      super.height,
      super.iso31661,
      super.iso6391,
      super.filePath,
      super.voteAverage,
      super.voteCount,
      super.width,});

  PostersDm.fromJson(dynamic json) {
    aspectRatio = json['aspect_ratio'];
    height = json['height'];
    iso31661 = json['iso_3166_1'];
    iso6391 = json['iso_639_1'];
    filePath = json['file_path'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    width = json['width'];
  }




}

class LogosDm extends LogosEntity{
  LogosDm({
      super.aspectRatio,
      super.height,
      super.iso31661,
      super.iso6391,
      super.filePath,
      super.voteAverage,
      super.voteCount,
      super.width,});

  LogosDm.fromJson(dynamic json) {
    aspectRatio = json['aspect_ratio'];
    height = json['height'];
    iso31661 = json['iso_3166_1'];
    iso6391 = json['iso_639_1'];
    filePath = json['file_path'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    width = json['width'];
  }




}

class BackdropsDm extends BackdropsEntity{
  BackdropsDm({
      super.aspectRatio,
      super.height,
      super.iso31661,
      super.iso6391,
      super.filePath,
      super.voteAverage,
      super.voteCount,
      super.width,});

  BackdropsDm.fromJson(dynamic json) {
    aspectRatio = json['aspect_ratio'];
    height = json['height'];
    iso31661 = json['iso_3166_1'];
    iso6391 = json['iso_639_1'];
    filePath = json['file_path'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    width = json['width'];
  }



}