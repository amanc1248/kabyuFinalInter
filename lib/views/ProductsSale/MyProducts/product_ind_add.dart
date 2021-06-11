import 'package:flutter_tagging/flutter_tagging.dart';
import 'package:kabyu_feather_webs/Model/category_model.dart';
import 'package:kabyu_feather_webs/Provider/ProductsProvider/productsProvider.dart';
import 'package:flutter/material.dart';
import 'package:kabyu_feather_webs/constants.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:kabyu_feather_webs/Widgets/commonbuttons.dart';
import 'package:kabyu_feather_webs/Widgets/image_pick.dart';
import 'package:kabyu_feather_webs/Widgets/text_field.dart';
import 'package:kabyu_feather_webs/services/database.dart';
import 'package:kabyu_feather_webs/views/Navigation/topnavigation.dart';
import 'package:get/get.dart';

class ProductInAdd extends StatefulWidget {
  // Changes the selected value on 'onChanged' click on each radio button
  @override
  _ProductInAddState createState() => _ProductInAddState();
}

class _ProductInAddState extends State<ProductInAdd> {
  int _radioValue1 = 0;
  bool _checkboxValue1 = false;
  bool _checkboxValue2 = false;

  String _selectedValuesJson = 'Nothing to show';
  List<CategoryModel> _selectedCategorys;

  String radio = "";
  String check1 = "";
  String check2 = "";
  String productImageName;
  TextEditingController titleController;
  TextEditingController authorController;
  TextEditingController categoryController;
  List<CategoryModel> category = [];
  TextEditingController descriptionController;
  TextEditingController priceController;
  AddProductsProvider addProductsProvider;

  void _handleRadioValueChange1(int value) {
    setState(() {
      _radioValue1 = value;
    });
  }

  void _handleCheckBoxValueChange1(bool value) {
    setState(() {
      _checkboxValue1 = value;
    });
  }

  void _handleCheckBoxValueChange2(bool value) {
    setState(() {
      _checkboxValue2 = value;
    });
  }

  @override
  void initState() {
    super.initState();
    _selectedCategorys = [];
    titleController = new TextEditingController();
    categoryController = new TextEditingController();
    authorController = new TextEditingController();
    descriptionController = new TextEditingController();
    priceController = new TextEditingController();
  }

