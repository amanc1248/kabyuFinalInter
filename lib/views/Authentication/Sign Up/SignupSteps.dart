import 'package:flutter/material.dart';
import 'package:kabyu_feather_webs/views/Authentication/KitabTitle/maintitle.dart';
import 'package:kabyu_feather_webs/views/Authentication/Sign%20Up/LowerPart/AlreadyHaveAnAccount.dart';
import 'package:kabyu_feather_webs/views/Authentication/Sign%20Up/Tabs/Complete.dart';
import 'package:kabyu_feather_webs/views/Authentication/Sign%20Up/Tabs/Email.dart';
import 'package:kabyu_feather_webs/views/Authentication/Sign%20Up/Tabs/Profile.dart';

class SignupEmail extends StatefulWidget {
  @override
  _SignupEmailState createState() => _SignupEmailState();
}

class _SignupEmailState extends State<SignupEmail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 50, bottom: 55),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MainTitle(),
                Container(
                  child: DefaultTabController(
                      length: 3,
                      child: Column(
                        children: [
                          Container(
                            height: 50,
                            width: double.infinity,
                            child: TabBar(
                              unselectedLabelColor:
                                  Color.fromRGBO(0, 0, 0, 0.87),
                              labelColor: Color(0xff9E9E9E),
                              indicatorColor: Color.fromRGBO(98, 0, 238, 1),
                              tabs: [
                                Tab(text: "EMAIL"),
                                Tab(text: "PROFILE"),
                                Tab(text: "COMPLETE"),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 300,
                            child: TabBarView(children: [
                              EmailTab(),
                              ProfileTab(),
                              CompleteEmail()
                            ]),
                          )
                        ],
                      )),
                ),
                AlreadyHaveAnAccount()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
