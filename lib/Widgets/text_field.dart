import 'package:flutter/material.dart';

class TextFieldProperty extends StatelessWidget {
  // AllTextFields textFields;
  final String title;
  final String hint;
  final double height;
  final Function validator;
  final TextEditingController textFieldController;
  final String initialValue;
  final TextInputType type;

  const TextFieldProperty(
      {Key key,
      this.title,
      this.hint,
      this.textFieldController,
      this.height,
      this.initialValue,
      this.type,
      this.validator})
      : super(key: key);
  // TextFieldProperty({this.textFields});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      //height: 100,
      child: TextFormField(
        initialValue: initialValue,
        keyboardType: type,
        
        //style: TextStyle(textBaseline: TextBaseline.alphabetic, height: height),
        controller: textFieldController,
        
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
          labelText: title,
          hintText: hint,
        ),
        validator: validator,
      ),
    );
  }
}
