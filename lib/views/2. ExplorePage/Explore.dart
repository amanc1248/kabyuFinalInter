import 'package:flutter/material.dart';
import 'package:kabyu_feather_webs/views/Navigation/topnavigation.dart';

class ExplorePage extends StatefulWidget {
  static const String id = 'explorePage';

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: [TopNavigationBar()],
      ),
    ));
  }
}
