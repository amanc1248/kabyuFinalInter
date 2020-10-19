
import 'package:flutter/material.dart';
import 'package:kabyu_feather_webs/Model/product_individual_carousel.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ProductIndividual extends StatefulWidget {
  @override
  _ProductIndividualState createState() => _ProductIndividualState();
}

class _ProductIndividualState extends State<ProductIndividual> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Row(
                    children: [
                      Icon(Icons.chevron_left),
                      Text(
                        "Back to all books",
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
              ProductCarousel(),
              Container(
                  color: Color(0XFFF8F8F8),
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Npr 200 /-",
                        style: TextStyle(
                            color: Color(0xFF01A299),
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "How innovation works",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20.0),
                      ),
                      SizedBox(height: 5.0),
                      Row(
                        children: [
                          SmoothStarRating(
                            rating: 1.0,
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
                            onRated: (value) {
                              print("rating value -> $value");
                            },
                          ),
                          SizedBox(width: 10.0),
                          Text(
                            "Science",
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
                            buildRows(first: "Condition", second: "Brand new"),
                            SizedBox(height: 10.0),
                            buildRows(
                                first: "Available for",
                                second: "Exchange Sell"),
                          ],
                        ),
                      ),
                      buildTitle(title: "Description"),
                      SizedBox(height: 10.0),
                      Text(
                        "Sit arcu, tortor euismod nisi, volutpat massa neque, quis ac. Leo lorem volutpat urna, maecenas fringilla condimentum risus adipiscing vehicula. Feugiat duis lacus consequat, ut consequat, morbi ultricies ac elementum. Et nibh aliquet egestas porttitor. Id a ultrices leo dolor.",
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
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400)),
                                  SizedBox(width: 20.0),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Ekta bookstore"),
                                      Text(
                                        "( 7 more products )",
                                        style:
                                            TextStyle(color: Color(0xFF30009C)),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.0),
                              Row(
                                children: [
                                  Text("Contact: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400)),
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
                            ],
                          )),
                    ],
                  )),
              Container(
                height: 150,
                padding: EdgeInsets.symmetric(horizontal: 12),
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
                        onPressed: () {},
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
                        onPressed: () {},
                        child: Text(
                          "talk to seller".toUpperCase(),
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                        color: Color(0xFF6200EE),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
