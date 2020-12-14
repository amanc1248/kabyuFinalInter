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

  // Product(this.author, this.availablefor, this.categoryid, this.condition,
  //     this.description, this.image, this.price, this.rating, this.title);

  // Product.fromMap(Map<String, dynamic> data) {
  //   int intvar = data['rating'];
  //   double doublevar = intvar.toDouble();
  //   author = data['author'];
  //   availablefor = data['availablefor'];
  //   categoryid = data['categoryid'];
  //   image = data['image'];
  //   condition = data['condition'];
  //   description = data['description'];
  //   image = data['image'];
  //   price = data['price'];
  //   rating = doublevar;
  //   title = data['title'];
  // }

  // Map<String, dynamic> toMap() {
  //   return {
  //     'author': author,
  //     'availablefor': availablefor,
  //     'categoryid': categoryid,
  //     'image': image,
  //     'condition': condition,
  //     'description': description,
  //     'price': price,
  //     'rating': rating,
  //     'title': title
  //   };
  // }

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
  }
}
