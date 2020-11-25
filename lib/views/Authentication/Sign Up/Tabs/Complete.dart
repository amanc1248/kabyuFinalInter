import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:modal_progress_hud/modal_progress_hud.dart';

class CompleteEmail extends StatefulWidget {
  @override
  _CompleteEmailState createState() => _CompleteEmailState();
}

class _CompleteEmailState extends State<CompleteEmail> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 91),
      child: Container(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: SvgPicture.asset(
                  "assets/complete.svg",
                ),
              ),
            ),
            Text(
              "WELCOME",
              style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Abril Fatface",
                  color: Color.fromRGBO(0, 0, 0, 1)),
            ),
            Text(
              "We are setting up for you",
              style:
                  TextStyle(fontSize: 13, color: Color.fromRGBO(0, 0, 0, 0.6)),
            ),
            // ModalProgressHUD(inAsyncCall: true, child: Text("a"))
          ],
        ),
      ),
    );
  }
}
