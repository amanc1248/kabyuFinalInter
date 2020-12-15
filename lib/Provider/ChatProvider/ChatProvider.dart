import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatProvider extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  final firestoreSave = FirebaseFirestore.instance;

  storeDataToChat() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String userId = pref.getString("userId");
    await firestoreSave.collection('chat').doc(userId).set({
      'buyer_id': userId,
      'book_id': bookDocId,
      'seller_id': sellerId,
      // 'message': ,
    }).catchError((onError) {
      print(
          "you have a erroryou have a erroryou have a erroryou have a erroryou have a erroryou have a erroryou have a erroryou have a error");
    });
  }

  //1) Storing book document id
  String _bookDocId;
  String get bookDocId => _bookDocId;
  set bookDocId(String val) {
    _bookDocId = val;
    notifyListeners();
  }

  //2) Storing seller id
  String _sellerId;
  String get sellerId => _sellerId;
  set sellerId(String val) {
    _sellerId = val;
    notifyListeners();
  }
}
