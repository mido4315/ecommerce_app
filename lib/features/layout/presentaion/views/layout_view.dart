import 'package:ecommerce_app/core/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view model/layout_cubit/layout_cubit.dart';
import 'widgets/custom button navigation bar/custom_bottom_navigation_bar.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<LayoutCubit>(context);
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text(
              'Trendy',
              style: AppStyles.textStyleTitle30,
            ),
            centerTitle: true,
          ),
          bottomNavigationBar: CustomBottomNavigationBar(
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