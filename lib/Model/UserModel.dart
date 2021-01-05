import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String name;
  String image;
  String chatid;
  String buyerId;
  String sellerId;
  UserModel.fromSnapshot(DocumentSnapshot snapshot, chatId, buyerId, sellerId) {
    print("=========" + buyerId);
    print("=========" + sellerId);
    name = snapshot.data()['name'];
    image = snapshot.data()['image'];
    chatid = chatId;
    this.buyerId = buyerId;
    this.sellerId = sellerId;
  }
}
