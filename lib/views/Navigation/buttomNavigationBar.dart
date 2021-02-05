import 'package:flutter/material.dart';
import 'package:kabyu_feather_webs/Provider/BottomNavigationProvider/BottomNavigationProvider.dart';
import 'package:kabyu_feather_webs/views/1.%20WishlistPage/Wishlist.dart';
import 'package:kabyu_feather_webs/views/2.%20ExplorePage/Explore.dart';
import 'package:kabyu_feather_webs/views/3.%20ChatPage/ChatListBookStore/ChatListBookStore.dart';
import 'package:kabyu_feather_webs/views/ProductsSale/MyProducts/product_ind_add.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var bottomNavigationBar;

  final List<Widget> _widgetOptions = [
    WishListPage(),
    ExplorePage(),
    ChatListBookStore(),
    ProductInAdd()
  ];

  void _onItemTapped(int index) {
    bottomNavigationBar.selectedIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    bottomNavigationBar =
        Provider.of<BottomNavigationProvider>(context, listen: false);
    return Consumer<BottomNavigationProvider>(
      builder: (context, value, child) => SafeArea(
        child: Scaffold(
            // floatingActionButtonLocation:
            //     FloatingActionButtonLocation.miniEndFloat,
            // floatingActionButton: Stack(
            //   overflow: Overflow.visible,
            //   children: [
            //     Positioned(
            //       right: 0,
            //       bottom: -70,
            //       child: Container(
            //         width: 78,
            //         child: FloatingActionButton(
            //             onPressed: () {
            //               Navigator.push(
            //                   context,
            //                   MaterialPageRoute(
            //                       builder: (context) => ProductInAdd()));
            //             },
            //             shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(4)),
            //             backgroundColor: Color.fromRGBO(35, 3, 106, 1),
            //             child: Center(
            //                 child: Text(
            //               " + Sell",
            //               style: TextStyle(fontWeight: FontWeight.w400),
            //             ))),
            //       ),
            //     )
            //   ],
            // ),
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child:
                  _widgetOptions.elementAt(bottomNavigationBar.selectedIndex),
            ),
            bottomNavigationBar: Stack(
              overflow: Overflow.visible,
              children: [
                Positioned(
                  child: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    elevation: 0.0,
                    backgroundColor: Colors.white,
                    items: const <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                          icon: Icon(Icons.favorite), label: "Wishlist"),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.explore), label: "Explore"),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.message),
                        label: "Chat",
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.message),
                        label: "+ Sell",
                      ),
                    ],
                    currentIndex: bottomNavigationBar.selectedIndex,
                    selectedItemColor: Color(0xff23036A),
                    unselectedItemColor: Color.fromRGBO(0, 0, 0, 0.38),
                    onTap: _onItemTapped,
                  ),
                ),
                Positioned(
                  right: 16,
                  // bottom: -70,
                  child: Container(
                    width: 78,
                    child: FloatingActionButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductInAdd()));
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                        backgroundColor: Color.fromRGBO(35, 3, 106, 1),
                        child: Center(
                            child: Text(
                          " + Sell",
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ))),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
