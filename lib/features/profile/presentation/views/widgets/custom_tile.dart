import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTile extends StatelessWidget {
  const CustomTile({
    super.key,
    required this.icon,
    required this.tile,
  });

  final Widget? icon;
  final String tile;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 35.w,
        height: 35.h,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: AppColors.background,
            borderRadius: BorderRadius.circular(8)),
        child: icon,
      ),
      title: Text(tile),
    );
  }
}