  bool isSwitched = false;

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
      });
      addProductsProvider.toggleContact = isSwitched;
    } else {
      setState(() {
        isSwitched = false;
      });
      addProductsProvider.toggleContact = isSwitched;
    }
  }

  GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
          child: Padding(
            padding: const EdgeInsets.only(top: 38.0),
            child: Form(
              key: _key,
              child: Column(
                children: [
                  Container(
                    child: ImagePick(),
                  ),
                  SizedBox(
                    height: 40,
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
                          Text(
                            "Book Description",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          TextFieldProperty(
                            textFieldController: titleController,
                            title: "Title",
                            hint: "Title of your book",
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Can't be left empty!";
                              }

                              return null;
                            },
                          ),
                          TextFieldProperty(
                            textFieldController: authorController,
                            title: "Author",
                            hint: "Autor of the book",
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Can't be left empty!";
                              }

                              return null;
                            },
                          ),
                          FlutterTagging<CategoryModel>(
                            initialItems: _selectedCategorys,
                            textFieldConfiguration: TextFieldConfiguration(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Search Tags',
                                labelText: 'Select Tags',
                              ),
                            ),
                            findSuggestions: CategoryService.getCategorys,
                            additionCallback: (value) {
                              return CategoryModel(
                                name: value,
                              );
                            },
                            onAdded: (category) {
                              // api calls here, triggered when add to tag button is pressed

                              return CategoryModel();
                            },
                            configureSuggestion: (lang) {
                              return SuggestionConfiguration(
                                title: Text(lang.name),
                                additionWidget: Chip(
                                  avatar: Icon(
                                    Icons.add_circle,
                                    color: Colors.white,
                                  ),
                                  label: Text('Add New Tag'),
                                  labelStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  backgroundColor: Colors.blue,
                                ),
                              );
                            },
                            configureChip: (lang) {
                              return ChipConfiguration(
                                label: Text(lang.name),
                                backgroundColor: Colors.blue,
                                labelStyle: TextStyle(color: Colors.white),
                                deleteIconColor: Colors.white,
                              );
                            },
                            onChanged: () {
                              print(
                                  "this helps to submit the category*****************************************************");
                              // List<Category> category = [];
                              // category.add(lang);
                            },
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: TextFormField(
                              //style: TextStyle(textBaseline: TextBaseline.alphabetic, height: height),
                              controller: descriptionController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 2,
                                  ),
                                ),
                                labelText: "Description",
                                hintText: "Description",
                                contentPadding: new EdgeInsets.symmetric(
                                    vertical: 100.0, horizontal: 10),
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Can't be left empty!";
                                }

                                return null;
                              },
                            ),
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
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Available for : ",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: _checkboxValue1,
                                        onChanged: _handleCheckBoxValueChange1,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _checkboxValue1 = true;
                                          });
                                        },
                                        child: Text("Exchange"),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: _checkboxValue2,
                                        onChanged: _handleCheckBoxValueChange2,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _checkboxValue2 = true;
                                          });
                                        },
                                        child: Text("Sell"),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Contact Details :",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Switch(
                                onChanged: toggleSwitch,
                                value: isSwitched,
                                activeColor: Colors.blue,
                                activeTrackColor: Colors.lightBlue,
                                inactiveThumbColor: Colors.grey,
                                inactiveTrackColor: Colors.grey,
                              ),
                            ],
                          ),
                          TextFieldProperty(
                            textFieldController: priceController,
                            title: "Price",
                            hint: "In Rupees",
                            height: 0.7,
                            type: TextInputType.number,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Can't be left empty!";
                              }

                              return null;
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CommonButtons(
                            text: "PUBLISH",
                            pressed: () async {
                              if (_key.currentState.validate()) {
                                if (titleController.text.isNotEmpty &&
                                    descriptionController.text.isNotEmpty) {
                                  if (_radioValue1 == 0) {
                                    radio = "Brand new";
                                  } else {
                                    radio = "Used";
                                  }
                                  if (_checkboxValue1 = true) {
                                    check1 = "Exchange";
                                  }
                                  if (_checkboxValue2 = true) {
                                    check2 = "Sell";
                                  }
                                  if (_checkboxValue1 = false) {
                                    check1 = "Nothing was selected";
                                  }
                                  if (_checkboxValue2 = false) {
                                    check2 = "Nothing was selected";
                                  }

                                  print(
                                      "THis is the product image name ****************************************************");
                                  print(productImageName);
                                  SharedPreferences pref =
                                      await SharedPreferences.getInstance();
                                  String userId = pref.getString("userId");

                                  await setProduct(
                                      title: titleController.text,
                                      author: authorController.text,
                                      description: descriptionController.text,
                                      radio: radio,
                                      check1: check1,
                                      check2: check2,
                                      price: priceController.text,
                                      imageName: addProductProvider.image,
                                      seller: userId);
                                }
                                Get.dialog(
                                  AlertDialog(
                                    title: Text("Done!"),
                                    content: Text("Book uploaded"),
                                    // actions: <Widget>[
                                    //   FlatButton(
                                    //     child: Text("CLOSE"),
                                    //     onPressed: () {
                                    //       Navigator.of(Get.overlayContext).pop();
                                    //     },
                                    //   )
                                    // ],
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
                                    // actions: <Widget>[
                                    //   FlatButton(
                                    //     child: Text("CLOSE"),
                                    //     onPressed: () {
                                    //       Navigator.of(Get.overlayContext).pop();
                                    //     },
                                    //   )
                                    // ],
                                  ),
                                  barrierDismissible: false,
                                );

                                await Future.delayed(Duration(seconds: 3));

                                Navigator.of(Get.overlayContext).pop();
                              }
                            },
                          )
                        ],
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryService {
  static Future<List<CategoryModel>> getCategorys(String query) async {
    await Future.delayed(Duration(milliseconds: 500), null);
    print("this is the categories service part" + categories.toString());
    print(
        "***************this is the categories part*************************************");
    return categories
        .where((lang) => lang.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}

/// Category Class
