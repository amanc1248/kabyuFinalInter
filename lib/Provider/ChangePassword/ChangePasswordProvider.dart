import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class ChangePasswordProvider extends ChangeNotifier {
  //1) oldPassword
  String _oldPassword;
  String get oldPassword => _oldPassword;
  set oldPassword(String val) {
    _oldPassword = val;
    notifyListeners();
  }
}
