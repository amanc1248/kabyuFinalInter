import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
        children: [
          Center(
            child: FlatButton(
              onPressed: getImage,
              child: Icon(Icons.add_a_photo),
            ),
          ),
          // Row(
          //   children: [
          //     Expanded(
          //       child: FlatButton(
          //           onPressed: () {},
          //           child: Container(
          //               child: Text(
          //             "SKIP",
          //             style: TextStyle(color: Color.fromRGBO(98, 0, 238, 1)),
          //           ))),
          //     ),
          //     Expanded(
          //       child: FlatButton(
          //           onPressed: () {},
          //           child: Container(
          //             decoration:
          //                 BoxDecoration(color: Color.fromRGBO(98, 0, 238, 1)),
          //             child: Text("DONE"),
          //           )),
          //     )
          //   ],
          // )
        ],
      ),
    );
  }
}
