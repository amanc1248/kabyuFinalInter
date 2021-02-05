import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kabyu_feather_webs/Provider/GoogleSignInProvider/GoogleSignInProvider.dart';
import 'package:kabyu_feather_webs/Widgets/commonbuttons.dart';
import 'package:kabyu_feather_webs/Widgets/text_field.dart';
import 'package:kabyu_feather_webs/services/database.dart';
import 'package:kabyu_feather_webs/views/Navigation/topnavigation.dart';

import 'package:kabyu_feather_webs/Widgets/image_pick_profile.dart';
import 'package:provider/provider.dart';

class ProfileEdit extends StatefulWidget {
  @override
  _ProfileEditState createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  TextEditingController name;
  TextEditingController address;
  TextEditingController contact;
  TextEditingController email;

  @override
  void initState() {
    name = TextEditingController();
    address = TextEditingController();
    contact = TextEditingController();
    email = TextEditingController();
    super.initState();
  }

  GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    GoogleSignInProvider googleSignInProvider =
        Provider.of<GoogleSignInProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: GestureDetector(
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => MyHomePage()));
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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 45),
                child: ImagePickProfile(),
              ),
              Form(
                key: _key,
                child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 10,
                    ),
                    color: Color(0xffF8F8F8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Personal Info",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        TextFieldProperty(
                          title: "Name",
                          hint: "Name",
                          textFieldController: name,
                          initialValue: googleSignInProvider.userDetails[2],
                          validator: (val) {
                            if (val.isEmpty) {
                              return "Can't be left empty!";
                            }

                            return null;
                          },
                        ),
                        TextFieldProperty(
                          title: "Address",
                          hint: "Address",
                          textFieldController: address,
                          initialValue: googleSignInProvider.userDetails[4],
                          validator: (val) {
                            if (val.isEmpty) {
                              return "Can't be left empty!";
                            }

                            return null;
                          },
                        ),
                        TextFieldProperty(
                          title: "Contact",
                          hint: "Numbers only",
                          textFieldController: contact,
                          initialValue: googleSignInProvider.userDetails[3],
                          validator: (val) {
                            if (val.isEmpty) {
                              return "Can't be left empty!";
                            }

                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CommonButtons(
                            text: "Save",
                            pressed: () async {
                              if (_key.currentState.validate()) {
                                updateTheProfile(name.text, address.text,
                                    contact.text, email.text);
                                Get.dialog(
                                  AlertDialog(
                                    title: Text("Done!"),
                                    content: Text("Profile Updated!"),
                                  ),
                                  barrierDismissible: false,
                                );

                                await Future.delayed(Duration(seconds: 3));

                                Navigator.pushNamedAndRemoveUntil(
                                    context, "/homePage", (r) => false);
                              } else {
                                Get.dialog(
                                  AlertDialog(
                                    title: Text("Error"),
                                    content: Text("Please fill all the fields"),
                                  ),
                                  barrierDismissible: false,
                                );

                                await Future.delayed(Duration(seconds: 3));

                                Navigator.of(Get.overlayContext).pop();
                              }
                            }),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
