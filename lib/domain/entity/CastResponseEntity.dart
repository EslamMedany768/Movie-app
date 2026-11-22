class CastResponseEntity {
  CastResponseEntity({
      this.id, 
      this.cast, 
      this.crew,});

  num? id;
  List<CastEntity>? cast;
  List<CrewEntity>? crew;


}

class CrewEntity {
  CrewEntity({
      this.adult, 
      this.gender, 
      this.id, 
      this.knownForDepartment, 
      this.name, 
      this.originalName, 
      this.popularity, 
      this.profilePath, 
      this.creditId, 
      this.department, 
      this.job,});

  bool? adult;
  num? gender;
  num? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  num? popularity;
  String? profilePath;
  String? creditId;
  String? department;
  String? job;


}

class CastEntity {
  CastEntity({
      this.adult, 
      this.gender, 
      this.id, 
      this.knownForDepartment, 
      this.name, 
      this.originalName, 
      this.popularity, 
      this.profilePath, 
      this.castId, 
      this.character, 
      this.creditId, 
      this.order,});

  bool? adult;
  num? gender;
  num? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  num? popularity;
  String? profilePath;
  num? castId;
  String? character;
  String? creditId;
  num? order;


}