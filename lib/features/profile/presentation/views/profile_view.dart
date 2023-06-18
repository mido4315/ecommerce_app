import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../auth/presentation/views/widgets/profile_button.dart';
import 'widgets/profile_image.dart';
import 'widgets/profile_info.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   title:  Text(
      //     'Welcome',
      //     style: AppStyles.textStyleTitle30,
      //   ),
      //   centerTitle: true,
      // ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  ProfileButton(
                    buttonName: 'My Orders',
                    onPressed: () {},
                  ),
                  ProfileButton(
                    buttonName: 'Best Seller',
                    onPressed: () {},
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  ProfileButton(
                    buttonName: 'Wish List',
                    onPressed: () {},
                  ),
                  ProfileButton(
                    buttonName: 'Log Out',
                    onPressed: () {},
                  ),
                ],
              ),
              Stack(
                children: <Widget>[
                  ProfileInfo(size: size),
                  ProfileImage(size: size),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}