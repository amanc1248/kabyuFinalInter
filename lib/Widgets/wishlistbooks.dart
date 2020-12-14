
import 'package:flutter/material.dart';
import 'package:kabyu_feather_webs/Provider/ProductsProvider/productsProvider.dart';
import 'package:kabyu_feather_webs/views/Product%20Individual/product_individual.dart';
import 'package:provider/provider.dart';

class WishlistBooksList extends StatefulWidget {
  final int book;

  const WishlistBooksList({Key key, this.book}) : super(key: key);

  @override
  _WishlistBooksListState createState() => _WishlistBooksListState();
}

class _WishlistBooksListState extends State<WishlistBooksList> {
  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    ProductProvider productProvider = Provider.of<ProductProvider>(context);

    // print(wishlistProvider.currentWishlist.book_Id);
    return GestureDetector(
      onTap: () {
        productProvider.currentProduct =
            productProvider.productList[widget.book];

        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ProductIndividual()));
      },
      child: Container(
          width: MediaQuery.of(context).size.width / 2,
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              children: [
                Container(
                  height: 135,
                  decoration: BoxDecoration(
                    image: wishlistProvider
                                .wishlistproductList[widget.book].image !=
                            ''
                        ? DecorationImage(
                            image: NetworkImage(wishlistProvider
                                .wishlistproductList[widget.book].image),
                          )
                        : DecorationImage(
                            image: AssetImage("assets/howinnovationworks.jpg"),
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      left: 10.0, top: 10, right: 5, bottom: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 40,
                        child: Text(
                            wishlistProvider
                                .wishlistproductList[widget.book].title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      Container(
                        height: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Npr " +
                                  (wishlistProvider
                                              .wishlistproductList[widget.book]
                                              .price !=
                                          ''
                                      ? wishlistProvider
                                          .wishlistproductList[widget.book]
                                          .price
                                      : "\"" "Not Provided" "\"" + "/-"),
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                              ),
                            ),
                            Icon(Icons.more_vert, color: Colors.black54),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
