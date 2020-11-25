import 'package:flutter/material.dart';
import 'package:kabyu_feather_webs/views/Authentication/contants.dart';
import 'package:kabyu_feather_webs/views/Navigation/topnavigation.dart';

class ChangePassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.chevron_left,
            ),
          ),
          title: TopNavigationBar(),
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 13, right: 13),
              child: Icon(
                Icons.notifications,
                color: Color(0xff30009C),
                size: 30,
              ),
            )
          ],
          elevation: 0.0,
          titleSpacing: 0.0,
          centerTitle: false,
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
          iconTheme: IconThemeData(
            color: Color.fromRGBO(0, 0, 0, 0.87),
          ),
        ),
        backgroundColor: Colors.white,
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Change Password",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 16, bottom: 22),
                                  child: TextField(
                                      decoration: InputDecoration(
                                    border: kTextFieldBorder,
                                    enabledBorder: kTextFieldEnabledBorder,
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
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 16),
                                  child: TextField(
                                      decoration: InputDecoration(
                                    border: kTextFieldBorder,
                                    enabledBorder: kTextFieldEnabledBorder,
                                    hintText: 'Password',
                                    labelText: "Password",
                                    suffixIcon: Icon(
                                      Icons.remove_red_eye,
                                      color: Color(0xff000000),
                                    ),
                                  )),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 4, 16, 22),
                                  child: Text(
                                    "Password should contain a90d9f",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 0),
                                  child: TextField(
                                      decoration: InputDecoration(
                                    border: kTextFieldBorder,
                                    enabledBorder: kTextFieldEnabledBorder,
                                    hintText: 'Confirm Password',
                                    labelText: "Confirm Password",
                                    suffixIcon: Icon(
                                      Icons.remove_red_eye,
                                      color: Color(0xff000000),
                                    ),
                                  )),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 4, 16, 22),
                                  child: Text(
                                    "Password should contain a90d9f",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 230, 16, 8),
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4))),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
