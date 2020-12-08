import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kabyu_feather_webs/views/1.%20WishlistPage/Wishlist.dart';
import 'package:kabyu_feather_webs/views/Authentication/KitabTitle/maintitle.dart';
import 'package:kabyu_feather_webs/views/Authentication/Sign%20Up/Authentication/auth.dart';
import 'package:kabyu_feather_webs/views/Authentication/Sign%20Up/Signup%20Form/sign%20up%20form.dart';
import 'package:kabyu_feather_webs/views/Authentication/contants.dart';
import 'package:provider/provider.dart';
import 'package:kabyu_feather_webs/Provider/GoogleSignInProvider/GoogleSignInProvider.dart';

final TextEditingController _email = TextEditingController();
final TextEditingController _password = TextEditingController();

class Login extends StatefulWidget {
  // final GlobalKey<FormState> form;

  // final form;
  // Login({this.form});
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> _form = GlobalKey<FormState>();
  var googleLogInProvider;

  @override
  Widget build(BuildContext context) {
    googleLogInProvider =
        Provider.of<GoogleSignInProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 50, bottom: 55),
            child: Container(
              child: Column(
                children: [
                  MainTitle(),
                  GestureDetector(
                    onTap: () {
                      googleLogInProvider.signInWithGoogle();
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
                            "LOGIN WITH GOOGLE",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Roboto",
                                color: Colors.black),
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
                  Form(
                    key: _form,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 26),
                          child: TextFormField(
                            maxLength: 20,
                            decoration: InputDecoration(
                              border: kTextFieldBorder,
                              enabledBorder: kTextFieldEnabledBorder,
                              hintText: 'E-mail',
                              labelText: "E-mail",
                            ),
                            controller: _email,
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'Empty';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 26),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: kTextFieldBorder,
                              enabledBorder: kTextFieldEnabledBorder,
                              hintText: 'Input-text',
                              labelText: "Password",
                              suffixIcon: Icon(
                                Icons.remove_red_eye,
                                color: Color(0xff000000),
                              ),
                            ),
                            controller: _password,
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'Empty';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xff6200EE),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        height: 56,
                        width: double.infinity,
                        child: FlatButton(
                          onPressed: () async {
                            if (_form.currentState.validate()) {
                              try {
                                final user = await AuthHelper.signInWithEmail(
                                    email: _email.text,
                                    password: _password.text);
                                if (user != null) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => WishListPage(),
                                    ),
                                  );
                                }
                              } catch (e) {
                                print(e);
                              }
                            }
                          },
                          child: Center(
                            child: Text(
                              "LOGIN",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Forgot Password?",
                    style: TextStyle(
                        color: Color(0xff23036A),
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "No Account ? ",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUpForm()));
                              },
                              child: Text(
                                "Sign up",
                                style: TextStyle(
                                    color: Color(0xff23036A),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// class LoginTextForm extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return ;
//   }
// }
