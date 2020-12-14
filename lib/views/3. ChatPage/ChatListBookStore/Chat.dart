import 'package:flutter/material.dart';
import 'package:kabyu_feather_webs/views/Authentication/contants.dart';
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
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.chevron_left,
            ),
          ),
          title: TopNavigationBar(),
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 13, right: 13),
              child: Icon(
                Icons.notifications,
                color: Color(0xff30009C),
                size: 30,
              ),
            )
          ],
          elevation: 0.0,
          titleSpacing: 0.0,
          centerTitle: false,
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
          iconTheme: IconThemeData(
            color: Color.fromRGBO(0, 0, 0, 0.87),
          ),
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xffF8F8F8),
        body: Container(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 32, right: 32, bottom: 16, top: 25),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
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
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "Body 2",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Column(
                  children: [
                    Divider(
                      color: Color.fromRGBO(33, 33, 33, 0.08),
                      thickness: 1.0,
                      height: 20.0,
                    ),
                    // For the book
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.05),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 0)),
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
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14),
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 15),
                      child: Container(
                        height: 51,
                        width: 214,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(35, 3, 106, 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: Center(
                            child: Text(
                          "I would like to buy this",
                          style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontSize: 16),
                        )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Row(children: <Widget>[
                        Expanded(
                          child: Divider(
                            color: Color.fromRGBO(33, 33, 33, 0.08),
                            thickness: 1.0,
                            height: 20.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 7),
                          child: Text(
                            "OCT 02 , 2020",
                            style:
                                TextStyle(color: Color.fromRGBO(0, 0, 0, 0.38)),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Color.fromRGBO(33, 33, 33, 0.08),
                            thickness: 1.0,
                            height: 20.0,
                          ),
                        ),
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Container(
                        height: 126,
                        width: 265,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(239, 239, 239, 1),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(2),
                              bottomRight: Radius.circular(30),
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            )),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 22, vertical: 16),
                          child: Text(
                            "volutpat urna, maecenas fringilla condimentum risus adipiscing vehicula. Feugiat duis lacus consequa",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(0, 0, 0, 1)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Container(
                        height: 126,
                        width: 265,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(239, 239, 239, 1),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(2),
                              bottomRight: Radius.circular(30),
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            )),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 22, vertical: 16),
                          child: Text(
                            "volutpat urna, maecenas fringilla condimentum risus adipiscing vehicula. Feugiat duis lacus consequa",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(0, 0, 0, 1)),
                          ),
                        ),
                      ),
                    ),

                    // Expanded(
                    //   child: Container(
                    //     width: double.infinity,
                    //     child: TextFormField(
                    //       decoration: InputDecoration(
                    //           border: InputBorder.none,
                    //           suffixText: "Send",
                    //           suffixStyle: TextStyle(
                    //               color: Color.fromRGBO(35, 3, 106, 1),
                    //               fontSize: 16,
                    //               fontWeight: FontWeight.bold)),
                    //     ),
                    //   ),
                    // ),
                    // Expanded(
                    //   child: Container(
                    //     width: double.infinity,
                    //     height: 51,
                    //     padding: EdgeInsets.only(left: 15, right: 15),
                    //     decoration: BoxDecoration(
                    //       borderRadius:
                    //           BorderRadius.all(Radius.circular(4)),
                    //       color: Color.fromRGBO(248, 248, 248, 1),
                    //       border: Border.all(
                    //           color: Color.fromRGBO(0, 0, 0, 0.38)),
                    //     ),
                    // child: TextFormField(

                    //   decoration: InputDecoration(
                    //       border: InputBorder.none,
                    //       suffixText: "Send",
                    //       suffixStyle: TextStyle(
                    //           color:
                    //               Color.fromRGBO(35, 3, 106, 1),
                    //           fontSize: 16,
                    //           fontWeight: FontWeight.bold)),
                    // ),
                    //   ),
                    // )
                  ],
                ),
              ),
              Container(
                // decoration: kMessageContainerDecoration,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        // controller: messageTextController,
                        // onChanged: (value) {
                        //   messageText = value;
                        // },
                        // decoration: kMessageTextFieldDecoration,
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        // messageTextController.clear();
                        // _firestore.collection('messages').add({
                        //   'text': messageText,
                        //   'sender': loggedInUser.email,
                        // });
                      },
                      child: Text(
                        'Send',
                        // style: kSendButtonTextStyle,
                      ),
                    ),
                  ],
                ),
              ),

              // TextFormField(
              //   decoration: InputDecoration(
              //       border: InputBorder.none,
              //       suffixText: "Send",
              //       suffixStyle: TextStyle(
              //           color: Color.fromRGBO(35, 3, 106, 1),
              //           fontSize: 16,
              //           fontWeight: FontWeight.bold)),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
