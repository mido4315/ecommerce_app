import 'package:flutter/material.dart';

import '../../../../../../../core/constants/app_colors.dart';

class OuterAnimatedContainer extends StatelessWidget {
  const OuterAnimatedContainer({
    super.key,
    required this.bottomNavigationBarCurrentIndex,
    required this.displayWidth,
    required this.index,
  });

  final int bottomNavigationBarCurrentIndex;
  final double displayWidth;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        curve: Curves.fastLinearToSlowEaseIn,
        width: index == bottomNavigationBarCurrentIndex
            ? .32 * displayWidth
            : .18 * displayWidth,
        alignment: Alignment.center,
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          curve: Curves.fastLinearToSlowEaseIn,
          height:
              index == bottomNavigationBarCurrentIndex ? .12 * displayWidth : 0,
          width:
              index == bottomNavigationBarCurrentIndex ? .32 * displayWidth : 0,
          decoration: BoxDecoration(
            color: index == bottomNavigationBarCurrentIndex
                ? AppColors.card
                : Colors.transparent,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }
}