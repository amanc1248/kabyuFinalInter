import 'package:flutter/material.dart';
import 'package:kabyu_feather_webs/views/1.%20WishlistPage/Wishlist.dart';
import 'package:kabyu_feather_webs/views/2.%20ExplorePage/Explore.dart';
import 'package:kabyu_feather_webs/views/3.%20ChatPage/ChatListBookStore/ChatListBookStore.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = [
    WishListPage(),
    ExplorePage(),
    ChatListBookStore(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), title: Text("Wishlist")),
            BottomNavigationBarItem(
                icon: Icon(Icons.explore), title: Text("Explore")),
            BottomNavigationBarItem(
                icon: Icon(Icons.message), title: Text("Chat")),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color(0xff23036A),
          unselectedItemColor: Color(0xff985EFF),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
