class GenreListEntity {
  GenreListEntity({this.genres});

  List<GenresEntity>? genres;
}

class GenresEntity {
  GenresEntity({this.id, this.name,this.index});
  int? index;
  num? id;
  String? name;
}
