import 'package:flutter/material.dart';

import '../../../../../../../core/constants/app_colors.dart';
import '../../../view model/admin cubit/admin_cubit.dart';

class InnerAnimatedContainer extends StatelessWidget {
  const InnerAnimatedContainer({
    super.key,
    required this.bottomNavigationBarCurrentIndex,
    required this.displayWidth,
    required this.listOfStrings,
    required this.listOfIcons,
    required this.cubit,
    required this.index,
  });

  final int bottomNavigationBarCurrentIndex;
  final double displayWidth;
  final List<String> listOfStrings;
  final List<IconData> listOfIcons;
  final AdminCubit cubit;

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        curve: Curves.fastLinearToSlowEaseIn,
        width: index == bottomNavigationBarCurrentIndex
            ? .31 * displayWidth
            : .18 * displayWidth,
        alignment: Alignment.center,
        child: Stack(
          children: [
            Row(
              children: [
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: index == bottomNavigationBarCurrentIndex
                      ? .13 * displayWidth
                      : 0,
                ),
                AnimatedOpacity(
                  opacity: index == bottomNavigationBarCurrentIndex ? 1 : 0,
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  child: Text(
                    index == bottomNavigationBarCurrentIndex
                        ? listOfStrings[index]
                        : '',
                    style: const TextStyle(
                      color: AppColors.text1,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: index == bottomNavigationBarCurrentIndex
                      ? .03 * displayWidth
                      : 20,
                ),
                  Icon(
                    listOfIcons[index],
                    size: .076 * displayWidth,
                    color: index == bottomNavigationBarCurrentIndex
                        ? AppColors.text1
                        : Colors.black26,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}