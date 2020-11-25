import 'package:flutter/material.dart';
import 'package:kabyu_feather_webs/views/Authentication/KitabTitle/maintitle.dart';
import 'package:kabyu_feather_webs/views/Authentication/Sign%20Up/Tabs/Complete.dart';
import 'package:kabyu_feather_webs/views/Authentication/Sign%20Up/Tabs/Email.dart';
import 'package:kabyu_feather_webs/views/Authentication/Sign%20Up/Tabs/Profile.dart';

class SignupEmail extends StatefulWidget {
  @override
  _SignupEmailState createState() => _SignupEmailState();
}

class _SignupEmailState extends State<SignupEmail>
    with SingleTickerProviderStateMixin {
  bool entryPermission = false;
  final List<Tab> myTabs = <Tab>[
    new Tab(text: 'EMAIL'),
    new Tab(text: 'PROFILE'),
    new Tab(text: 'COMPLETE'),
  ];
  TabController _tabController;
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: myTabs.length);
    _tabController.addListener(() {
      print("Selected Index: " + _tabController.index.toString());
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 50, bottom: 0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MainTitle(),
                  Container(
                    child: DefaultTabController(
                        length: myTabs.length,
                        child: Column(
                          children: [
                            Container(
                              // height: 50,
                              width: double.infinity,
                              child: IgnorePointer(
                                child: TabBar(
                                  controller: _tabController,
                                  unselectedLabelColor:
                                      Color.fromRGBO(0, 0, 0, 0.87),
                                  labelColor: Color(0xff9E9E9E),
                                  indicatorColor: Color.fromRGBO(98, 0, 238, 1),
                                  tabs: myTabs,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 28,
                            ),
                            Container(
                              width: double.infinity,
                              height: 500,
                              child: TabBarView(
                                  // physics: NeverScrollableScrollPhysics(),
                                  controller: _tabController,
                                  children: [
                                    EmailTab(
                                      theTabController: _tabController,
                                    ),
                                    ProfileTab(
                                      theTabController: _tabController,
                                    ),
                                    CompleteEmail()
                                  ]),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
