import 'package:flutter/material.dart';
import 'package:kabyu_feather_webs/Model/user.dart';

class ProviderClass extends ChangeNotifier {
  //1) Stores the userDetails 👇
  List<User> _userDetails = [];
  List<User> get userDetails => _userDetails;
  set userDetails(List<User> val) {
    _userDetails = val;
    notifyListeners();
  }
}
