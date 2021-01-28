import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kabyu_feather_webs/views/Authentication/Sign%20Up/Tabs/Profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

FirebaseAuth auth = FirebaseAuth.instance;
final firestoreSave = FirebaseFirestore.instance;
final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

class GoogleSignInProvider extends ChangeNotifier {
  // clearUserId() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   await preferences.clear();
  //   print("Clearing Shared Preference");
  // }

  //signInWIthGoogle method 👇
  signInWithGoogle() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    final acc = await googleSignIn.signIn();
    final auth = await acc.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: auth.accessToken, idToken: auth.idToken);
    final res = await _auth.signInWithCredential(credential);
    final _user = res.user;

    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("userId", _user.uid);

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
      if (userCredential != null) {
        showSpinner = true;
        print("The spinner is true right now");
        await uploadImageToFirebase();
        await storeUserData();
        print("The spinner is FALSE1 right now");
        showSpinner = false;
        print("The spinner is FALSE2 right now");
      }
    } catch (e) {
      signUpError = true;
      print(e);
      print("We have a signup error");
    }
  }

  //Saving to firebase database 👇
  storeUserData() async {
    print("i am inside user database ");
    SharedPreferences pref = await SharedPreferences.getInstance();
    String userId = pref.getString("userId");
    entryUserId = userId;
    userDetails[6] = userId;
    await firestoreSave.collection('users').doc(userId).set({
      'email': userDetails[0],
      'password': userDetails[1],
      'name': userDetails[2],
      'phone_number': userDetails[3],
      'address': userDetails[4],
      'image': userDetails[5],
      'user_id': userDetails[6]
    }).catchError((onError) {
      print(
          "you have a erroryou have a erroryou have a erroryou have a erroryou have a erroryou have a erroryou have a erroryou have a error");
    });
    print("**************************************");
    print(userDetails);
    print("**************************************");
  }

  //Uploading image to firebase👇
  uploadImageToFirebase() async {
    if (_imageFile == null) {
      print("Image will be not shown in your profile");
    } else {
      String fileName = basename(_imageFile.path);
      Reference firebaseStorageRef =
          FirebaseStorage.instance.ref().child('uploads/$fileName');
      UploadTask uploadTask = firebaseStorageRef.putFile(_imageFile);
      TaskSnapshot taskSnapshot = await uploadTask;
      await taskSnapshot.ref.getDownloadURL().then((value) {
        print("Done: $value");
        userDetails[5] = value;
        print(userDetails);
      });
    }
  }

  //reseting password 👇
  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  User user;

  click() async {
    await signInWithGoogle().then((user) => {this.user = user, createUser()});
  }

  //1) Stores the userDetails 👇
  List _userDetails = new List(7);
  List get userDetails => _userDetails;
  set userDetails(List val) {
    _userDetails = val;
    notifyListeners();
  }

  //2) showing spinner
  bool _showSpinner = true;
  bool get showSpinner => _showSpinner;
  set showSpinner(bool val) {
    _showSpinner = val;
    notifyListeners();
  }

  //3) User Image file
  File _imageFile;
  File get imageFile => _imageFile;
  set imageFile(File val) {
    _imageFile = val;
    notifyListeners();
  }

  //4) user Id
  String _entryUserId;
  String get entryUserId => _entryUserId;
  set entryUserId(String val) {
    _entryUserId = val;
    notifyListeners();
  }

  //5) signup error
  bool _signUpError = false;
  bool get signUpError => _signUpError;
  set signUpError(bool val) {
    _signUpError = val;
    notifyListeners();
  }
}
