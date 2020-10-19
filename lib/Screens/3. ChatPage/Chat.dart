import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ChatPage extends StatefulWidget {
  static const String id = 'chatPage';

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffF8F8F8),
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(color: Colors.white),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.bubble_chart),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 19),
                              child: Container(
                                height: 37,
                                decoration: BoxDecoration(
                                    color: Color(0xffEDEDED),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25))),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: TextField(
                                          onChanged: (value) {
                                            // password = value;
                                          },
                                          decoration: InputDecoration(
                                            hintText: "Search",
                                            hintStyle: TextStyle(
                                                fontSize: 18,
                                                color: Color(0xff939393)),
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
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Icon(
                              Icons.notifications,
                              color: Color(0xff30009C),
                              size: 30,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.keyboard_arrow_left,
                            size: 30,
                          ),
                          Text(
                            "Back to all books",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 16,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 35, right: 35, bottom: 25, top: 25),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 22,
                                backgroundImage:
                                    AssetImage("assets/profileimage.jpg"),
                              ),
                              SizedBox(
                                width: 22,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Ekta Bookstore",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Body 2",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Color.fromRGBO(33, 33, 33, 0.08),
                          thickness: 1.0,
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                  Container(
                      color: Color(0XFFF8F8F8),
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Npr 200 /-",
                              style: TextStyle(
                                  color: Color(0xFF01A299),
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "How innovation works",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 20.0),
                            ),
                            SizedBox(height: 5.0),
                            Row(
                              children: [
                                SmoothStarRating(
                                  rating: 1.0,
                                  isReadOnly: true,
                                  size: 15,
                                  filledIconData: Icons.star,
                                  halfFilledIconData: Icons.star_half,
                                  defaultIconData: Icons.star_border,
                                  starCount: 5,
                                  allowHalfRating: true,
                                  spacing: 2.0,
                                  color: Colors.yellow,
                                  borderColor: Colors.yellow,
                                  onRated: (value) {
                                    print("rating value -> $value");
                                  },
                                ),
                                SizedBox(width: 10.0),
                                Text(
                                  "Science",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF30009C)),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.0),
                            Divider(
                              color: Color.fromRGBO(33, 33, 33, 0.08),
                              thickness: 1.0,
                              height: 10.0,
                            ),
                          ]))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
