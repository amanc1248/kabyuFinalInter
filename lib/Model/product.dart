import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String book_Id;
  String author;
  String availablefor;
  String categoryid;
  String condition;
  String description;
  String image;
  String price;
  double rating;
  String title;
  String seller_Id;

  Product.fromSnapshot(DocumentSnapshot snapshot) {
    book_Id = snapshot.id;
    int intvar = snapshot.data()['rating'];
    double doublevar = intvar.toDouble();
    author = snapshot.data()['author'];
    availablefor = snapshot.data()['availablefor'];
    categoryid = snapshot.data()['categoryid'];
    image = snapshot.data()['image'];
    condition = snapshot.data()['condition'];
    description = snapshot.data()['description'];
    price = snapshot.data()['price'];
    rating = doublevar;
    title = snapshot.data()['title'];
    seller_Id = snapshot.data()['seller_id'];
  }
}
