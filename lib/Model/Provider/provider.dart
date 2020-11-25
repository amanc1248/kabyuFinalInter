import 'package:flutter/material.dart';

class ProviderClass extends ChangeNotifier {
  //1) Stores the userDetails 👇

  List _userDetails = new List(5);
  List get userDetails => _userDetails;
  set userDetails(List val) {
    _userDetails = val;
    notifyListeners();
  }
}
