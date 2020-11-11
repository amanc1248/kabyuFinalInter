import 'package:flutter/material.dart';
import 'package:kabyu_feather_webs/views/Authentication/Login/Login%20form.dart';

class NextButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Container(
          decoration: BoxDecoration(
              color: Color(0xff6200EE),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          height: 56,
          width: double.infinity,
          child: FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            },
            child: Center(
              child: Text(
                "NEXT",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
