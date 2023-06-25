import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/constants/app_styles.dart';
import 'package:ecommerce_app/widgets/custom_images_slider.dart';
import 'package:ecommerce_app/widgets/simple_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../../../admin/posts/data/models/product_model.dart';
import 'widgets/custom_rating_bar.dart';
import 'widgets/product_details_floating_action_button.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background2,
      appBar: simpleAppBar(title: 'Trendy'),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomImagesSlider(
                isFile: false,
                images: product.images,
                autoPlay: false,
                viewportFraction: 0.6,
                enableInfiniteScroll: false,
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                width: double.infinity,
                height: 392.h,
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
                  padding:
                      EdgeInsets.symmetric(vertical: 30.h, horizontal: 26.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:  EdgeInsets.all(6.0.r),
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
                      Padding(
                        padding: EdgeInsets.all( 8.0.r),
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
                          const CustomRatingBar(),
                          Text(
                            'Please Rate this product',
                            style: AppStyles.textStyleTitle20,
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: const ProductDetailFloatingActionButton(),
    );
  }
}