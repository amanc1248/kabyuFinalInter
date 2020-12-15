import 'package:cloud_firestore/cloud_firestore.dart';

class Wishlists {
  String book_Id;
  String timeStamp;
  String user_id;
  Wishlists(this.book_Id, this.timeStamp, this.user_id);

  Wishlists.fromSnapshot(DocumentSnapshot snapshot) {
    book_Id = snapshot.id;
    user_id = snapshot.data()['user_id'];
  }
}
