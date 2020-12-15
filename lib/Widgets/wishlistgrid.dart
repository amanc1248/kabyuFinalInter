import 'package:flutter/material.dart';
import 'package:kabyu_feather_webs/Provider/ProductsProvider/productsProvider.dart';
import 'package:kabyu_feather_webs/Widgets/wishlistbooks.dart';

import 'package:provider/provider.dart';

class WishListGrid extends StatefulWidget {
  final int count;

  const WishListGrid({Key key, this.count}) : super(key: key);
  @override
  _WishListGridState createState() => _WishListGridState();
}

class _WishListGridState extends State<WishListGrid> {
  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);

    return wishlistProvider.wishlistproductList.length == 0
        ? Center(child: Text("No any products in your wishlist"))
        : Container(
            height: 225,
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              children: List.generate(widget.count, (index) {
                return WishlistBooksList(book: index);
              }),
            ));
    // child: ListView.builder(
    //   scrollDirection: Axis.horizontal,
    //   itemBuilder: (context, index) {
    //     return WishlistBooksList(
    //       book: index,
    //     );
    //   },
    //   itemCount: wishlistProvider.wishlistproductList.length,
    // ));
  }
}
