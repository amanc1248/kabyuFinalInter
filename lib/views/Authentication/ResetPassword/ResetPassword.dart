import 'package:flutter/material.dart';
import 'package:kabyu_feather_webs/Provider/GoogleSignInProvider/GoogleSignInProvider.dart';
import 'package:kabyu_feather_webs/views/Authentication/KitabTitle/maintitle.dart';
import 'package:kabyu_feather_webs/views/Authentication/contants.dart';
import 'package:provider/provider.dart';
import 'package:email_validator/email_validator.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  GlobalKey<FormState> _resetKey = GlobalKey<FormState>();

  GoogleSignInProvider googleSignInProvider;
  final TextEditingController _email = TextEditingController();

  @override
  Future<void> _resetPassword() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Reset password link sent'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                    'Follow the link sent in your email to reset the password.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, "/loginForm", (r) => false);
              },
            ),
          ],
        );
      },
    );
  }

  Widget build(BuildContext context) {
    googleSignInProvider =
        Provider.of<GoogleSignInProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
            child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 50, bottom: 55),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MainTitle(),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Text(
                    "Reset Password",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xffA4A4A4),
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Form(
                  key: _resetKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 26),
                        child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              border: kTextFieldBorder,
                              enabledBorder: kTextFieldEnabledBorder,
                              hintText: 'E-mail',
                              labelText: "E-mail",
                            ),
                            controller: _email,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "empty";
                              }
                              if (EmailValidator.validate(value) == true) {
                                return null;
                              }
                              if (EmailValidator.validate(value) == false) {
                                return "Please enter valid email address";
                              }

                              return null;
                            }),
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
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      height: 56,
                      width: double.infinity,
                      child: FlatButton(
                          onPressed: () {
                            if (_resetKey.currentState.validate()) {
                              googleSignInProvider.resetPassword(_email.text);
                              _resetPassword();
                            }
                          },
                          child: Center(
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          )),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/loginForm", (r) => false);
                  },
                  child: Text(
                    "Return to Sign In",
                    style: TextStyle(
                        color: Color(0xff23036A),
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
