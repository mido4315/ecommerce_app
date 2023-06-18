import 'package:ecommerce_app/core/utils/service_locator.dart';
import 'package:ecommerce_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_styles.dart';
import 'custom_tile.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 80.0),
        width: size.width * 0.9,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(40),
            )),
        child: Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Column(
            children: [
              Center(
                child: Text(
                  getIt.get<AuthRepoImpl>().myUserModel.name!,
                  style: AppStyles.textStyleTitle20,
                ),
              ),
              ListTile(
                leading: Container(
                  width: 35.w,
                  height: 35.h,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(8)),
                  child: const Icon(Icons.email),
                ),
                title: Text(
                  getIt.get<AuthRepoImpl>().myUserModel.email,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
              const CustomTile(
                icon: Icon(Icons.man),
                tile: 'Male',
              ),
              CustomTile(
                icon: const Icon(
                  Icons.location_on_outlined,
                ),
                tile: getIt.get<AuthRepoImpl>().myUserModel.address!,
              ),
              const CustomTile(
                icon: Icon(
                  Icons.calendar_month,
                ),
                tile: '29-03-1997',
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }
}