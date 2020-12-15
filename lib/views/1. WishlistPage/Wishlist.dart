import 'package:flutter/material.dart';
import 'package:kabyu_feather_webs/Provider/ProductsProvider/productsProvider.dart';
import 'package:kabyu_feather_webs/Widgets/BookOverview.dart';
import 'package:kabyu_feather_webs/Model/Hamburger%20Model/HamburgerOptionsClass.dart';
import 'package:kabyu_feather_webs/views/Authentication/Sign%20Up/Signup%20Form/sign%20up%20form.dart';
import 'package:kabyu_feather_webs/views/Navigation/topnavigation.dart';
import 'package:kabyu_feather_webs/views/ProductsSale/MyProducts/MyProducts.dart';
import 'package:kabyu_feather_webs/views/Profile/SettingOpen/SettingOpen.dart';
import 'package:provider/provider.dart';

class WishListPage extends StatefulWidget {
  static const String id = 'wishlistPage';

  @override
  _WishListPageState createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  void initState() {
    Provider.of<WishlistProvider>(context, listen: false).loadwishList();

    super.initState();
  }

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
          drawerScrimColor: Color.fromRGBO(18, 18, 18, 0.5),
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
