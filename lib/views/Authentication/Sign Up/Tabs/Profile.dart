import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kabyu_feather_webs/Model/Provider/provider.dart';
import 'package:kabyu_feather_webs/views/Authentication/Sign%20Up/LowerPart/AlreadyHaveAnAccount.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:kabyu_feather_webs/views/Authentication/Sign%20Up/imagepick.dart';

FirebaseAuth auth = FirebaseAuth.instance;
final firestoreSave = FirebaseFirestore.instance;

class ProfileTab extends StatefulWidget {
  final TabController theTabController;
  ProfileTab({@required this.theTabController});
  @override
  _ProfileTabState createState() => _ProfileTabState();
}

var theProvider;

class _ProfileTabState extends State<ProfileTab> {
  File _image;
  _imgFromCamera() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  _imgFromGallery() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    theProvider = Provider.of<ProviderClass>(context, listen: false);

    return Container(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      widget.theTabController
                          .animateTo((widget.theTabController.index + 1));
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
                    onPressed: () {
                      firestoreSave.collection('users').add({
                        'email': theProvider.userDetails[0],
                        'password': theProvider.userDetails[1],
                        'name': theProvider.userDetails[2],
                        'phone_number': theProvider.userDetails[3],
                        'address': theProvider.userDetails[4],
                      }).then((value) {
                        print(value.id);
                        widget.theTabController
                            .animateTo((widget.theTabController.index + 1));
                      });
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
