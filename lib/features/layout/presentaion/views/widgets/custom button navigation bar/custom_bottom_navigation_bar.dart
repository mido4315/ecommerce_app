import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../view model/layout_cubit/layout_cubit.dart';
import 'inner_animated_container.dart';
import 'outer_animated_container.dart';

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
    var bottomNavigationBarCurrentIndex = cubit.bottomNavigationBarCurrentIndex;
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
              // outside container shadow
              OuterAnimatedContainer(
                bottomNavigationBarCurrentIndex:
                    bottomNavigationBarCurrentIndex,
                displayWidth: displayWidth,
                index: index,
              ),
              // inside container that contains icon and text
              InnerAnimatedContainer(
                bottomNavigationBarCurrentIndex:
                    bottomNavigationBarCurrentIndex,
                displayWidth: displayWidth,
                listOfStrings: listOfStrings,
                listOfIcons: listOfIcons,
                cubit: cubit,
                index: index,
              ),
            ],
          ),
        ),
      ),
    );
  }
}