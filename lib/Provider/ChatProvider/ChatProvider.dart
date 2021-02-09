import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kabyu_feather_webs/Model/UserModel.dart';
import 'package:kabyu_feather_webs/services/database.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class ChatProvider extends ChangeNotifier {
  final BuildContext context;
  final int currentProduct;
  ChatProvider({this.context, this.currentProduct});
  FirebaseAuth auth = FirebaseAuth.instance;
  final firestoreSave = FirebaseFirestore.instance;
  getUserId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String userid = pref.getString("userId");
    userId = userid;
  }

//Checking Buyer👇
  checkBuyer() {
    print("Userid===>" + userId);
    print("Buyerid===>" + buyerId);
    // if (buyerId == '') {
    //   return userId;
    // }
    if (buyerId == userId) {
      return userId;
    }
    if (buyerId != userId) {
      return buyerId;
    }
  }

//Checking Seller👇
  checkSeller() {
    // if (sellerId == '') {
    //   return sellerIdFromBook;
    // }
    if (sellerId == userId) {
      return userId;
    }
    if (sellerId != userId) {
      return sellerId;
    }
  }

//Checking chatId👇
  checkChatId() {
    // chatId = "Tt9Pl5u7iMNJzpOrTXv1ZByouF12";
    if (chatId == '') {
      String theCombinedChatId = sellerId + userId;
      return theCombinedChatId;
    } else {
      return chatId;
    }
  }
//checkTimeStamp

  storeDataToChat() async {
    await getUserId();
    int valueIs;
    var key = new DateTime.now().toIso8601String();
    if (theIndexValue == -1) {
      print("THEINDEXVALUE===>" + theIndexValue.toString());
      await firestoreSave.collection('chat').doc(checkChatId()).set({
        'buyer_id': checkBuyer(), //aman() //ranjit(seller)
        'seller_id': checkSeller(),
        "messages": FieldValue.arrayUnion(
          [
            {
              'key': key,
              "message": chatMessage,
              "timeStamp": DateFormat.yMMMd().format(new DateTime.now()),
              "type": userId
            },
          ],
        )
      }, SetOptions(merge: true)).catchError((onError) {
        print(
            "you have a erroryou have a erroryou have a erroryou have a erroryou have a erroryou have a erroryou have a erroryou have a error");
      });

      await loadourUsersAndBuyers();

      print("Our chaterrs lenght===>" + ourUsersAndBuyers.length.toString());
      if (ourUsersAndBuyers.length != 0) {
        for (var i = 0; i < ourUsersAndBuyers.length; i++) {
          if (ourUsersAndBuyers[i].buyerId == userId &&
              ourUsersAndBuyers[i].sellerId == sellerId) {
            valueIs = i;
            print("1st valueIs value===>" + valueIs.toString());
            break;
          } else {
            valueIs = -1;
            print("2nd valueIs value===>" + valueIs.toString());
          }
        }
      } else {
        valueIs = -1;
        print("3rd valueIs value===>" + valueIs.toString());
      }
      theIndexValue = valueIs;
      print("THE INDEX VALUE IS::::=>>>" + theIndexValue.toString());
    } else {
      print("This is chat Id===>" + chatId);
      print("SellerId==>" + sellerId);
      print(checkSeller());
      print("THe book id is==>" + bookId.toString());
      var key = new DateTime.now().toIso8601String();
      await firestoreSave.collection('chat').doc(checkChatId()).set({
        'buyer_id': checkBuyer(), //aman() //ranjit(seller)
        'seller_id': checkSeller(),
        "messages": FieldValue.arrayUnion(
          [
            {
              "key": key,
              "message": chatMessage,
              "timeStamp": DateFormat.yMMMd().format(new DateTime.now()),
              "type": userId
            },
          ],
        )
      }, SetOptions(merge: true)).catchError((onError) {
        print(
            "you have a erroryou have a erroryou have a erroryou have a erroryou have a erroryou have a erroryou have a erroryou have a error");
      });

      print("Our index value.👇");

      print(valueIs);
      print("🛒🛒🛒🛒");
    }

    //concatinating user_id+book_id

    // print();
  }

  List<UserModel> _ourUsersAndBuyers = [];
  UnmodifiableListView<UserModel> get ourUsersAndBuyers =>
      UnmodifiableListView(_ourUsersAndBuyers);
  set ourUsersAndBuyers(List<UserModel> ourUsersAndBuyers) {
    _ourUsersAndBuyers = ourUsersAndBuyers;
    notifyListeners();
  }

  bool _loadUserChat = false;
  bool get loadUserChat => _loadUserChat;
  set loadUserChat(bool val) {
    _loadUserChat = val;
    notifyListeners();
  }

  loadourUsersAndBuyers() async {
    print("I am insise laodOUrUsersAndBuyers((((((");
    List<UserModel> ourUsersAndBuyers = await getourUsersAndBuyers();
    _ourUsersAndBuyers = ourUsersAndBuyers;
    _loadUserChat = true;
    notifyListeners();
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
  String _chatId = '';
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

  //5) Seller Id from book
  String _sellerIdFromBook = "";
  String get sellerIdFromBook => _sellerIdFromBook;
  set sellerIdFromBook(String val) {
    _sellerIdFromBook = val;
    notifyListeners();
  }

  //5) indexValue
  int _theIndexValue;
  int get theIndexValue => _theIndexValue;
  set theIndexValue(int val) {
    _theIndexValue = val;
    notifyListeners();
  }

  //6) timeStamp
  String _timeStamp;
  String get timeStamp => _timeStamp;
  set timeStamp(String val) {
    _timeStamp = val;
    notifyListeners();
  }

  String _previoustimeStamp;
  String get previoustimeStamp => _previoustimeStamp;
  set previoustimeStamp(String val) {
    _previoustimeStamp = val;
    notifyListeners();
  }

  String _bookId = '';
  String get bookId => _bookId;
  set bookId(String val) {
    _bookId = val;
    notifyListeners();
  }
}
