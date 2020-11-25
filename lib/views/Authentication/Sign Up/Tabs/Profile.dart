import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kabyu_feather_webs/views/Authentication/Sign%20Up/LowerPart/AlreadyHaveAnAccount.dart';

class ProfileTab extends StatefulWidget {
  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  PickedFile _image;
  final picker = ImagePicker();

  Future getImage() async {
    final image = await picker.getImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: FlatButton(
              onPressed: getImage,
              child: Icon(Icons.add_a_photo),
            ),
          ),
          SizedBox(
            height: 150,
          ),
          Row(
            children: [
              Expanded(
                child: FlatButton(
                    onPressed: () {},
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
                    onPressed: () {},
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
