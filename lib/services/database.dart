// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:kabyu_feather_webs/Model/category_model.dart';

// class Database {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Stream<List<CategoryModel>> get category {
//     return _firestore.collection("category").snapshots().map((event) => event
//         .docs
//         .map((DocumentSnapshot documentSnapshot) =>
//             CategoryModel(name: documentSnapshot.data['name']))
//         .toList());
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kabyu_feather_webs/Model/category_model.dart';
import 'package:kabyu_feather_webs/Model/product.dart';

import 'package:shared_preferences/shared_preferences.dart';

getCategory() async {
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('category').get();

  List<CategoryModel> _category = [];

  // snapshot.docs.forEach((document) {
  //   Product product = Product.fromMap(document.data());
  //   _productList.add(product);
  // });
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
    DocumentSnapshot snapshots =
        await FirebaseFirestore.instance.collection('book').doc(bookid).get();

    Product product = Product.fromSnapshot(snapshots);
    _wishList.add(product);
  }

  print(_wishList.length);
  return _wishList;
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
