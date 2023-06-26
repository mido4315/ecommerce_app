import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:ecommerce_app/features/product%20details/presentation/views/widgets/average_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({Key? key, required this.product})
      : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    double avgRating = 0;
    double totalRating = 0;
    for (int i = 0; i < product.rating!.length; i++) {
      totalRating += product.rating![i].rating;
    }
    if (totalRating > 0) {
      avgRating = totalRating / product.rating!.length;
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(

        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Row(
          children: [
            Image.network(
              product.images[0],
              fit: BoxFit.contain,
              width: 140.w,
            ),
            SizedBox(
              width: 10.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                  maxLines: 2,
                ),
                AverageRatingBar(
                  rating: avgRating,
                  itemSize: 16,
                ),
                Text(
                  '\$${product.price}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                ),
                const Text('Eligible for FREE Shipping'),
                const Text(
                  'In Stock',
                  style: TextStyle(
                    color: Colors.teal,
                  ),
                  maxLines: 2,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}