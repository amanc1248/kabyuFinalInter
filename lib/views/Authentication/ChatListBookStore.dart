import 'package:flutter/material.dart';
import 'package:kabyu_feather_webs/Model/Chat%20Model/BookStoresClass.dart';
import 'package:kabyu_feather_webs/views/3.%20ChatPage/ChatListBookStore/Chat.dart';
import 'package:kabyu_feather_webs/views/Navigation/topnavigation.dart';

final List<BookStoresClass> bookStoresDetails = [
  BookStoresClass(
    imageName: "howinnovationworks.jpg",
    bookStoreName: "Ekta BookStore",
    newMessage: 3,
  ),
  BookStoresClass(
    imageName: "howinnovationworks.jpg",
    bookStoreName: "Ekta BookStore",
    newMessage: 3,
  ),
  BookStoresClass(
    imageName: "howinnovationworks.jpg",
    bookStoreName: "Ekta BookStore",
    newMessage: 3,
  ),
  BookStoresClass(
    imageName: "howinnovationworks.jpg",
    bookStoreName: "Ekta BookStore",
    newMessage: 3,
  )
];

class ChatListBookStore extends StatefulWidget {
  @override
  _ChatListBookStoreState createState() => _ChatListBookStoreState();
}

class _ChatListBookStoreState extends State<ChatListBookStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            TopNavigationBar(),
            Expanded(
                child: Container(
              decoration:
                  BoxDecoration(color: Color.fromRGBO(248, 248, 248, 1)),
              child: ListView.builder(
                itemCount: bookStoresDetails.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ChatPage()));
                  },
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 35, right: 35, bottom: 2, top: 25),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    AssetImage("assets/profileimage.jpg"),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    bookStoresDetails[index].bookStoreName,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    bookStoresDetails[index]
                                            .newMessage
                                            .toString() +
                                        " new messages",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromRGBO(176, 0, 32, 1)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Divider(
                            color: Color.fromRGBO(33, 33, 33, 0.08),
                            thickness: 1.0,
                            height: 10.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
