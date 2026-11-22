import 'MovieDm.dart';

class UserDm {
  static String userCollection = "User";
  String? id;
  String? email;
  String? name;
  String? phone;
  String? image;

  UserDm({
    required this.id ,
    required this.email,
    required this.name,
    required this.phone,
    required this.image,
  });

 static Map<String, dynamic> toFireStore(UserDm user) {
    return {
      "id": user.id,
      "email": user.email,
      "name": user.name,
      "phone": user.phone,
      "image": user.image,

    };
  }


  UserDm.fromFireStore(Map<String, dynamic> map)
    : this(
        id: map["id"],
        email: map["email"],
        name: map["name"],
        phone: map["phone"],
    image: map["image"],
      );
}
