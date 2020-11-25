import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class RatingBar extends StatelessWidget {
  const RatingBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmoothStarRating(
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
    );
  }
}
