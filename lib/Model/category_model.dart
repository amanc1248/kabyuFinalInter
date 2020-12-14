import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String categoryId;
  String name;

  CategoryModel();
  CategoryModel.fromSnapshot(DocumentSnapshot snapshot) {
    categoryId = snapshot.id;
    name = snapshot.data()['name'];
  }
}
