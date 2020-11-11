import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kabyu_feather_webs/views/Authentication/KitabTitle/maintitle.dart';
import 'package:kabyu_feather_webs/views/Authentication/Sign%20Up/LowerPart/AlreadyHaveAnAccount.dart';
import 'package:kabyu_feather_webs/views/Authentication/Sign%20Up/LowerPart/Button.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 50, bottom: 55),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MainTitle(),
                Container(
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    border: Border.all(
                      color: Color(0xff000000),
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
                Padding(
                  padding: EdgeInsets.only(bottom: 26),
                  child: TextField(
                    decoration: InputDecoration(
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.teal)),
                      hintText: 'E-mail',
                      labelText: "E-mail",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 26),
                  child: TextField(
                      decoration: InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.teal)),
                    hintText: 'Input-text',
                    labelText: "Password",
                    suffixIcon: Icon(
                      Icons.remove_red_eye,
                      color: Color(0xff000000),
                    ),
                  )),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 26),
                  child: TextField(
                      decoration: InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.teal)),
                    hintText: 'Confirm Password',
                    labelText: "Confirm Password",
                    suffixIcon: Icon(
                      Icons.remove_red_eye,
                      color: Color(0xff000000),
                    ),
                  )),
                ),
                NextButton(),
                AlreadyHaveAnAccount()
              ],
            ),
          ),
        ),
      )),
    );
  }
}
