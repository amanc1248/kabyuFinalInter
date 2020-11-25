import 'package:flutter/material.dart';
import 'package:kabyu_feather_webs/Widgets/BookOverview.dart';
import 'package:kabyu_feather_webs/Model/Hamburger%20Model/HamburgerOptionsClass.dart';
import 'package:kabyu_feather_webs/views/Navigation/topnavigation.dart';
import 'package:kabyu_feather_webs/views/ProductsSale/MyProducts/MyProducts.dart';
import 'package:kabyu_feather_webs/views/Profile/SettingOpen/SettingOpen.dart';

final List<HamburgerOptions> theHamburgerOptionsList = [
  HamburgerOptions(
      iconName: "Setting", iconSymbol: Icons.settings, theRoute: SettingOpen()),
  HamburgerOptions(
      iconName: "Profile", iconSymbol: Icons.person, theRoute: SettingOpen()),
  HamburgerOptions(
      iconName: "My Products",
      iconSymbol: Icons.card_travel,
      theRoute: MyProducts()),
  HamburgerOptions(
      iconName: "Logout",
      iconSymbol: Icons.arrow_forward,
      theRoute: MyProducts())
];

// class MainWishListPage extends StatefulWidget {
//   @override
//   _MainWishListPageState createState() => _MainWishListPageState();
// }

// class _MainWishListPageState extends State<MainWishListPage> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: WishListPage(),
//     );
//   }
// }

class WishListPage extends StatefulWidget {
  static const String id = 'wishlistPage';

  @override
  _WishListPageState createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
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
              color: Color.fromRGBO(35, 3, 106, 1),
            ),
          ),
          backgroundColor: Colors.white,
          drawerScrimColor: Color.fromRGBO(18, 18, 18, 0.5),
          drawer: Drawer(
            child: Container(
              color: Colors.white,
              child: Column(
                // Important: Remove any padding from the ListView.
                children: <Widget>[
                  DrawerHeader(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.close,
                            color: Color.fromRGBO(48, 0, 156, 1),
                          ),
                        ),
                        SizedBox(
                          height: 23,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Masama Nikine",
                                          // bookStoresDetails[theIndex].bookStoreName,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: 1,
                                        ),
                                        Text(
                                          // bookStoresDetails[theIndex].newMessage.toString() +
                                          "Click to view profile",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.6)),
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
                  Expanded(
                    child: Container(
                      child: ListView.builder(
                        itemCount: theHamburgerOptionsList.length,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        theHamburgerOptionsList[index]
                                            .theRoute));
                          },
                          child: ListTile(
                            leading:
                                Icon(theHamburgerOptionsList[index].iconSymbol),
                            title:
                                Text(theHamburgerOptionsList[index].iconName),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: Container(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration:
                        BoxDecoration(color: Color.fromRGBO(248, 248, 248, 1)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "My Wishlist",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          BookOverview()
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
