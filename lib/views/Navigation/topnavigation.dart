import 'package:flutter/material.dart';

class TopNavigationBar extends StatelessWidget {
  // final Widget leftIcon;
  // TopNavigationBar({this.leftIcon});
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            height: 37,
            decoration: BoxDecoration(
                color: Color(0xffEDEDED),
                borderRadius: BorderRadius.all(Radius.circular(25))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: TextField(
                      onChanged: (value) {
                        // password = value;
                      },
                      decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle:
                            TextStyle(fontSize: 18, color: Color(0xff939393)),
                        // fillColor: Colors.white,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Icon(
                    Icons.search,
                    size: 30,
                    color: Color(0xff30009C),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
