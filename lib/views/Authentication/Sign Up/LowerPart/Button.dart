import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final TabController emailprofilecompleteController;
  NextButton({this.emailprofilecompleteController});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xff6200EE),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      height: 56,
      width: double.infinity,
      child: Center(
        child: Text(
          "NEXT",
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
