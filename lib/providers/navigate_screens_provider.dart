import 'package:flutter/cupertino.dart';

class NavigateScreensProvider extends ChangeNotifier {
  int selectedIndex = 0;

  updateIndex(int newIndex) {
    if (newIndex == selectedIndex) {
      return;
    }
    selectedIndex = newIndex;
    notifyListeners();
    print(selectedIndex);
  }
}
