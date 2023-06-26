import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/widgets/custom_images_slider.dart';
import 'package:ecommerce_app/widgets/simple_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/models/product_model.dart';
import '../view model/product details cubit/product_details_cubit.dart';
import 'widgets/average_rating_bar.dart';
import 'widgets/product_details_floating_action_button.dart';
import 'widgets/product_info.dart';

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
      floatingActionButton: ProductDetailFloatingActionButton(
        product: product,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // product image
                CustomImagesSlider(
                  isFile: false,
                  images: product.images,
                  autoPlay: false,
                  viewportFraction: 0.6,
                  enableInfiniteScroll: false,
                ),
                // product average rating
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 22.0),
                    child: AverageRatingBar(
                      rating: BlocProvider.of<ProductDetailsCubit>(context)
                          .avgRating,
                      itemSize: 28,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                ProductInfo(product: product,kHeight: constraints.minHeight,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}