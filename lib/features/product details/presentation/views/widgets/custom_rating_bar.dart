import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../core/models/product_model.dart';
import '../../view model/product details cubit/product_details_cubit.dart';

class CustomRatingBar extends StatelessWidget {
  const CustomRatingBar({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<ProductDetailsCubit>(context);
    return RatingBar.builder(
      initialRating: cubit.userRating,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        cubit.rateProduct(
          product: product,
          rating: rating,
        );
      },
    );
  }
}