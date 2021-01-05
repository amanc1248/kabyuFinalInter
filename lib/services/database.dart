import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kabyu_feather_webs/Model/UserModel.dart';
import 'package:kabyu_feather_webs/Model/category_model.dart';
import 'package:kabyu_feather_webs/Model/product.dart';

import 'package:shared_preferences/shared_preferences.dart';

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
  print("💕💕💕💕💕💕" + userId);
  

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
        print("Our 1st buyerId:😁😁😁");
        print(buyerId);
        // print("THis is the chatId 👇");
        print(chatId);
        DocumentSnapshot snapshots = await FirebaseFirestore.instance
            .collection('users')
            .doc(sellerId)
            .get();

        // print("Buyer Snapshot");
        if (snapshots.data() != null) {
          UserModel user =
              UserModel.fromSnapshot(snapshots, chatId, buyerId, sellerId);
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
        print(sellerId);

        String chatId = item.id;

        DocumentSnapshot snapshots = await FirebaseFirestore.instance
            .collection('users')
            .doc(buyerId)
            .get();
        if (snapshots.data() != null) {
          UserModel user =
              UserModel.fromSnapshot(snapshots, chatId, buyerId, sellerId);
          _buyersAndSellers.add(user);
        }
      }
    }
  }
  // print("_buyersAndSellers");
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
