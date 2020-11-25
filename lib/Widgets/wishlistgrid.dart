import 'package:flutter/material.dart';
import 'package:kabyu_feather_webs/Model/books_model.dart';

import 'package:kabyu_feather_webs/widgets/booksList.dart';


class WishListGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 234,
        child: ListView.builder(
            itemCount: getPopularBooks().length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctxt, index) {
              return BooksList(
                book: getWishlistBooks()[index],
              );
            }));
  }
}
