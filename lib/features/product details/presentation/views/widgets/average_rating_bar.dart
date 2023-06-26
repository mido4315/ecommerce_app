import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AverageRatingBar extends StatelessWidget {
  const AverageRatingBar({Key? key, required this.rating, required this.itemSize}) : super(key: key);

  final double rating;
  final double itemSize;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      direction: Axis.horizontal,
      itemCount: 5,
      rating: rating,
      itemSize: itemSize,
      itemBuilder: (context, _) {
        return const Icon(
          Icons.star,
          color: Colors.white,
        );
      },
    );
  }
}