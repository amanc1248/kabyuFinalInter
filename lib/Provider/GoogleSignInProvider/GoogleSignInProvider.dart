import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

FirebaseAuth auth = FirebaseAuth.instance;
final firestoreSave = FirebaseFirestore.instance;
final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

class GoogleSignInProvider extends ChangeNotifier {
  //signInWIthGoogle method 👇
  signInWithGoogle() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    final acc = await googleSignIn.signIn();
    final auth = await acc.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: auth.accessToken, idToken: auth.idToken);
    final res = await _auth.signInWithCredential(credential);
    final _user = res.user;

    userDetails[0] = "${_user.email}";
    userDetails[2] = "${_user.displayName}";
    userDetails[3] = "${_user.phoneNumber}";
    userDetails[5] = "${_user.photoURL}";
    return res.user;
  }

//Creating user in firebase👇
  createUser() async {
    print("i am inside create user ");
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      final UserCredential userCredential =
          await auth.createUserWithEmailAndPassword(
              email: userDetails[0], password: userDetails[1]);
      pref.setString("userId", userCredential.user.uid);
    } catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    }
  }

  //Saving to firebase database 👇
  storeUserData() async {
    print("i am inside user database ");
    SharedPreferences pref = await SharedPreferences.getInstance();
    String userId = pref.getString("userId");
    await firestoreSave.collection('users').doc(userId).set({
      'email': userDetails[0],
      'password': userDetails[1],
      'name': userDetails[2],
      'phone_number': userDetails[3],
      'address': userDetails[4],
      'photo_url': userDetails[5]
    }).catchError((onError) {
      print(
          "you have a erroryou have a erroryou have a erroryou have a erroryou have a erroryou have a erroryou have a erroryou have a error");
    });
  }

  //1) Stores the userDetails 👇
  List _userDetails = new List(6);
  List get userDetails => _userDetails;
  set userDetails(List val) {
    _userDetails = val;
    notifyListeners();
  }

  //2) showing spinner
  bool _showSpinner = false;
  bool get showSpinner => _showSpinner;
  set showSpinner(bool val) {
    _showSpinner = val;
    notifyListeners();
  }
}
