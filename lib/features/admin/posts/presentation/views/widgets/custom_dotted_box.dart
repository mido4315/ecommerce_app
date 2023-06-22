import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_styles.dart';

class CustomDottedBox extends StatelessWidget {
  const CustomDottedBox({
    super.key,
    required this.onTap,
  });

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GestureDetector(
        onTap: onTap,
        child: DottedBorder(
          color: Colors.grey.withOpacity(0.5),
          strokeWidth: 1,
          dashPattern: const [
            10,
            10,
          ],
          child: SizedBox(
            width: double.infinity,
            height: 130.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image.asset('images/report.png'),
                Icon(
                  Icons.file_upload_outlined,
                  size: 80.r,
                  color: AppColors.text2,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Upload Image',
                  style: AppStyles.textStyleTitle20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}