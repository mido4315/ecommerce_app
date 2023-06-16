import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view model/layout_cubit/layout_cubit.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<LayoutCubit>(context);
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.red,
              type: BottomNavigationBarType.shifting,
              currentIndex: cubit.bottomNavigationBarCurrentIndex,
              onTap: (value) {
                cubit.changeTap(value);
              },
              items: cubit.bottomNavigationBarItems,
          ),
          body: SafeArea(
            child: cubit.layoutPages[cubit.bottomNavigationBarCurrentIndex],
          ),
        );
      },
    );
  }
}