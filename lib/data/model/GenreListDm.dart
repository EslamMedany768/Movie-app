import 'package:movies_app/domain/entity/GenreListEntity.dart';

class GenreListDm extends GenreListEntity {
  GenreListDm({super.genres});

  GenreListDm.fromJson(dynamic json) {
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(GenresDm.fromJson(v));
      });
    }
  }
}

class GenresDm extends GenresEntity {
  GenresDm({super.id, super.name,super.index});

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
