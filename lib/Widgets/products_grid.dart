import 'package:flutter/material.dart';
import 'package:kabyu_feather_webs/Model/books_model.dart';
import 'package:kabyu_feather_webs/widgets/booksList.dart';

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 234,
        child: ListView.builder(
            itemCount: getPopularBooks().length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctxt, index) {
              return BooksList(book: getPopularBooks()[index]);
            }));
  }
}
