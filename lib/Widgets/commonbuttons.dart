import 'package:flutter/material.dart';

class CommonButtons extends StatelessWidget {
  final Function pressed;
  final String text;
  const CommonButtons({
    this.pressed,
    this.text,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ButtonTheme(
            minWidth: 30,
            child: FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("CANCEL",
                  style: TextStyle(
                    color: Color(0XFFB00020),
                  )),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            padding: EdgeInsets.only(left: 30),
            child: ButtonTheme(
              height: 46,
              child: RaisedButton(
                onPressed: pressed,
                color: Color(0xFF6200EE),
                child: Text(
                  text,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
