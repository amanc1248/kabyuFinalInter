import 'package:flutter/material.dart';
import 'package:kabyu_feather_webs/views/3.%20ChatPage/ChatListBookStore/Model/BookStoresClass.dart';
import 'package:kabyu_feather_webs/views/3.%20ChatPage/ChatListBookStore/Widgets/BookStoreLists.dart';
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
                  itemBuilder: (context, index) => BookStoreLists(
                        theIndex: index,
                      )),
            )),
          ],
        ),
      ),
    );
  }
}
