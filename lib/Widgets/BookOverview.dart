import 'package:flutter/material.dart';
import 'package:kabyu_feather_webs/Model/Wishist%20model/Wishlists.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

final List<Wishlists> theWishListsBooks = [
  Wishlists(
    imageName: "howinnovationworks.jpg",
    bookName: "How Innovation Works",
    category: "Science",
    cost: "Npr 200 /-",
    rating: 4,
  ),
  Wishlists(
    imageName: "howinnovationworks.jpg",
    bookName: "How Innovation Works",
    category: "Science",
    cost: "Npr 200 /-",
    rating: 4,
  ),
  Wishlists(
    imageName: "howinnovationworks.jpg",
    bookName: "How Innovation Works",
    category: "Science",
    cost: "Npr 200 /-",
    rating: 4,
  ),
  Wishlists(
    imageName: "howinnovationworks.jpg",
    bookName: "How Innovation Works",
    category: "Science",
    cost: "Npr 200 /-",
    rating: 4,
  )
];

class BookOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: theWishListsBooks.length,
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
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Row(
              children: [
                Expanded(
                  child: Image(
                    image: AssetImage(
                      "howinnovationworks.jpg",
                    ),
                    // height: 73,
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
                        theWishListsBooks[index].cost,
                        style: TextStyle(
                            color: Color.fromRGBO(255, 107, 107, 1),
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        theWishListsBooks[index].bookName,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          SmoothStarRating(
                            rating: theWishListsBooks[index].rating.toDouble(),
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
                          SizedBox(
                            width: 9.5,
                          ),
                          Text(
                            theWishListsBooks[index].category,
                            style: TextStyle(
                                color: Color.fromRGBO(48, 0, 156, 1),
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
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
    );
  }
}
