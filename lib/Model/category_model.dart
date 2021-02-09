import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_tagging/flutter_tagging.dart';

class CategoryModel extends Taggable {
  String categoryId;
  String name;
  CategoryModel({this.categoryId, this.name});

  CategoryModel.fromSnapshot(DocumentSnapshot snapshot) {
    categoryId = snapshot.id;
    name = snapshot.data()['name'];
  }
  @override
  List<Object> get props => [categoryId, name];
}
