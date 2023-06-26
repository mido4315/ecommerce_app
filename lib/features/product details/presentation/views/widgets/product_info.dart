import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/app_styles.dart';
import '../../../../../core/models/product_model.dart';
import 'custom_rating_bar.dart';
import 'input_quantity.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    super.key,
    required this.product,
    required this.kHeight,
  });

  final ProductModel product;
  final double kHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: kHeight < 377.h ? 375.h : kHeight,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(
            26,
          ),
          topLeft: Radius.circular(
            26,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 26.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(6.0.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.name,
                    style: AppStyles.textStyleTitle20,
                  ),
                  Text(
                    '\$ ${product.price}',
                    style: AppStyles.textStyleTitle20,
                  ),
                ],
              ),
            ),
            const Divider(),
            InputQuantity(
              quantity: product.quantity,
            ),
            Padding(
              padding: EdgeInsets.all(8.0.r),
              child: Text(
                product.description,
                style: AppStyles.textStyleTitle20,
              ),
            ),
            const Divider(),
            SizedBox(
              height: 20.h,
            ),
            Column(
              children: [
                CustomRatingBar(
                  product: product,
                ),
                Text(
                  'Please Rate this product',
                  style: AppStyles.textStyleTitle20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}