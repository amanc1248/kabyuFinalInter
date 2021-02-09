import 'package:flutter/material.dart';
import 'package:kabyu_feather_webs/Provider/ChatProvider/ChatProvider.dart';
import 'package:kabyu_feather_webs/views/3.%20ChatPage/ChatListBookStore/Chat.dart';
import 'package:provider/provider.dart';

class BookStoreLists extends StatelessWidget {
  final int theIndex;
  BookStoreLists({this.theIndex});
  theUserImage(userIndex) {
    if (chatProvider.ourUsersAndBuyers[userIndex].image == null) {
      return CircleAvatar(
          radius: 20,
          child: Text('${chatProvider.ourUsersAndBuyers[userIndex].name[0]}'
              .toUpperCase()));
    } else {
      return CircleAvatar(
        radius: 20,
        backgroundImage:
            NetworkImage(chatProvider.ourUsersAndBuyers[userIndex].image),
      );
    }
  }

  ChatProvider chatProvider;
  @override
  Widget build(BuildContext context) {
    chatProvider = Provider.of<ChatProvider>(context, listen: false);
    return GestureDetector(
      onTap: () {
        chatProvider.theIndexValue = theIndex;
        chatProvider.sellerId =
            chatProvider.ourUsersAndBuyers[theIndex].sellerId;
        chatProvider.buyerId = chatProvider.ourUsersAndBuyers[theIndex].buyerId;
        chatProvider.chatId = chatProvider.ourUsersAndBuyers[theIndex].chatid;
        chatProvider.bookId = chatProvider.ourUsersAndBuyers[theIndex].bookId;
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ChatPage(
                    chatIndex: theIndex,
                  )),
        );
      },
      child: Container(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 35, right: 0, bottom: 2, top: 25),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  theUserImage(theIndex),
                  SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        chatProvider.ourUsersAndBuyers[theIndex].name,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      chatProvider.ourUsersAndBuyers[theIndex]
                                  .noOfNewMessages !=
                              0
                          ? Text(
                              chatProvider.ourUsersAndBuyers[theIndex]
                                      .noOfNewMessages
                                      .toString() +
                                  " new messages",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(176, 0, 32, 1)),
                            )
                          : SizedBox()
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
    );
  }
}
