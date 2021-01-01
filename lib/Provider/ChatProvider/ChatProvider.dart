import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:kabyu_feather_webs/Model/UserModel.dart';
import 'package:kabyu_feather_webs/Provider/ProductsProvider/productsProvider.dart';
import 'package:kabyu_feather_webs/services/database.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatProvider extends ChangeNotifier {
  final BuildContext context;
  final int currentProduct;
  ChatProvider({this.context, this.currentProduct});
  FirebaseAuth auth = FirebaseAuth.instance;
  final firestoreSave = FirebaseFirestore.instance;

  storeDataToChat() async {
    ProductProvider productProvider =
        Provider.of<ProductProvider>(context, listen: false);

    SharedPreferences pref = await SharedPreferences.getInstance();
    String userId = pref.getString("userId");
    print("This is the user id: " + userId);
    //concatinating user_id+book_id
    await firestoreSave.collection('chat').doc().set({
      'buyer_id': userId, //aman() //ranjit(seller)
      'book_id':
          productProvider.productList[productProvider.bookIndexForChat].book_Id,
      'seller_id': productProvider
          .productList[productProvider.bookIndexForChat].seller_Id,
      "messages": FieldValue.arrayUnion(
        [
          {
            "message": chatMessage,
            "timeStamp": DateTime.now().millisecondsSinceEpoch,
            "type": userId
          },
        ],
      )
    }, SetOptions(merge: true)).catchError((onError) {
      print(
          "you have a erroryou have a erroryou have a erroryou have a erroryou have a erroryou have a erroryou have a erroryou have a error");
    });
    // print();
  }

  //run if there is already a conversation👇
  storeDataToChatFromSecondTime() async {
    ProductProvider productProvider =
        Provider.of<ProductProvider>(context, listen: false);

    SharedPreferences pref = await SharedPreferences.getInstance();
    String userId = pref.getString("userId");
    print("This is the user id: " + userId);
    //concatinating user_id+book_id
    await firestoreSave.collection('chat').doc(chatId).set({
      'buyer_id': buyerId == userId ? userId : buyerId,
      'book_id':
          productProvider.productList[productProvider.bookIndexForChat].book_Id,
      'seller_id': sellerId == userId ? userId : sellerId,
      "messages": FieldValue.arrayUnion(
        [
          {
            "message": chatMessage,
            "timeStamp": DateTime.now().millisecondsSinceEpoch,
            "type": userId
          },
        ],
      )
    }, SetOptions(merge: true)).catchError((onError) {
      print(
          "you have a erroryou have a erroryou have a erroryou have a erroryou have a erroryou have a erroryou have a erroryou have a error");
    });
  }

  List<UserModel> _ourUsersAndBuyers = [];
  UnmodifiableListView<UserModel> get ourUsersAndBuyers =>
      UnmodifiableListView(_ourUsersAndBuyers);
  set ourUsersAndBuyers(List<UserModel> ourUsersAndBuyers) {
    _ourUsersAndBuyers = ourUsersAndBuyers;
    notifyListeners();
  }

  loadourUsersAndBuyers() async {
    List<UserModel> ourUsersAndBuyers = await getourUsersAndBuyers();
    _ourUsersAndBuyers = ourUsersAndBuyers;
    notifyListeners();
    print('ourUsersAndBuyers');
    print(ourUsersAndBuyers);
    print('ourUsersAndBuyers Length');
    print(ourUsersAndBuyers.length);
  }

  //1) Storing book document id
  String _chatMessage;
  String get chatMessage => _chatMessage;
  set chatMessage(String val) {
    _chatMessage = val;
    notifyListeners();
  }

//2) user Id
  String _userId = '';
  String get userId => _userId;
  set userId(String val) {
    _userId = val;
    notifyListeners();
  }

  //2) Storing chat id
  String _chatId;
  String get chatId => _chatId;
  set chatId(String val) {
    _chatId = val;
    notifyListeners();
  }

  //4) Storing buyer id
  String _buyerId = "";
  String get buyerId => _buyerId;
  set buyerId(String val) {
    _buyerId = val;
    notifyListeners();
  }

  //4) Storing seller id
  String _sellerId = "";
  String get sellerId => _sellerId;
  set sellerId(String val) {
    _sellerId = val;
    notifyListeners();
  }

  
}
