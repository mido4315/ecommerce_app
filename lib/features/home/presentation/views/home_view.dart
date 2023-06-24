import 'package:ecommerce_app/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../widgets/custom_images_slider.dart';
import 'widgets/categories_bar.dart';
import 'widgets/home_search_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            HomeSearchBar(),
            CategoriesBar(),
            CustomImagesSlider(
              isFile: false,
            ),
          ],
        ),
      ),
    );
  }
}