
import 'package:flutter/material.dart';

import 'widgets/custom_images_slider.dart';
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
            CustomImagesSlider(),
          ],
        ),
      ),
    );
  }
}