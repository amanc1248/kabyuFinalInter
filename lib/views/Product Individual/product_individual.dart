import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kabyu_feather_webs/Model/product.dart';
import 'package:kabyu_feather_webs/Model/product_individual_carousel.dart';
import 'package:kabyu_feather_webs/Provider/ChatProvider/ChatProvider.dart';
import 'package:kabyu_feather_webs/Provider/GoogleSignInProvider/GoogleSignInProvider.dart';
import 'package:kabyu_feather_webs/Provider/ProductsProvider/productsProvider.dart';
import 'package:kabyu_feather_webs/Widgets/Rating_Bar.dart';
import 'package:kabyu_feather_webs/Widgets/products_grid.dart';
import 'package:kabyu_feather_webs/services/database.dart';
import 'package:kabyu_feather_webs/views/3.%20ChatPage/ChatListBookStore/Chat.dart';
import 'package:kabyu_feather_webs/views/AppBar/AppBar.dart';

import 'package:provider/provider.dart';

class ProductIndividual extends StatefulWidget {
  final Product myIndividualProduct;
  const ProductIndividual({Key key, this.myIndividualProduct})
      : super(key: key);

  @override
  _ProductIndividualState createState() => _ProductIndividualState();
}

class _ProductIndividualState extends State<ProductIndividual> {
  void initState() {
    super.initState();
    // Provider.of<ChatProvider>(context).loadourUsersAndBuyers();
  }

  String userId = FirebaseAuth.instance.currentUser.uid;

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    ChatProvider chatProvider = Provider.of<ChatProvider>(context);
    AddProductsProvider addProductsProvider =
        Provider.of<AddProductsProvider>(context);
    GoogleSignInProvider googleSignInProvider =
        Provider.of<GoogleSignInProvider>(context);
    return Consumer<ChatProvider>(
      builder: (context, value, child) => SafeArea(
        child: Scaffold(
          appBar: OurAppBar.ourAppBar(context),
          body: SingleChildScrollView(
              child: Column(children: [
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  ProductCarousel(
                    myCarouselImage: widget.myIndividualProduct,
                  ),
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
                        (widget.myIndividualProduct.price != null
                            ? widget.myIndividualProduct.price
                            : "\"" "Not Provided" "\"") +
                        "/-",
                    style: TextStyle(
                        color: Color(0xFF01A299), fontWeight: FontWeight.w700),
                  ),
                  Text(
                    widget.myIndividualProduct.title,
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
                  ),
                  SizedBox(height: 5.0),
                  Row(
                    children: [
                      widget.myIndividualProduct.rating != null
                          ? RatingBar(
                              theRating: widget.myIndividualProduct,
                            )
                          : Text("No Ratings"),
                      SizedBox(width: 10.0),
                      // Text(
                      //   widget.myIndividualProduct.categoryid,
                      //   style: TextStyle(
                      //       fontWeight: FontWeight.w400,
                      //       color: Color(0xFF30009C)),
                      // ),
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
                            second: widget.myIndividualProduct.condition),
                        SizedBox(height: 10.0),
                        buildRows(
                            first: "Available for",
                            second: widget.myIndividualProduct.availablefor),
                      ],
                    ),
                  ),
                  buildTitle(title: "Description"),
                  SizedBox(height: 10.0),
                  Text(
                    widget.myIndividualProduct.description,
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
                            addProductsProvider.toggleContact == false
                                ? Text("Hidden",
                                    style: TextStyle(color: Colors.black54))
                                : Text(
                                    googleSignInProvider.userDetails[3] == null
                                        ? "Not Provided"
                                        : googleSignInProvider.userDetails[3]),
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
                              widget.myIndividualProduct.seller_Id != userId
                                  ? Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      height: 56,
                                      child: FlatButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                            side: BorderSide(
                                                color: Color(0xFF6200EE))),
                                        color: Colors.white,
                                        textColor: Color(0xFF6200EE),
                                        onPressed: () {
                                          addWishlist(productProvider
                                              .currentProduct.book_Id);
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                    )
                                  : SizedBox(),
                              widget.myIndividualProduct.seller_Id != userId
                                  ? Container(
                                      height: 56,
                                      width: double.infinity,
                                      child: RaisedButton(
                                        onPressed: () async {
                                          //Storing seller_id to the provider
                                          await chatProvider.getUserId();

                                          //Seller_id👇
                                          chatProvider.sellerId =
                                              productProvider
                                                  .productList[productProvider
                                                      .bookIndexForChat]
                                                  .seller_Id;
                                          chatProvider.buyerId =
                                              chatProvider.userId;
                                          await chatProvider
                                              .loadourUsersAndBuyers();

                                          int valueIs;
                                          if (chatProvider
                                                  .ourUsersAndBuyers.length !=
                                              0) {
                                            for (var i = 0;
                                                i <
                                                    chatProvider
                                                        .ourUsersAndBuyers
                                                        .length;
                                                i++) {
                                              if (chatProvider
                                                          .ourUsersAndBuyers[i]
                                                          .buyerId ==
                                                      chatProvider.userId &&
                                                  chatProvider
                                                          .ourUsersAndBuyers[i]
                                                          .sellerId ==
                                                      chatProvider.sellerId) {
                                                chatProvider.theIndexValue = i;
                                                chatProvider.chatId =
                                                    chatProvider
                                                        .ourUsersAndBuyers[i]
                                                        .chatid;
                                                break;
                                              } else {
                                                chatProvider.chatId = '';
                                                // chatProvider.sellerId =
                                                //     '';
                                                chatProvider.theIndexValue = -1;
                                              }
                                            }
                                          } else {
                                            chatProvider.chatId = '';

                                            chatProvider.theIndexValue = -1;
                                          }

                                          //passing the chatId index to the chatPage
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => ChatPage(
                                                      chatIndex: chatProvider
                                                          .theIndexValue,
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
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                      ),
                                    )
                                  : SizedBox(),
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
