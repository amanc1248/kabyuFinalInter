// import 'package:flutter/material.dart';
// import 'package:kabyu_feather_webs/Model/books_model.dart';
// import 'package:kabyu_feather_webs/Model/wishlist_model.dart';

// class WishlistBooksList extends StatefulWidget {
//   Books book;
//   WishlistBooksList({this.book});

//   @override
//   _WishlistBooksListState createState() => _WishlistBooksListState();
// }

// class _WishlistBooksListState extends State<WishlistBooksList> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         width: MediaQuery.of(context).size.width / 2 - 10,
//         child: Card(
//           clipBehavior: Clip.antiAliasWithSaveLayer,
//           child: Column(
//             children: [
//               Container(
//                 height: 135,
//                 width: double.infinity,
//                 child: Image.network(
//                   widget.book.image,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               Container(
//                 padding: const EdgeInsets.only(
//                     left: 10.0, top: 10, right: 5, bottom: 0),
//                 child: Column(
//                   children: [
//                     Container(
//                       height: 40,
//                       child: Text(widget.book.title,
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           )),
//                     ),
//                     Container(
//                       height: 30,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             widget.book.price,
//                             style: TextStyle(
//                               color: Colors.black54,
//                               fontSize: 14,
//                             ),
//                           ),
//                           IconButton(
//                               icon:
//                                   Icon(Icons.more_vert, color: Colors.black54),
//                               onPressed: () {})
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }
// }
