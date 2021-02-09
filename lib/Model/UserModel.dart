import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String name;
  String image;
  String chatid;
  String buyerId;
  String sellerId;
  String bookId;
  int noOfNewMessages;
  UserModel.fromSnapshot(DocumentSnapshot snapshot, chatId, buyerId, sellerId,
      bookId, noOfNewMessages) {
    name = snapshot.data()['name'];
    image = snapshot.data()['image'];
    chatid = chatId;
    this.buyerId = buyerId;
    this.sellerId = sellerId;
    this.bookId = bookId;
    this.noOfNewMessages = noOfNewMessages;
  }
}
