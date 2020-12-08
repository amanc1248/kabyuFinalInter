import 'package:flutter/material.dart';

class ProviderClass extends ChangeNotifier {
 


  //3) Loggin out
  bool _logOutSpinner = true;
  bool get logOutSpinner => _logOutSpinner;
  set logOutSpinner(bool val) {
    _logOutSpinner = val;
    notifyListeners();
  }
}
