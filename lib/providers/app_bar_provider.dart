import 'package:flutter/material.dart';

class AppBarProvider extends ChangeNotifier {
  bool isAppBarVisible = true;

 void updateAppBar(bool value) {
    if (value == isAppBarVisible) {
      return;
    }
    isAppBarVisible = value;
    notifyListeners();
  }
}
