import 'package:flutter/material.dart';
import 'package:kabyu_feather_webs/views/Hamburger/hamburgerOptions/HamburgerOptionsClass.dart';
import 'package:kabyu_feather_webs/views/Hamburger/hamburgerOptions/SettingOpen/SettingOpen.dart';

final List<HamburgerOptions> theHamburgerOptionsList = [
  HamburgerOptions(iconName: "Setting", iconSymbol: Icons.settings),
  HamburgerOptions(iconName: "Profile", iconSymbol: Icons.person),
  HamburgerOptions(iconName: "My Products", iconSymbol: Icons.card_travel),
  HamburgerOptions(iconName: "Logout", iconSymbol: Icons.arrow_forward)
];

class Hamburger extends StatelessWidget {
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
                padding: EdgeInsets.fromLTRB(16, 30, 16, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.remove_circle_outline,
                      color: Color.fromRGBO(48, 0, 156, 1),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => ()),
                        // );
                      },
                      child: Container(
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundImage:
                                      AssetImage("assets/profileimage.jpg"),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Masama Nikine",
                                      // bookStoresDetails[theIndex].bookStoreName,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      // bookStoresDetails[theIndex].newMessage.toString() +
                                      "Click to view profile",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromRGBO(0, 0, 0, 0.6)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Color.fromRGBO(33, 33, 33, 0.08),
                thickness: 1.0,
                height: 10.0,
              ),
              Expanded(
                child: Container(
                  child: ListView.builder(
                      itemCount: theHamburgerOptionsList.length,
                      itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 16),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SettingOpen()));
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    theHamburgerOptionsList[index].iconSymbol,
                                    color: Color.fromRGBO(102, 102, 102, 1),
                                  ),
                                  SizedBox(
                                    width: 35,
                                  ),
                                  Text(
                                    theHamburgerOptionsList[index].iconName,
                                    style: TextStyle(
                                        color: Color.fromRGBO(102, 102, 102, 1),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                          )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
