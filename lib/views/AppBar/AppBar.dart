import 'package:flutter/material.dart';
import 'package:kabyu_feather_webs/views/Navigation/topnavigation.dart';
class OurAppBar  {
  static   ourAppBar(context) {
    return AppBar(
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
    );
  }
}