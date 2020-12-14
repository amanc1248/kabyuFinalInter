import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kabyu_feather_webs/views/Navigation/buttomNavigationBar.dart';
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
  goToWishListPage() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyHomePage()));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    googleSignInProvider =
        Provider.of<GoogleSignInProvider>(context, listen: false);

    return Consumer<GoogleSignInProvider>(
      builder: (context, value, child) => Padding(
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
                style: TextStyle(
                    fontSize: 13, color: Color.fromRGBO(0, 0, 0, 0.6)),
              ),
              SizedBox(
                height: 20,
              ),
              googleSignInProvider.showSpinner
                  ? CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(
                          Color.fromRGBO(98, 0, 238, 1)),
                    )
                  : Container(child: goToWishListPage())
            ],
          ),
        ),
      ),
    );
  }
}
