import 'package:flutter/material.dart';
import 'package:kabyu_feather_webs/Navigator/buttons.dart';
// import 'package:kabyu_feather_webs/views/1.%20WishlistPage/Wishlist.dart';
// import 'package:kabyu_feather_webs/views/3.%20ChatPage/Chat.dart';
// import 'package:kabyu_feather_webs/views/product_individual.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Buttons(),
    );
  }
}
