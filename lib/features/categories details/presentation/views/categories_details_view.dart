import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/models/product_model.dart';
import '../../../../core/utils/app_router.dart';
import '../../../../widgets/simple_app_bar.dart';
import '../../../../widgets/single_product.dart';
import '../view model/categories details cubit/categories_details_cubit.dart';

class CategoriesDetailsView extends StatelessWidget {
  const CategoriesDetailsView({
    Key? key,
    required this.categoryTitle,
  }) : super(key: key);
  final String categoryTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(title: categoryTitle),
      body: BlocBuilder<CategoriesDetailsCubit, CategoriesDetailsState>(
        builder: (context, state) {
          if (state is CategoriesDetailsSuccess) {
            return GridView.builder(
              itemCount: state.products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 165,
              ),
              itemBuilder: (context, index) {
                ProductModel theProduct = state.products[index];
                return GestureDetector(
                  onTap: () {
                    context.push(AppRouter.kProductDetailsView, extra: theProduct);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 100.h,
                        width: 180.w,
                        child: SingleProduct(
                          image: theProduct.images[0],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            theProduct.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text('${theProduct.price.toInt()}EGP'),
                        ],
                      )
                    ],
                  ),
                );
              },
            );
          } else if (state is CategoriesDetailsFailure) {
            return Center(
              child: Text(
                state.errorMessage,
                style: const TextStyle(fontSize: 50),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}