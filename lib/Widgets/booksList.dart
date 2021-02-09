import 'package:flutter/material.dart';
import 'package:kabyu_feather_webs/Provider/ChatProvider/ChatProvider.dart';
import 'package:kabyu_feather_webs/Provider/ProductsProvider/productsProvider.dart';
import 'package:kabyu_feather_webs/views/Product%20Individual/product_individual.dart';
import 'package:provider/provider.dart';

class BooksList extends StatefulWidget {
  final int book;

  const BooksList({Key key, this.book}) : super(key: key);

  @override
  _BooksListState createState() => _BooksListState();
}

ProductProvider productProvider;
ChatProvider chatProvider;

class _BooksListState extends State<BooksList> {
  checkBookImage() {
    if (productProvider.productList[widget.book].image == null) {
      return Container(
          decoration: BoxDecoration(color: Colors.grey),
          height: 135,
          child: Center(
            child: Text(
              '${productProvider.productList[widget.book].title[0]}'
                  .toUpperCase(),
              style: TextStyle(fontSize: 25),
            ),
          ));
    } else {
      return Container(
        height: 135,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(productProvider.productList[widget.book].image),
            fit: BoxFit.cover,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of<ProductProvider>(context);
    chatProvider = Provider.of<ChatProvider>(context);
    // ChatProvider chatProvider = Provider.of<Chat>(context);
    print(productProvider.productList[widget.book].image);
    return GestureDetector(
      onTap: () {
        productProvider.bookIndexForChat = widget.book;
        productProvider.currentProduct =
            productProvider.productList[widget.book];
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductIndividual(
                      myIndividualProduct: productProvider.currentProduct,
                    )));
      },
      child: Container(
          width: MediaQuery.of(context).size.width / 2,
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              children: [
                Container(
                  height: 135,
                  child: checkBookImage(),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      left: 10.0, top: 10, right: 5, bottom: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 40,
                        child:
                            Text(productProvider.productList[widget.book].title,
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
                                  (productProvider
                                              .productList[widget.book].price !=
                                          ''
                                      ? productProvider
                                          .productList[widget.book].price
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
