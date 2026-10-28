import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  ///data
  String currentLang = "en";

  ///logic
  changeLang(String newLang) {
    if (newLang != currentLang) {
      currentLang = newLang;
      notifyListeners();
    }
  }
}
