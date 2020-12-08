import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kabyu_feather_webs/views/Authentication/Login/Login%20form.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kabyu_feather_webs/Provider/GoogleSignInProvider/GoogleSignInProvider.dart';

FirebaseAuth auth = FirebaseAuth.instance;
final firestoreSave = FirebaseFirestore.instance;

class CompleteEmail extends StatefulWidget {
  @override
  _CompleteEmailState createState() => _CompleteEmailState();
}

var googleSignInProvider;

class _CompleteEmailState extends State<CompleteEmail> {
  @override
  Widget build(BuildContext context) {
    googleSignInProvider =
        Provider.of<GoogleSignInProvider>(context, listen: false);
    googleSignInProvider.createUser();
    googleSignInProvider.storeUserData();
    googleSignInProvider.showSpinner = false;
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
            googleSignInProvider.showSpinner
                ? CircularProgressIndicator()
                : Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()))
          ],
        ),
      ),
    );
  }
}
