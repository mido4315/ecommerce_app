import 'package:ecommerce_app/core/constants/app_assets.dart';
import 'package:ecommerce_app/features/home/presentation/view%20model/home%20cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_router.dart';
import '../../../../core/widgets/custom_snack_bar.dart';
import '../../../../widgets/custom_images_slider.dart';
import 'widgets/categories_bar.dart';
import 'widgets/home_search_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeSuccess) {
          context.push(AppRouter.kSearchView, extra: state.searchedProducts);
        } else if (state is HomeFailure) {
          customSnackBar(context, state.errorMessage);
        }
      },
      child: const Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              HomeSearchBar(),
              CategoriesBar(),
              CustomImagesSlider(
                isFile: false,
                images: AppAssets.testImages,
                autoPlay: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}