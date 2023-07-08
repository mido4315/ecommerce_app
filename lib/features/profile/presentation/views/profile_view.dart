import 'package:ecommerce_app/core/utils/app_router.dart';
import 'package:ecommerce_app/core/utils/service_locator.dart';
import 'package:ecommerce_app/core/widgets/show_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/shared_preferences.dart';
import 'widgets/profile_button.dart';
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
                    onPressed: () {
                      context.push(AppRouter.kMyOrdersView);
                    },
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
                    onPressed: () {
                      showAlertDialog(
                        context: context,
                        onOk: () {
                          getIt.get<SharedPrefs>().clearData();
                          context.pushReplacement('/');
                        },
                        txtHead: 'Do you want to log out',
                        txtMsg: '',
                      );
                    },
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