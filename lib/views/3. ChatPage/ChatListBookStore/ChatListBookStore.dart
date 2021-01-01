import 'package:flutter/material.dart';
import 'package:kabyu_feather_webs/Model/Chat%20Model/BookStoresClass.dart';
import 'package:kabyu_feather_webs/Provider/ChatProvider/ChatProvider.dart';
import 'package:kabyu_feather_webs/views/3.%20ChatPage/ChatListBookStore/BookStoreLists.dart';
import 'package:kabyu_feather_webs/views/Navigation/topnavigation.dart';
import 'package:provider/provider.dart';

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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ChatProvider chatProvider =
        Provider.of<ChatProvider>(context, listen: false);
    chatProvider.loadourUsersAndBuyers();
    print("This is our user and buyers👇");
    print(chatProvider.ourUsersAndBuyers[0].runtimeType);
    return Scaffold(
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
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: chatProvider.ourUsersAndBuyers.length == 0
                  ? Center(
                      child: Text(
                        "Not started any conversation yet!",
                      ),
                    )
                  : ListView.builder(
                      itemCount: chatProvider.ourUsersAndBuyers.length,
                      itemBuilder: (context, index) => BookStoreLists(
                        theIndex: index,
                      ),
                    ),
            ),
          ],
        ));
  }
}
