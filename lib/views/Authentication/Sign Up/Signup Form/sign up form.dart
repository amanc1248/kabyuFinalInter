import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';import 'package:kabyu_feather_webs/Provider/GoogleSignInProvider/GoogleSignInProvider.dart';
import 'package:kabyu_feather_webs/views/1.%20WishlistPage/Wishlist.dart';
import 'package:kabyu_feather_webs/views/Authentication/KitabTitle/maintitle.dart';
import 'package:kabyu_feather_webs/views/Authentication/Sign%20Up/LowerPart/AlreadyHaveAnAccount.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kabyu_feather_webs/Widgets/EmailPasswordConfim.dart';
import 'package:kabyu_feather_webs/views/Authentication/Sign%20Up/Authentication/auth.dart';
import 'package:provider/provider.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

var googleSignInProvider;

class _SignUpFormState extends State<SignUpForm> {
  User user;
  void initState() {
    super.initState();
    AuthHelper.logOut();
  }

  void click() {
    googleSignInProvider.signInWithGoogle().then((user) => {
          this.user = user,
          googleSignInProvider.createUser(),
          googleSignInProvider.storeUserData(),
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => WishListPage()))
        });
  }

  String email;
  String password;
  String confirmPassword;

  @override
  Widget build(BuildContext context) {
    googleSignInProvider =
        Provider.of<GoogleSignInProvider>(context, listen: false);
    AuthHelper.logOut();
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 50, bottom: 25),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MainTitle(),
                    GestureDetector(
                      onTap: () async {
                        click();
                      },
                      child: Container(
                        height: 56,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border: Border.all(
                            color: Color.fromRGBO(0, 0, 0, 0.12),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.google,
                              color: Colors.orangeAccent,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "SIGNUP WITH GOOGLE",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Roboto",
                                  color: Color(0xff6200EE)),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        "OR",
                        style: TextStyle(
                            color: Color(0xffA4A4A4),
                            fontSize: 20,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    // EmailPasswordConfirmPassword textfield 👇
                    EmailPasswordConfirmPassword(),

                    AlreadyHaveAnAccount()
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
