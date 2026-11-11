import 'package:flutter/material.dart';

class ChangeBgProvider extends ChangeNotifier {
  late  int selectedIndex ;

  void changeBG(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
