import 'package:flutter/material.dart';

class DefaultTabBarProvider extends ChangeNotifier {
  int selectedIndex = 0;

   updateIndex(int newIndex) {
    if (newIndex == selectedIndex) {
      return;
    }
    selectedIndex = newIndex;
    notifyListeners();
  }
}
