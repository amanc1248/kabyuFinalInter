import 'package:flutter/cupertino.dart';

class BottomNavigationProvider extends ChangeNotifier {
  //1) For bottom navigation bar selected index. 👇
  int _selectedIndex =0;
  int get selectedIndex => _selectedIndex;
  set selectedIndex(int val) {
    _selectedIndex = val;
    notifyListeners();
  }
}
