import 'package:flutter/material.dart';
import 'package:kabyu_feather_webs/Provider/BottomNavigationProvider/BottomNavigationProvider.dart';
import 'package:kabyu_feather_webs/views/1.%20WishlistPage/Wishlist.dart';
import 'package:kabyu_feather_webs/views/2.%20ExplorePage/Explore.dart';
import 'package:kabyu_feather_webs/views/3.%20ChatPage/ChatListBookStore/ChatListBookStore.dart';
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
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: _widgetOptions.elementAt(bottomNavigationBar.selectedIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0.0,
            backgroundColor: Colors.white,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: "Wishlist"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.explore), label: "Explore"),
              BottomNavigationBarItem(icon: Icon(Icons.message), label: "Chat"),
            ],
            currentIndex: bottomNavigationBar.selectedIndex,
            selectedItemColor: Color(0xff23036A),
            unselectedItemColor: Color(0xff985EFF),
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
