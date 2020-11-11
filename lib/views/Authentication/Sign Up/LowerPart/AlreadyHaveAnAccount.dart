import 'package:flutter/material.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Have an account ? "),
              GestureDetector(
                child: Text(
                  "Sign in",
                  style: TextStyle(
                      color: Color(0xff23036A),
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
