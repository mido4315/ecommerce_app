import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../view model/layout_cubit/layout_cubit.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.cubit,
    required this.listOfIcons,
    required this.listOfStrings,
  });

  final LayoutCubit cubit;
  final List<IconData> listOfIcons;

  final List<String> listOfStrings;

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    var  bottomNavigationBarCurrentIndex = cubit.bottomNavigationBarCurrentIndex;
    return Container(
      margin: EdgeInsets.all(.05 * displayWidth),
      height: .155 * displayWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.circular(50),
      ),
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: .03 * displayWidth),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            cubit.changeTap(index);
            HapticFeedback.lightImpact();
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Stack(
            children: [
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.fastLinearToSlowEaseIn,
                width: index == bottomNavigationBarCurrentIndex
                    ? .32 * displayWidth
                    : .18 * displayWidth,
                alignment: Alignment.center,
                child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: index == bottomNavigationBarCurrentIndex
                      ? .12 * displayWidth
                      : 0,
                  width: index == bottomNavigationBarCurrentIndex
                      ? .32 * displayWidth
                      : 0,
                  decoration: BoxDecoration(
                    color: index == bottomNavigationBarCurrentIndex
                        ? Colors.blueAccent.withOpacity(.2)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              AnimatedContainer(
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
                          opacity:
                              index == bottomNavigationBarCurrentIndex
                                  ? 1
                                  : 0,
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          child: Text(
                            index == bottomNavigationBarCurrentIndex
                                ? listOfStrings[index]
                                : '',
                            style: const TextStyle(
                              color: Colors.blueAccent,
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
                              ? Colors.blueAccent
                              : Colors.black26,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}