import 'package:flutter/material.dart';
import 'package:kabyu_feather_webs/Provider/ChatProvider/ChatProvider.dart';
import 'package:kabyu_feather_webs/views/3.%20ChatPage/ChatListBookStore/Chat.dart';
import 'package:provider/provider.dart';

class BookStoreLists extends StatelessWidget {
  final int theIndex;
  BookStoreLists({this.theIndex});
  @override
  Widget build(BuildContext context) {
    ChatProvider chatProvider =
        Provider.of<ChatProvider>(context, listen: false);
    return GestureDetector(
      onTap: () {
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
              const EdgeInsets.only(left: 35, right: 35, bottom: 2, top: 25),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                        chatProvider.ourUsersAndBuyers[theIndex].image),
                  ),
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
                      Text(
                        "0" + " new messages",
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
    );
  }
}
