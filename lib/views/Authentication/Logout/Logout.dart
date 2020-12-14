import 'package:flutter/material.dart';
import 'package:kabyu_feather_webs/views/Authentication/Sign%20Up/Authentication/auth.dart';

bool showSpinner = true;
var theProvider;

class Logout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // theProvider = Provider.of<ProviderClass>(context, listen: false);

    AuthHelper.logOut();
    return Scaffold(
      body: Center(
        child: Container(
          child: showSpinner ? CircularProgressIndicator() : SizedBox(),
        ),
      ),
    );
  }
}
