import 'package:flutter/material.dart';

class MainTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 21),
        child: Text(
          "Kitab",
          style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.w400,
              fontFamily: "Abril Fatface",
              color: Color(0xff23036A)),
        ),
      ),
    );
  }
}
