import 'package:flutter/widgets.dart';

class BottomNavBarVM with ChangeNotifier {
  int selectedIndex = 0;
  void onTapItem(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
