import 'package:flutter/material.dart';
import 'package:kabyu_feather_webs/views/Hamburger/hamburgerOptions/Change%20Password/ChangePassword.dart';
import 'package:kabyu_feather_webs/views/Hamburger/hamburgerOptions/SettingOpen/SettingOpenclass.dart';

final List<SettingOpenClass> theSettingOpenClassList = [
  SettingOpenClass(iconName: "Change Password", iconSymbol: Icons.settings),
  SettingOpenClass(iconName: "Delete Account", iconSymbol: Icons.person),
];

class SettingOpen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 22, 0, 22),
                child: Icon(Icons.arrow_back),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
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
                                                  ChangePassword()),
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
