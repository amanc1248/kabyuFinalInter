import 'package:flutter/material.dart';
import 'package:kabyu_feather_webs/views/Navigation/topnavigation.dart';
import 'package:kabyu_feather_webs/views/ProductsSale/MyProducts/MyProducts.dart';
import 'package:kabyu_feather_webs/views/Profile/Change%20Password/ChangePassword.dart';
import 'package:kabyu_feather_webs/views/Profile/SettingOpen/SettingOpenclass.dart';

final List<SettingOpenClass> theSettingOpenClassList = [
  SettingOpenClass(
      iconName: "Change Password",
      iconSymbol: Icons.settings,
      theRoute: ChangePassword()),
  SettingOpenClass(
      iconName: "Delete Account",
      iconSymbol: Icons.person,
      theRoute: MyProducts()),
];
// final List<Widget> theRoutes = [
//   ProfileTab(),
//   MyProducts(),
//   ChangePassword()
// ];

class SettingOpen extends StatelessWidget {
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(18, 10, 18, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Settings",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: Container(
                          child: ListView.builder(
                              itemCount: theSettingOpenClassList.length,
                              itemBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  theSettingOpenClassList[index]
                                                      .theRoute),
                                        );
                                      },
                                      child: Row(
                                        children: [
                                          Icon(
                                            theSettingOpenClassList[index]
                                                .iconSymbol,
                                            color: Color.fromRGBO(
                                                102, 102, 102, 1),
                                          ),
                                          SizedBox(
                                            width: 35,
                                          ),
                                          Text(
                                            theSettingOpenClassList[index]
                                                .iconName,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    102, 102, 102, 1),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          )
                                        ],
                                      ),
                                    ),
                                  )),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
