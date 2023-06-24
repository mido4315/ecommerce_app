import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../widgets/simple_app_bar.dart';
import '../../../posts/presentation/view model/posts cubit/posts_cubit.dart';
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
          appBar: simpleAppBar(title: 'Admin Panel'),
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