import 'package:flutter/material.dart';
import 'package:kabyu_feather_webs/Widgets/commonbuttons.dart';
import 'package:kabyu_feather_webs/Widgets/text_field.dart';
import 'package:kabyu_feather_webs/views/Navigation/topnavigation.dart';

class ProductInAdd extends StatefulWidget {
  // Changes the selected value on 'onChanged' click on each radio button
  @override
  _ProductInAddState createState() => _ProductInAddState();
}

class _ProductInAddState extends State<ProductInAdd> {
  int _radioValue1 = 0;
  // bool _checkboxValue1 = false;
  // bool _checkboxValue2 = false;

  void _handleRadioValueChange1(int value) {
    setState(() {
      _radioValue1 = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [TopNavigationBar()],
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
                      "Book Description",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    TextFieldProperty(
                      title: "Name",
                      hint: "Title of your book",
                    ),
                    Row(
                      children: [
                        Text(
                          "Condition",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 25,
                          child: Radio(
                            value: 0,
                            groupValue: _radioValue1,
                            onChanged: _handleRadioValueChange1,
                            activeColor: Color(0XFF6200EE),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _radioValue1 = 0;
                            });
                          },
                          child: Text("Brand new"),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 25,
                          child: Radio(
                            value: 1,
                            groupValue: _radioValue1,
                            onChanged: _handleRadioValueChange1,
                            activeColor: Color(0XFF6200EE),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _radioValue1 = 1;
                            });
                          },
                          child: Text("Used"),
                        ),
                      ],
                    ),
                    Text("Available for"),
                    Row(
                      children: [
                        Text(
                          "Available for",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        // SizedBox(
                        //   width: 25,
                        //   child: Checkbox(
                        //     // value: ,

                        //     // onChanged: _checkboxValue1,
                        //     activeColor: Color(0XFF6200EE),
                        //   ),
                        // ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _radioValue1 = 0;
                            });
                          },
                          child: Text("Brand new"),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 25,
                          child: Radio(
                            value: 1,
                            groupValue: _radioValue1,
                            onChanged: _handleRadioValueChange1,
                            activeColor: Color(0XFF6200EE),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _radioValue1 = 1;
                            });
                          },
                          child: Text("Used"),
                        ),
                      ],
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
