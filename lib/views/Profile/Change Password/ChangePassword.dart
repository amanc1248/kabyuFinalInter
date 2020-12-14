import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kabyu_feather_webs/Provider/ChangePassword/ChangePasswordProvider.dart';
import 'package:kabyu_feather_webs/views/Authentication/contants.dart';
import 'package:kabyu_feather_webs/views/Navigation/topnavigation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

var changePasswordProvider;

class _ChangePasswordState extends State<ChangePassword> {
  final firestoreInstance = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  //Getting old password function 👇
  getOldPassword() {
    final User user = auth.currentUser;
    final uid = user.uid;

    firestoreInstance
        .collection('users')
        .doc(uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document data: ${documentSnapshot.data()}');
        var theData = documentSnapshot.data();
        print(theData);
        print(theData['password']);

        changePasswordProvider.oldPassword = theData['password'];
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  //Updating the oldpassword with new one function. 👇
  updateThePassword() {
    final User user = auth.currentUser;
    final uid = user.uid;
    firestoreInstance
        .collection("users")
        .doc(uid)
        .update({"password": _newPassword.text}).then(
            (_) => print("successfully password changed"));
  }

  final GlobalKey<FormState> _changePasswordForm = GlobalKey<FormState>();

  final TextEditingController _oldPassword = TextEditingController();

  final TextEditingController _newPassword = TextEditingController();

  final TextEditingController _confirmPassword = TextEditingController();

  bool passwordEyeOldPassword = true;

  bool passwordEyeNewPassword = true;

  bool passwordEyeConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    changePasswordProvider =
        Provider.of<ChangePasswordProvider>(context, listen: false);
    getOldPassword();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.chevron_left,
            ),
          ),
          title: TopNavigationBar(),
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 13, right: 13),
              child: Icon(
                Icons.notifications,
                color: Color(0xff30009C),
                size: 30,
              ),
            )
          ],
          elevation: 0.0,
          titleSpacing: 0.0,
          centerTitle: false,
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
          iconTheme: IconThemeData(
            color: Color.fromRGBO(0, 0, 0, 0.87),
          ),
        ),
        backgroundColor: Colors.white,
        body: Container(
          child: SingleChildScrollView(
            child: Form(
              key: _changePasswordForm,
              child: Column(
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Change Password",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 16, bottom: 22),
                                    child: TextFormField(
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      obscureText: passwordEyeOldPassword,
                                      decoration: InputDecoration(
                                        border: kTextFieldBorder,
                                        enabledBorder: kTextFieldEnabledBorder,
                                        hintText: 'Old Password',
                                        labelText: "Old Password",
                                        suffixIcon: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              passwordEyeOldPassword =
                                                  !passwordEyeOldPassword;
                                            });
                                          },
                                          child: Icon(
                                            Icons.remove_red_eye,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                      ),
                                      controller: _oldPassword,
                                      validator: (val) {
                                        if (val.isEmpty) {
                                          return 'Empty';
                                        }
                                        if (val !=
                                            changePasswordProvider
                                                .oldPassword) {
                                          return 'Not Match';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "New Password",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 16),
                                    child: TextFormField(
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        obscureText: passwordEyeNewPassword,
                                        decoration: InputDecoration(
                                          border: kTextFieldBorder,
                                          enabledBorder:
                                              kTextFieldEnabledBorder,
                                          hintText: 'Password',
                                          labelText: "Password",
                                          suffixIcon: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                passwordEyeNewPassword =
                                                    !passwordEyeNewPassword;
                                              });
                                            },
                                            child: Icon(
                                              Icons.remove_red_eye,
                                              color: Color(0xff000000),
                                            ),
                                          ),
                                        ),
                                        controller: _newPassword,
                                        validator: (val) {
                                          if (val.isEmpty) {
                                            return "Empty";
                                          }
                                          return null;
                                        }),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        16, 4, 16, 22),
                                    child: Text(
                                      "Password should contain a90d9f",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 0),
                                    child: TextFormField(
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        obscureText: passwordEyeConfirmPassword,
                                        decoration: InputDecoration(
                                          border: kTextFieldBorder,
                                          enabledBorder:
                                              kTextFieldEnabledBorder,
                                          hintText: 'Confirm Password',
                                          labelText: "Confirm Password",
                                          suffixIcon: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                passwordEyeConfirmPassword =
                                                    !passwordEyeConfirmPassword;
                                              });
                                            },
                                            child: Icon(
                                              Icons.remove_red_eye,
                                              color: Color(0xff000000),
                                            ),
                                          ),
                                        ),
                                        controller: _confirmPassword,
                                        validator: (val) {
                                          if (val.isEmpty) {
                                            return "Empty";
                                          }
                                          if (val != _newPassword.text) {
                                            return 'Not Match';
                                          }
                                          return null;
                                        }),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        16, 4, 16, 22),
                                    child: Text(
                                      "Password should contain a90d9f",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 230, 16, 8),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Container(
                                height: 56,
                                decoration: BoxDecoration(),
                                child: FlatButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "CANCEL",
                                    style: TextStyle(
                                        color: Color.fromRGBO(176, 0, 32, 1),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              )),
                              Expanded(
                                  child: Container(
                                height: 56,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(98, 0, 238, 1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4))),
                                child: FlatButton(
                                  onPressed: () {
                                    if (_changePasswordForm.currentState
                                        .validate()) {
                                      updateThePassword();
                                    }
                                  },
                                  child: Text("SAVE",
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(255, 255, 255, 1),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500)),
                                ),
                              )),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
