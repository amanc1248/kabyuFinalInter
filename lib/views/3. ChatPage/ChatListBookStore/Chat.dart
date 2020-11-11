import 'package:flutter/material.dart';
import 'package:kabyu_feather_webs/views/1.%20WishlistPage/Widgets/BookOverview.dart';
import 'package:kabyu_feather_webs/views/Navigation/topnavigation.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ChatPage extends StatefulWidget {
  static const String id = 'chatPage';

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xffF8F8F8),
        body: Container(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TopNavigationBar(),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.keyboard_arrow_left,
                            size: 30,
                          ),
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
                      margin: EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.05),
                            ),
                          ],
                          color: Color.fromRGBO(244, 244, 244, 1)),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 9),
                        child: Row(
                          children: [
                            Expanded(
                              child: Image(
                                image: AssetImage(
                                  "howinnovationworks.jpg",
                                ),
                                // height: 73,
                                width: 65,
                              ),
                            ),
                            SizedBox(
                              width: 13,
                            ),
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Npr 200/-",
                                    // theWishListsBooks[index].cost,
                                    style: TextStyle(
                                        color: Color.fromRGBO(255, 107, 107, 1),
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    "How Innovation Works",
                                    // theWishListsBooks[index].bookName,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      SmoothStarRating(
                                        rating: 3.0,
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
                                      SizedBox(
                                        width: 9.5,
                                      ),
                                      Text(
                                        "Science",
                                        // theWishListsBooks[index].category,
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(48, 0, 156, 1),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
