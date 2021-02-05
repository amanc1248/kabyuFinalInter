import 'package:flutter/material.dart';
import 'package:kabyu_feather_webs/Model/product.dart';
import 'package:kabyu_feather_webs/Provider/ProductsProvider/productsProvider.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class RatingBar extends StatefulWidget {
  final Product theRating;
  RatingBar({this.theRating});
  @override
  _RatingBarState createState() => _RatingBarState();
}

class _RatingBarState extends State<RatingBar> {
  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    double rate = widget.theRating.rating;
    return SmoothStarRating(
      rating: rate,
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
      // onRated: (value) {
      //   print("rating value -> $value");
      // },
    );
  }
}
