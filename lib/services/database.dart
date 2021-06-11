import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kabyu_feather_webs/Model/UserDetail.dart';
import 'package:kabyu_feather_webs/Model/UserModel.dart';
import 'package:kabyu_feather_webs/Model/category_model.dart';
import 'package:kabyu_feather_webs/Model/product.dart';
import 'package:kabyu_feather_webs/views/Authentication/Sign%20Up/Authentication/auth.dart';

import 'package:shared_preferences/shared_preferences.dart';

// getChat() async {
//   SharedPreferences pref = await SharedPreferences.getInstance();
//   String userId = pref.getString("userId");
//   return userId;
// }

getCategory() async {
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('category').get();

  List<CategoryModel> _category = [];

  for (DocumentSnapshot item in snapshot.docs) {
    CategoryModel category = CategoryModel.fromSnapshot(item);
    _category.add(category);
  }
  return _category;
}

//explorepage
getCategoryList(String categoryname) async {
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('book')
      .where('category', arrayContainsAny: [categoryname]).get();
  // print(snapshot.docs.first.data());
  print('===========================This is the getCategorylist');
  List<Product> _productList = [];
  for (DocumentSnapshot item in snapshot.docs) {
    Product product = Product.fromSnapshot(item);
    _productList.add(product);
  }
  return _productList;
}

getProduct() async {
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('book').get();

  List<Product> _productList = [];

  // snapshot.docs.forEach((document) {
  //   Product product = Product.fromMap(document.data());
  //   _productList.add(product);
  // });
  for (DocumentSnapshot item in snapshot.docs) {
    Product product = Product.fromSnapshot(item);
    _productList.add(product);
  }
  return _productList;
}

getUserDetails() async {
  // SharedPreferences pref = await SharedPreferences.getInstance();
  String userId = FirebaseAuth.instance.currentUser.uid;
  print("🧡🧡🧡⏭");
  print(userId);
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('users')
      .where('user_id', isEqualTo: userId)
      .get();
  List<UserDetail> _userDetail = [];
  for (DocumentSnapshot item in snapshot.docs) {
    UserDetail userDetail = UserDetail.fromSnapshot(item);
    _userDetail.add(userDetail);
  }
  return _userDetail;
}

getWishlist() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  String userId = pref.getString("userId");
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('wishlist')
      .where('user_id', isEqualTo: userId)
      .get();

  List<Product> _wishList = [];

  for (DocumentSnapshot item in snapshot.docs) {
    String bookid = item.data()['book_Id'];
    if (bookid != null || bookid != "") {
      DocumentSnapshot snapshots =
          await FirebaseFirestore.instance.collection('book').doc(bookid).get();

      Product product = Product.fromSnapshot(snapshots);
      _wishList.add(product);
    }
  }

  // print(_wishList.length);
  return _wishList;
}

getMyBooksList() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  String userId = pref.getString("userId");

  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('book')
      .where('seller_id', isEqualTo: userId)
      .get();
  // print(snapshot.docs);
  List<Product> _myBooksList = [];
  for (DocumentSnapshot item in snapshot.docs) {
    Product product = Product.fromSnapshot(item);
    _myBooksList.add(product);
  }
  return _myBooksList;
}

