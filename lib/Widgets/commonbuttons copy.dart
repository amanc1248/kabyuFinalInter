
import 'package:flutter/material.dart';

class CommonButtons extends StatelessWidget {
  const CommonButtons({
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
              onPressed: () {},
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
                onPressed: () {},
                color: Color(0xFF6200EE),
                child: Text(
                  "SAVE",
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