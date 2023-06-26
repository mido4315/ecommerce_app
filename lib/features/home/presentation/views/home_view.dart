import 'package:ecommerce_app/core/constants/app_assets.dart';
import 'package:ecommerce_app/core/constants/app_styles.dart';
import 'package:ecommerce_app/features/home/presentation/view%20model/home%20cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_router.dart';
import '../../../../core/widgets/custom_snack_bar.dart';
import '../../../../widgets/custom_images_slider.dart';
import 'widgets/categories_bar.dart';
import 'widgets/home_search_bar.dart';
import 'widgets/product_card_horizontal.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is SearchSuccess) {
          context.push(AppRouter.kSearchView, extra: state.searchedProducts);
        } else if (state is SearchFailure) {
          customSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        if (state is HomeSuccess) {
          return Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const HomeSearchBar(),
                    const CategoriesBar(),
                    const CustomImagesSlider(
                      isFile: false,
                      images: AppAssets.testImages,
                      autoPlay: true,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Text(
                        'Deal Of The Day',
                        style: AppStyles.textStyleTitle26,
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.bestProducts.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            context.push(
                              AppRouter.kProductDetailsView,
                              extra: state.bestProducts[index],
                            );
                          },
                          child: ProductCardHorizontal(
                            product: state.bestProducts[index],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (state is HomeFailure) {
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
    );
  }
}