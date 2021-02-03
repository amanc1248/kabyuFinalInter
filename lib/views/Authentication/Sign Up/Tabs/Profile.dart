import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kabyu_feather_webs/views/Authentication/Sign%20Up/LowerPart/AlreadyHaveAnAccount.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:kabyu_feather_webs/Provider/GoogleSignInProvider/GoogleSignInProvider.dart';

FirebaseAuth auth = FirebaseAuth.instance;
final firestoreSave = FirebaseFirestore.instance;

class ProfileTab extends StatefulWidget {
  final TabController theTabController;
  ProfileTab({
    @required this.theTabController,
  });
  @override
  _ProfileTabState createState() => _ProfileTabState();
}

GoogleSignInProvider googleSignInProvider;
bool emailExists = false;

class _ProfileTabState extends State<ProfileTab> {
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                    'Account already exists with same email address, try creating account with another email'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushNamedAndRemoveUntil(
                    context, "/signUpForm", (r) => false);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    googleSignInProvider =
        Provider.of<GoogleSignInProvider>(context, listen: false);

    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 43),
            child: Center(child: ImagePick()),
          ),
          Row(
            children: [
              Expanded(
                child: FlatButton(
                    onPressed: () {
                      SchedulerBinding.instance.addPostFrameCallback((_) {
                        googleSignInProvider.createUser();
                        print("👇👇emailExists Value: ");
                        print(emailExists);
                        if (googleSignInProvider.signUpError == true) {
                          print("dude you have some error");
                          _showMyDialog();
                        } else {
                          Future.delayed(Duration.zero, () {
                            widget.theTabController.animateTo(
                              (widget.theTabController.index + 1),
                            );
                          });
                        }
                      });
                    },
                    child: Container(
                        child: Text(
                      "SKIP",
                      style: TextStyle(
                          color: Color.fromRGBO(98, 0, 238, 1),
                          fontSize: 14,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w500),
                    ))),
              ),
              Expanded(
                child: Container(
                  height: 56,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(98, 0, 238, 1),
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  child: FlatButton(
                    onPressed: () async {
                      SchedulerBinding.instance.addPostFrameCallback((_) {
                        googleSignInProvider.createUser();
                        if (googleSignInProvider.signUpError == true) {
                          print("dude you have some error");
                          _showMyDialog();
                        } else {
                          Future.delayed(Duration.zero, () {
                            widget.theTabController.animateTo(
                              (widget.theTabController.index + 1),
                            );
                          });
                        }
                      }); // Going to another tab👇
                    },
                    child: Text("DONE",
                        style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 14,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w500)),
                  ),
                ),
              )
            ],
          ),
          AlreadyHaveAnAccount()
        ],
      ),
    );
  }
}

final picker = ImagePicker();

class ImagePick extends StatefulWidget {
  @override
  _ImagePickState createState() => _ImagePickState();
}

class _ImagePickState extends State<ImagePick> {
  // var pickedFile =;
  Future pickImageFromGallery() async {
    var pickedFile = await picker.getImage(source: ImageSource.gallery);
    // var pickedFile = await picker.getImage(source: ImageSource.gallery);
    googleSignInProvider.imageFile = null;

    setState(() {
      googleSignInProvider.imageFile = File(pickedFile.path);
    });
  }

  Future pickImageFromCamera() async {
    var pickedFile = await picker.getImage(source: ImageSource.camera);
    googleSignInProvider.imageFile = null;

    setState(() {
      googleSignInProvider.imageFile = File(pickedFile.path);
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        pickImageFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      pickImageFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showPicker(context);
      },
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
        child: googleSignInProvider.imageFile != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(75),
                child: Image.file(
                  googleSignInProvider.imageFile,
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              )
            : Container(
                decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(75)),
                width: 150,
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 75,
                      child: Text("A",
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 72,
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                    Container(
                      width: 150,
                      height: 75,
                      decoration: BoxDecoration(
                          color: Colors.black38,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(150),
                            bottomRight: Radius.circular(150),
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.camera_alt,
                            color: Colors.black38,
                            size: 16,
                          ),
                          Text("Upload photo",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              )),
                          SizedBox(height: 15)
                        ],
                      ),
                    )
                  ],
                )),
      ),
    );
  }
}
