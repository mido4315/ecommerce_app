import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../core/constants/app_assets.dart';

class CustomImagesSlider extends StatelessWidget {
  const CustomImagesSlider({
    super.key,
    required this.isFile,
    required this.images,
    required this.autoPlay,
    this.viewportFraction,
    this.enableInfiniteScroll,
  });

  final dynamic images;
  final bool isFile;
  final bool autoPlay;
  final bool? enableInfiniteScroll;

  final double? viewportFraction;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: isFile
          ? (images as List<File>).map((e) {
              return Builder(builder: (context) {
                return Image.file(e);
              });
            }).toList()
          : (images as List<String>).map((e) {
              return Builder(builder: (context) {
                return Image.network(e);
              });
            }).toList(),
      options: CarouselOptions(
        viewportFraction: viewportFraction ?? 0.9,
        initialPage: 0,
        enableInfiniteScroll: enableInfiniteScroll ?? true,
        reverse: false,
        autoPlay: autoPlay,
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