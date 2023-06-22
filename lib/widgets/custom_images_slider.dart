import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../core/constants/app_assets.dart';

class CustomImagesSlider extends StatelessWidget {
  const CustomImagesSlider({
    super.key,
    required this.isFile,
    this.images,
  });

  final List<File>? images;
  final bool isFile;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: isFile
          ? images!.map((e) {
              return Builder(builder: (context) {
                return Image.file(e);
              });
            }).toList()
          : AppAssets.testImages.map((e) {
              return Builder(builder: (context) {
                return Image.network(e);
              });
            }).toList(),
      options: CarouselOptions(
        viewportFraction: 0.9,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.2,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}