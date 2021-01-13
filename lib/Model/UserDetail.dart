import 'package:cloud_firestore/cloud_firestore.dart';

class UserDetail {
  String name;
  String image;
  UserDetail.fromSnapshot(DocumentSnapshot snapshot) {
    name = snapshot.data()['name'];
    image = snapshot.data()['image'];
  }
}
