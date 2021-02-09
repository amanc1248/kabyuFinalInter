import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kabyu_feather_webs/Provider/ChatProvider/ChatProvider.dart';
import 'package:kabyu_feather_webs/views/AppBar/AppBar.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatPage extends StatefulWidget {
  static const String id = 'chatPage';
  final int chatIndex;
  ChatPage({this.chatIndex});
  @override
  _ChatPageState createState() => _ChatPageState();
}

ChatProvider chatProvider;

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _message = TextEditingController();
  void initState() {
    Provider.of<ChatProvider>(context, listen: false).loadourUsersAndBuyers();
    getChat();
    super.initState();
  }

  getChat() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String userId = pref.getString("userId");
    theUserId = userId;
    return userId;
  }

  // ScrollController _scrollController = new ScrollController();
  String theUserId;
  final _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 0),
      () => _controller.jumpTo(_controller.position.maxScrollExtent + 60),
    );
    chatProvider = Provider.of<ChatProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: OurAppBar.ourAppBar(context),
        body: Column(
          children: <Widget>[
            chatProvider.theIndexValue == -1 ? SizedBox() : buildUserHeader(),
            // List of messages
            chatProvider.theIndexValue == -1
                ? Expanded(
                    child: Center(
                    child: Text(
                      "No conversation yet!",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ))
                : buildListMessage(),

            // Input content
            buildInput(),
          ],
        ),
      ),
    );
  }

  Widget buildInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
      child: Container(
        width: double.infinity,
        height: 51.0,
        decoration: BoxDecoration(
            border: Border.all(color: Color.fromRGBO(0, 0, 0, 0.38), width: 1),
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Row(
          children: <Widget>[
            // Edit text
            Flexible(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 8, bottom: 8),
                  child: TextField(
                    controller: _message,
                    style: TextStyle(color: Colors.black, fontSize: 15.0),
                    // controller: textEditingController,
                    decoration: InputDecoration.collapsed(
                      hintText: 'Type your message...',
                      hintStyle: TextStyle(color: Colors.black),
                    ),
                    // focusNode: focusNode,
                  ),
                ),
              ),
            ),

            // Button send message
            GestureDetector(
              onTap: () async {
                if (_message.text != '') {
                  chatProvider.storeDataToChat();
                  chatProvider.chatMessage = _message.text;
                  _message.clear();
                }
              },
              child: Material(
                child: Container(
                    height: 51,
                    width: 51,
                    child: Center(
                      child: Text(
                        "Send",
                        style: TextStyle(
                            color: Color.fromRGBO(35, 3, 106, 1),
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildListMessage() {
    chatProvider.chatId =
        chatProvider.ourUsersAndBuyers[chatProvider.theIndexValue].chatid;
    chatProvider.buyerId =
        chatProvider.ourUsersAndBuyers[chatProvider.theIndexValue].buyerId;
    chatProvider.sellerId =
        chatProvider.ourUsersAndBuyers[chatProvider.theIndexValue].sellerId;

    return Flexible(
      child: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('chat')
            .doc(chatProvider.chatId)
            .snapshots(),
        builder: (context, snapShot) {
          if (!snapShot.hasData) {
            return Expanded(
              child: Center(child: Text("Start your conversation here")),
            );
          } else {
            // print("This is the chat Id:");
            // print(chatProvider.ourUsersAndBuyers[widget.chatIndex].chatid);
            // print("this isthe doc");
            // print(snapShot.data.data());
            final messages = snapShot.data['messages'].toList();

            return ListView.builder(
                controller: _controller,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  print("Messsages length===>" + messages.length.toString());
                  final messageText = messages[index]['message'];
                  final type = messages[index]['type'];
                  String timeStamp;
                  if (index == 0) {
                    timeStamp = messages[index]['timeStamp'];
                  } else {
                    if (messages[index - 1]['timeStamp'] ==
                        messages[index]['timeStamp']) {
                      timeStamp = '';
                    } else {
                      timeStamp = messages[index]['timeStamp'];
                    }
                  }
                  return MessageBubble(
                    text: messageText,
                    isMe: theUserId == type,
                    timeStampFinal: timeStamp,
                  );
                });
          }
        },
      ),
    );
  }

  Widget buildUserHeader() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 35, right: 35, bottom: 2, top: 25),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(chatProvider
                      .ourUsersAndBuyers[chatProvider.theIndexValue].image),
                ),
                SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      chatProvider
                          .ourUsersAndBuyers[chatProvider.theIndexValue].name,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
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
    );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble({this.text, this.isMe, this.timeStampFinal});

  final String text;
  final bool isMe;
  final timeStampFinal;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          // timeStamp==''?SizedBox():Text(timeStamp)
          timeStampFinal == ''
              ? SizedBox(
                  width: 3,
                )
              : Row(
                  children: <Widget>[
                    Expanded(child: Divider()),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 7),
                      child: Text(timeStampFinal),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
          // Text(text),
          Container(
            margin:
                isMe ? EdgeInsets.only(left: 100) : EdgeInsets.only(right: 100),
            decoration: BoxDecoration(
              color: isMe
                  ? Color.fromRGBO(35, 3, 106, 1)
                  : Color.fromRGBO(239, 239, 239, 1),
              borderRadius: isMe
                  ? BorderRadius.all(Radius.circular(30))
                  : BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                text,
                style: TextStyle(
                  color: isMe ? Colors.white : Colors.black,
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
