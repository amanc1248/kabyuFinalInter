import 'package:flutter/material.dart';

class ChangePassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 22, 0, 0),
                  child: Icon(Icons.arrow_back),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Change Password",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 16, bottom: 22),
                            child: TextField(
                                decoration: InputDecoration(
                              border: new OutlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.teal)),
                              hintText: 'Old Password',
                              labelText: "Old Password",
                              suffixIcon: Icon(
                                Icons.remove_red_eye,
                                color: Color(0xff000000),
                              ),
                            )),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "New Password",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 16),
                            child: TextField(
                                decoration: InputDecoration(
                              border: new OutlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.teal)),
                              hintText: 'Password',
                              labelText: "Password",
                              suffixIcon: Icon(
                                Icons.remove_red_eye,
                                color: Color(0xff000000),
                              ),
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 4, 16, 22),
                            child: Text(
                              "Password should contain a90d9f",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 0),
                            child: TextField(
                                decoration: InputDecoration(
                              border: new OutlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.teal)),
                              hintText: 'Confirm Password',
                              labelText: "Confirm Password",
                              suffixIcon: Icon(
                                Icons.remove_red_eye,
                                color: Color(0xff000000),
                              ),
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 4, 16, 22),
                            child: Text(
                              "Password should contain a90d9f",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 250, 16, 8),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        height: 56,
                        decoration: BoxDecoration(),
                        child: FlatButton(
                          onPressed: () {},
                          child: Text(
                            "CANCEL",
                            style: TextStyle(
                                color: Color.fromRGBO(176, 0, 32, 1),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      )),
                      Expanded(
                          child: Container(
                        height: 56,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(98, 0, 238, 1),
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        child: FlatButton(
                          onPressed: () {},
                          child: Text("SAVE",
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500)),
                        ),
                      )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
