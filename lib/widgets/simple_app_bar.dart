
import 'package:flutter/material.dart';

import '../core/constants/app_styles.dart';

AppBar simpleAppBar({required String title}) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    title: Text(
      title,
      style: AppStyles.textStyleTitle30,
    ),
    centerTitle: true,
  );
}