import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/widgets/custom_images_slider.dart';
import 'package:ecommerce_app/widgets/simple_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../admin/posts/data/models/product_model.dart';

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
                height: 420.h,
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
                  padding:  EdgeInsets.symmetric(vertical: 22.h,horizontal: 16.w),
                  child: const Column(
                    children: [
                      Text('tsatdsasd')
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}