import 'package:flutter/material.dart';
import 'package:kabyu_feather_webs/views/1.%20WishlistPage/Wishlist.dart';
import 'package:kabyu_feather_webs/views/2.%20ExplorePage/Explore.dart';
import 'package:kabyu_feather_webs/views/3.%20ChatPage/Chat.dart';
import 'package:kabyu_feather_webs/views/product_individual.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = [
    WishListPage(),
    ProductIndividual(),
    ChatPage(),
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
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text("Wishlist")),
            BottomNavigationBarItem(
                icon: Icon(Icons.speaker_notes), title: Text("Explore")),
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
