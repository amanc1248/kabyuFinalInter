import 'package:flutter/material.dart';


class TextFieldProperty extends StatelessWidget {
  // AllTextFields textFields;
  final String title;
  final String hint;

  const TextFieldProperty({Key key, this.title, this.hint}) : super(key: key);
  // TextFieldProperty({this.textFields});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10),
      height: 70,
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.teal,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.orange,
              width: 2,
            ),
          ),
          labelText: title,
          hintText: hint,
        ),
      ),
    );
  }
}
