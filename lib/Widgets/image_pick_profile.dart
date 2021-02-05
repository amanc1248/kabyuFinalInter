import 'dart:io';
import 'package:kabyu_feather_webs/Provider/ProductsProvider/productsProvider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ImagePickProfile extends StatefulWidget {
  @override
  _ImagePickProfileState createState() => _ImagePickProfileState();
}

AddProductsProvider addProductProvider;

class _ImagePickProfileState extends State<ImagePickProfile> {
  File _image;
  final picker = ImagePicker();
  String imageFileUpload;

  Future pickImageFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    addProductProvider.image = null;

    setState(() {
      if (pickedFile != null) {
        addProductProvider.image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future pickImageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    addProductProvider.image = null;
    setState(() {
      if (pickedFile != null) {
        addProductProvider.image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
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
    addProductProvider = Provider.of<AddProductsProvider>(context);
    return GestureDetector(
      onTap: () {
        _showPicker(context);
      },
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
        child: addProductProvider.image != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(75),
                child: Image.file(
                  addProductProvider.image,
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
