import 'package:flutter/material.dart';
import 'package:kabyu_feather_webs/Widgets/commonbuttons.dart';
import 'package:kabyu_feather_webs/Widgets/text_field.dart';
import 'package:kabyu_feather_webs/views/Navigation/topnavigation.dart';

import 'package:kabyu_feather_webs/widgets/tags.dart';

class ProfileEdit extends StatefulWidget {
  @override
  _ProfileEditState createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductTags(),
            Container(
              child: Column(
                children: [
                  TopNavigationBar(
                      // Icon: Icons.chevron_left,
                      ),
                  SizedBox(
                    height: 10,
                  ),
                  // ImagePick(),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10,
                ),
                color: Color(0XFFF8F8F8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Expanded(
                    //   child: Container(
                    //     child: ListView.builder(
                    //         itemCount: getProfileTextFields().length,
                    //         itemBuilder: (ctxt, index) {
                    //           return TextFieldProperty(
                    //               textFields: getProfileTextFields()[index]);
                    //         }),
                    //   ),
                    // ),
                    Text(
                      "Personal Info",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    TextFieldProperty(
                      title: "Name",
                      hint: "Title of your book",
                    ),
                    TextFieldProperty(
                      title: "Name",
                      hint: "Title of your book",
                    ),
                    TextFieldProperty(
                      title: "Name",
                      hint: "Title of your book",
                    ),
                    TextFieldProperty(
                      title: "Name",
                      hint: "Title of your book",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CommonButtons(),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