getourUsersAndBuyers() async {
  List<UserModel> _buyersAndSellers = [];

  SharedPreferences pref = await SharedPreferences.getInstance();
  String userId = pref.getString("userId");
  print(userId);
  //FOR LISTING SELLERS👇
  QuerySnapshot buyersSnapshot = await FirebaseFirestore.instance
      .collection('chat')
      .where('buyer_id', isEqualTo: userId)
      .get();

  if (buyersSnapshot.docs != null) {
    for (DocumentSnapshot item in buyersSnapshot.docs) {
      String sellerId = item.data()['seller_id'];
      print("Our 1st sellerId:😁😁😁");
      print(sellerId);
      if (sellerId != null || sellerId != "") {
        String chatId = item.id;
        String buyerId = item.data()['buyer_id'];
        String bookId = item.data()['book_id'];
        print("Our 1st buyerId:😁😁😁");
        print(buyerId);
        // print("THis is the chatId 👇");
        print(chatId);

// Calculation no of new messages
        // Calculation no of new messages
        List similarIndex = [];
        print(item.data()['messages'].toList());
        var messages = await item.data()['messages'].toList();
        print("&&&&&& this is the messages");
        print("Type from DB====>" + messages[0]['type'].toString());
        print("UserId==>" + userId.toString());
        print(messages.length);

        int newMessages;
        for (int i = 0; i < messages.length; i++) {
          print("Inside for loop type " + messages[i]['type'].toString());
          if (messages[i]['type'] == userId) {
            similarIndex.add(i);
            print("I am inside here bro");
          }
        }

        print("🥻🥻🥻");
        print(similarIndex);
        if (similarIndex != null) {
          newMessages = (item.data()['messages'].length - 1) -
              (similarIndex[similarIndex.length - 1]);
        } else {
          newMessages = 0;
        }

        DocumentSnapshot snapshots = await FirebaseFirestore.instance
            .collection('users')
            .doc(sellerId)
            .get();

        // print("Buyer Snapshot");
        if (snapshots.data() != null) {
          UserModel user = UserModel.fromSnapshot(
              snapshots, chatId, buyerId, sellerId, bookId, newMessages);
          print("our if statement buyerId⭐");
          print(buyerId);
          print("our if statement sellerId⭐");
          print(sellerId);
          _buyersAndSellers.add(user);
        }
      }
    }
  }
  //FOR LISTING BUYERS👇
  QuerySnapshot sellersSnapshot = await FirebaseFirestore.instance
      .collection('chat')
      .where('seller_id', isEqualTo: userId)
      .get();

  if (sellersSnapshot.docs != null) {
    for (DocumentSnapshot item in sellersSnapshot.docs) {
      String buyerId = item.data()['buyer_id'];
      if (buyerId != null || buyerId != "") {
        String sellerId = item.data()['seller_id'];
        String bookId = item.data()['book_id'];

        // Calculation no of new messages
        List similarIndex = [];
        print(item.data()['messages'].toList());
        var messages = await item.data()['messages'].toList();
        print("&&&&&& this is the messages");
        print("Type from DB====>" + messages[0]['type'].toString());
        print("UserId==>" + userId.toString());
        print(messages.length);

        int newMessages;
        for (int i = 0; i < messages.length; i++) {
          print("Inside for loop type " + messages[i]['type'].toString());
          if (messages[i]['type'] == userId) {
            similarIndex.add(i);
            print("I am inside here bro");
          }
        }

        print("🥻🥻🥻");
        print(similarIndex);
        if (similarIndex != null) {
          newMessages = (item.data()['messages'].length - 1) -
              (similarIndex[similarIndex.length - 1]);
        } else {
          newMessages = 0;
        }

        String chatId = item.id;

        DocumentSnapshot snapshots = await FirebaseFirestore.instance
            .collection('users')
            .doc(buyerId)
            .get();
        if (snapshots.data() != null) {
          UserModel user = UserModel.fromSnapshot(
              snapshots, chatId, buyerId, sellerId, bookId, newMessages);
          _buyersAndSellers.add(user);
        }
      }
    }
  }
  return _buyersAndSellers;
}

CollectionReference wishlist =
    FirebaseFirestore.instance.collection('wishlist');

Future<void> addWishlist(bookId) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  String userId = pref.getString("userId");
  return await wishlist
      .doc()
      .set({
        'book_Id': bookId,
        'timeStamp': DateTime.now(),
        'user_id': userId,
      })
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

//Delete user from database and firebase
deleteTheUser() async {
  User user = FirebaseAuth.instance.currentUser;
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.clear();
  print("Clearing Shared Preference");
  print(user);
  user.delete();
}

// For uploading image👇
Future uploadImageToFirebase(File image) async {
  if (image == null) {
    print("Image will be not shown in your profile");
  } else {
    String url = "";
    String fileName = basename(image.path);
    Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('uploads/$fileName');
    UploadTask uploadTask = firebaseStorageRef.putFile(image);
    TaskSnapshot taskSnapshot = await uploadTask;
    await taskSnapshot.ref.getDownloadURL().then((value) {
      url = value;
    });
    return url;
  }
}

// for storing products👇
setProduct(
    {String title,
    String author,
    String description,
    String radio,
    String check1,
    String check2,
    String price,
    List<Category> category,
    File imageName,
    String seller}) async {
  String imageUrl = await uploadImageToFirebase(imageName);

  FirebaseFirestore.instance.collection('book').add({
    "title": title,
    "author": author,
    "description": description,
    "condition": radio,
    "availablefor": check1 + " , " + check2,
    "price": price,
    "image": imageUrl,
    "categoryid": category,
    "seller_id": seller,
  });
}

FirebaseAuth auth = FirebaseAuth.instance;
final firestoreInstance = FirebaseFirestore.instance;
updateTheProfile(String name, String address, String contact, String email) {
  final User user = auth.currentUser;
  final uid = user.uid;
  firestoreInstance.collection("users").doc(uid).update({
    "name": name,
    "address": address,
    "phone_number": contact,
    "email": email
  }).then((_) => print("successfully edited profile"));
}
