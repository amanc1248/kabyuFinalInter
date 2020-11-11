import 'package:flutter/material.dart';
import 'package:kabyu_feather_webs/views/1.%20WishlistPage/Widgets/BookOverview.dart';
import 'package:kabyu_feather_webs/views/Navigation/topnavigation.dart';

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
          backgroundColor: Colors.white,
          body: Container(
            child: Column(
              children: [
                TopNavigationBar(),
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
                            height: 20,
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
