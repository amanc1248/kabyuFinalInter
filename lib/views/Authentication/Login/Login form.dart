import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kabyu_feather_webs/views/Authentication/KitabTitle/maintitle.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 50, bottom: 55),
          child: Container(
            child: SingleChildScrollView(
              child: Column(
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
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => Login()),
                            // );
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
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("No Account ? "),
                            GestureDetector(
                              child: Text(
                                "Sign up",
                                style: TextStyle(
                                    color: Color(0xff23036A),
                                    fontWeight: FontWeight.w600,
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
