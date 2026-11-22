import 'package:flutter/material.dart';
import 'package:movies_app/data/model/UserDm.dart';

class UserProvider extends ChangeNotifier {
  UserDm? currentUser;

  void updateUser(UserDm? newUser) {
    if (newUser == null) {
      currentUser = UserDm(
        id: "null",
        email: "null",
        name: "null",
        phone: "null",
        image: "null"
      );
    } else if (newUser == currentUser) {
      return;
    }
    currentUser = newUser;
    notifyListeners();
  }
}
