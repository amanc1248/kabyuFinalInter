import 'package:flutter/cupertino.dart';
import 'package:kabyu_feather_webs/Model/UserDetail.dart';
import 'package:kabyu_feather_webs/services/database.dart';

class UserProvider extends ChangeNotifier {
  List<UserDetail> _userDetail;
  List<UserDetail> get userDetail => _userDetail;
  set userDetail(List<UserDetail> val) {
    _userDetail = val;
    notifyListeners();
  }

  loadUserDetail() async {
    List<UserDetail> userDetail = await getUserDetails();
    _userDetail = userDetail;
    notifyListeners();
  }
}
