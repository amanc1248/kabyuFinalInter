import 'package:flutter/material.dart';
import 'package:kabyu_feather_webs/Model/product_individual_carousel.dart';
import 'package:kabyu_feather_webs/Provider/ChatProvider/ChatProvider.dart';
import 'package:kabyu_feather_webs/Provider/ProductsProvider/productsProvider.dart';
import 'package:kabyu_feather_webs/Widgets/Rating_Bar.dart';
import 'package:kabyu_feather_webs/Widgets/products_grid.dart';
import 'package:kabyu_feather_webs/services/database.dart';
import 'package:kabyu_feather_webs/views/3.%20ChatPage/ChatListBookStore/Chat.dart';
import 'package:kabyu_feather_webs/views/AppBar/AppBar.dart';

import 'package:provider/provider.dart';

class ProductIndividual extends StatefulWidget {
  @override
  _ProductIndividualState createState() => _ProductIndividualState();
}

class _ProductIndividualState extends State<ProductIndividual> {
  void initState() {
    super.initState();
    // Provider.of<ChatProvider>(context).loadourUsersAndBuyers();
  }

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    ChatProvider chatProvider = Provider.of<ChatProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: OurAppBar.ourAppBar(context),
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
            color: Colors.white,
            child: Column(
              children: [
                ProductCarousel(),
              ],
            ),
          ),
          Container(
            color: Color(0XFFF8F8F8),
            padding: EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Npr " +
                      (productProvider.currentProduct.price != ''
                          ? productProvider.currentProduct.price
                          : "\"" "Not Provided" "\"") +
                      "/-",
                  style: TextStyle(
                      color: Color(0xFF01A299), fontWeight: FontWeight.w700),
                ),
                Text(
                  productProvider.currentProduct.title,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
                ),
                SizedBox(height: 5.0),
                Row(
                  children: [
                    productProvider.currentProduct.rating != null
                        ? RatingBar()
                        : Text("No Ratings"),
                    SizedBox(width: 10.0),
                    Text(
                      productProvider.currentProduct.categoryid,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF30009C)),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Divider(
                  color: Color.fromRGBO(33, 33, 33, 0.08),
                  thickness: 1.0,
                  height: 10.0,
                ),
                SizedBox(height: 5.0),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      buildRows(
                          first: "Condition",
                          second: productProvider.currentProduct.condition),
                      SizedBox(height: 10.0),
                      buildRows(
                          first: "Available for",
                          second: productProvider.currentProduct.availablefor),
                    ],
                  ),
                ),
                buildTitle(title: "Description"),
                SizedBox(height: 10.0),
                Text(
                  productProvider.currentProduct.description,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildTitle(title: "Seller details"),
                      SizedBox(height: 10.0),
                      Row(
                        children: [
                          Text("Seller: ",
                              style: TextStyle(fontWeight: FontWeight.w400)),
                          SizedBox(width: 20.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Ekta bookstore"),
                              Text(
                                "( 7 more products )",
                                style: TextStyle(color: Color(0xFF30009C)),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        children: [
                          Text("Contact: ",
                              style: TextStyle(fontWeight: FontWeight.w400)),
                          SizedBox(width: 5.0),
                          Text("Hidden",
                              style: TextStyle(color: Colors.black54))
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Divider(
                        color: Color.fromRGBO(33, 33, 33, 0.08),
                        thickness: 1.0,
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30.0),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 8.0),
                              height: 56,
                              child: FlatButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                    side: BorderSide(color: Color(0xFF6200EE))),
                                color: Colors.white,
                                textColor: Color(0xFF6200EE),
                                onPressed: () {
                                  addWishlist(
                                      productProvider.currentProduct.book_Id);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.favorite_border,
                                      color: Color(0xFFB00020),
                                    ),
                                    Text(
                                      "add to wishlist".toUpperCase(),
                                      style: TextStyle(
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 56,
                              width: double.infinity,
                              child: RaisedButton(
                                onPressed: () async {
                                  //Storing seller_id to the provider
                                  //Seller_id👇
                                  chatProvider.sellerIdFromBook =
                                      productProvider
                                          .productList[
                                              productProvider.bookIndexForChat]
                                          .seller_Id;
                                  await chatProvider.loadourUsersAndBuyers();
                                  await chatProvider.getUserId();
                                  print("BuyerId=>" + chatProvider.userId);
                                  print("SellerId=>" +
                                      chatProvider.sellerIdFromBook);
                                  int valueIs;
                                  if (chatProvider.ourUsersAndBuyers.length !=
                                      0) {
                                    for (var i = 0;
                                        i <
                                            chatProvider
                                                .ourUsersAndBuyers.length;
                                        i++) {
                                      if (chatProvider.ourUsersAndBuyers[i]
                                                  .buyerId ==
                                              chatProvider.userId &&
                                          chatProvider.ourUsersAndBuyers[i]
                                                  .sellerId ==
                                              chatProvider.sellerIdFromBook) {
                                        valueIs = i;
                                        break;
                                      } else {
                                        valueIs = -1;
                                      }
                                    }
                                  } else {
                                    valueIs = -1;
                                  }
                                  print("Value Is=>" + valueIs.toString());
                                  chatProvider.theIndexValue = valueIs;

                                  //passing the chatId index to the chatPage
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ChatPage(
                                              chatIndex: valueIs,
                                            )),
                                  );
                                },
                                child: Text(
                                  "talk to seller".toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                                color: Color(0xFF6200EE),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "similar books",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.arrow_right_alt,
                                  color: Color(0XFF30009C),
                                ),
                                Text(
                                  "view more",
                                  style: TextStyle(color: Color(0XFF30009C)),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ProductGrid(
                        count: 2,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ])),
      ),
    );
  }

  Text buildTitle({String title}) {
    return Text(title,
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500));
  }

  Widget buildRows({String first, String second}) {
    return Row(
      children: [
        Text(
          first,
          style: TextStyle(fontSize: 14.0),
        ),
        SizedBox(
          width: 10.0,
        ),
        Text(
          second,
          style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Color(0xFF30009C),
              fontSize: 14.0),
        ),
      ],
    );
  }
}
