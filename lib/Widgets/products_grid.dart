import 'package:flutter/material.dart';
import 'package:kabyu_feather_webs/Model/product.dart';
import 'package:kabyu_feather_webs/Provider/ProductsProvider/productsProvider.dart';
import 'package:kabyu_feather_webs/Widgets/booksList.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatefulWidget {
  final int count;
  final List<Product> myList;
  const ProductGrid({Key key, this.count, this.myList}) : super(key: key);

  @override
  _ProductGridState createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    MyBooksProvider myBooksProvider = Provider.of<MyBooksProvider>(context);
    print("We have this many books " +
        productProvider.productList.length.toString());
    return productProvider.productList.length == 0
        ? Center(child: CircularProgressIndicator())
        : Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: Container(
                height: 225,
                child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  children: List.generate(widget.count, (index) {
                    return BooksList(
                      book: index,
                    );
                  }),
                )),
          );
  }
}
