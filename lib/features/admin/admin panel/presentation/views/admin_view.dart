import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/app_styles.dart';
import '../view model/admin cubit/admin_cubit.dart';
import 'widgets/custom admin button navigation bar/custom_admin_bottom_navigation_bar.dart';

class AdminView extends StatelessWidget {
  const AdminView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AdminCubit>(context);
    return BlocBuilder<AdminCubit, AdminState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text(
              'Admin Panel',
              style: AppStyles.textStyleTitle30,
            ),
            centerTitle: true,
          ),
          bottomNavigationBar: CustomAdminBottomNavigationBar(
            cubit: cubit,
            listOfIcons: cubit.listOfIcons,
            listOfStrings: cubit.listOfStrings,
          ),
          body: SafeArea(
            child: cubit.layoutPages[cubit.bottomNavigationBarCurrentIndex],
          ),
        );
      },
    );
  }
}