import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_assets.dart';

class CategoriesBar extends StatelessWidget {
  const CategoriesBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 18.0.h),
      child: SizedBox(
        height: 80.h,
        child: ListView.builder(
          itemCount: AppAssets.categoriesIcons.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(

              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: GestureDetector(
                onTap: () {
                  var categoryTitle =
                      AppAssets.categoriesIcons[index]["category"];
                  context.push(
                    '/kCategoriesDetailsView/$categoryTitle',
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      AppAssets.categoriesIcons[index]["icon"]!,
                      width: 60.w,
                    ),
                    Text(
                      AppAssets.categoriesIcons[index]["category"]!,
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}