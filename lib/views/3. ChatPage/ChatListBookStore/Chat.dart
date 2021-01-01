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

  String theUserId;
  @override
  Widget build(BuildContext context) {
    chatProvider = Provider.of<ChatProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: OurAppBar.ourAppBar(context),
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                buildUserHeader(),
                // List of messages
                buildListMessage(),

                // Input content
                buildInput(),
              ],
            ),

            // Loading
            // buildLoading()
          ],
        ),
      ),
    );
  }

  Widget buildInput() {
    return Container(
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

          // Button send message
          GestureDetector(
            onTap: () {
              chatProvider.storeDataToChat();
              chatProvider.chatMessage = _message.text;
            },
            child: Material(
              child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "Send",
                    style: TextStyle(
                        color: Color.fromRGBO(35, 3, 106, 1),
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildListMessage() {
    // Stream documentStream = ;

    chatProvider.chatId =
        chatProvider.ourUsersAndBuyers[widget.chatIndex].chatid;

    chatProvider.buyerId =
        chatProvider.ourUsersAndBuyers[widget.chatIndex].buyerId;
    chatProvider.sellerId =
        chatProvider.ourUsersAndBuyers[widget.chatIndex].sellerId;
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
            print("This is the chat Id:");
            print(chatProvider.ourUsersAndBuyers[widget.chatIndex].chatid);
            print("this isthe doc");
            print(snapShot.data.data());
            final messages = snapShot.data['messages'].reversed;

            List<MessageBubble> messageBubbles = [];
            for (var message in messages) {
              final messageText = message['message'];
              final type = message['type'];

              final messageBubble = MessageBubble(
                text: messageText,
                isMe: theUserId == type,
              );

              messageBubbles.add(messageBubble);
            }
            return ListView(
              reverse: true,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              children: messageBubbles,
            );
          }
        },
      ),
    );
  }

  Widget buildUserHeader() {
    return Container(
      decoration: BoxDecoration(),
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 32, right: 32, bottom: 16, top: 25),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage("assets/profileimage.jpg"),
                ),
                SizedBox(
                  width: 22,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ekta Bookstore",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Body 2",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble({this.text, this.isMe});

  final String text;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Container(
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
