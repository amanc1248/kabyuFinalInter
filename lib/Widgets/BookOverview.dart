import 'package:flutter/material.dart';
import 'package:kabyu_feather_webs/Provider/ProductsProvider/productsProvider.dart';
import 'package:kabyu_feather_webs/views/Product%20Individual/product_individual.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class BookOverview extends StatefulWidget {
  @override
  _BookOverviewState createState() => _BookOverviewState();
}

class _BookOverviewState extends State<BookOverview> {
  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    return Expanded(
      child: wishlistProvider.wishlistproductList.length == 0
          ? Center(child: Text("No products in your wishlist."))
          : ListView.builder(
              itemCount: wishlistProvider.wishlistproductList.length,
              itemBuilder: (context, index) => Container(
                height: 92,
                margin: EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.05),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 0)),
                    ],
                    color: Color.fromRGBO(244, 244, 244, 1)),
                child: GestureDetector(
                  onTap: () {
                    wishlistProvider.currentWishlist =
                        wishlistProvider.wishlistproductList[index];

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductIndividual(
                                  myIndividualProduct:
                                      wishlistProvider.currentWishlist,
                                )));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Image(
                            image: wishlistProvider
                                        .wishlistproductList[index].image !=
                                    ''
                                ? NetworkImage(wishlistProvider
                                    .wishlistproductList[index].image)
                                : AssetImage("assets/howinnovationworks.jpg"),
                            fit: BoxFit.cover,
                            width: 65,
                          ),
                        ),
                        SizedBox(
                          width: 13,
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Npr " +
                                    wishlistProvider
                                        .wishlistproductList[index].price +
                                    "/-",
                                style: TextStyle(
                                    color: Color.fromRGBO(255, 107, 107, 1),
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                wishlistProvider
                                    .wishlistproductList[index].title,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 20),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  SmoothStarRating(
                                    rating: wishlistProvider
                                        .wishlistproductList[index].rating
                                        .toDouble(),
                                    isReadOnly: true,
                                    size: 15,
                                    filledIconData: Icons.star,
                                    halfFilledIconData: Icons.star_half,
                                    defaultIconData: Icons.star_border,
                                    starCount: 5,
                                    allowHalfRating: true,
                                    spacing: 2.0,
                                    color: Colors.yellow,
                                    borderColor: Colors.yellow,
                                    onRated: (value) {},
                                  ),
                                  SizedBox(
                                    width: 9.5,
                                  ),
                                  Expanded(
                                    child: Text(
                                      wishlistProvider
                                                  .wishlistproductList[index]
                                                  .categoryid ==
                                              null
                                          ? "Not Provided"
                                          : wishlistProvider
                                              .wishlistproductList[index]
                                              .categoryid,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Color.fromRGBO(48, 0, 156, 1),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
