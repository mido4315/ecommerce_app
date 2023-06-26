import 'package:ecommerce_app/core/utils/api_service.dart';
import 'package:ecommerce_app/core/utils/service_locator.dart';
import 'package:ecommerce_app/features/home/data/repos/home_repo_impl.dart';
import 'package:ecommerce_app/features/home/presentation/view%20model/home%20cubit/home_cubit.dart';
import 'package:ecommerce_app/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../auth/data/repos/auth_repo_impl.dart';
import '../../../../cart/presentation/view model/cart cubit/cart_cubit.dart';
import '../../../../cart/presentation/views/cart_view.dart';
import '../../../../profile/presentation/views/profile_view.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());

  var cartItems = getIt.get<AuthRepoImpl>().myUserModel.cart!;

  void updateCartItems() {
    cartItems = getIt.get<AuthRepoImpl>().myUserModel.cart!;
    emit(LayoutChangeTap());
  }

  int bottomNavigationBarCurrentIndex = 0;

  void changeTap(newIndex) {
    bottomNavigationBarCurrentIndex = newIndex;
    emit(LayoutChangeTap());
  }

  final List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.shopping_cart,
    Icons.settings_rounded,
    Icons.person_rounded,
  ];

  final List<String> listOfStrings = [
    'Home',
    'Cart',
    'Settings',
    'Profile',
  ];

  final List<Widget> layoutPages = [
    BlocProvider(
      create: (context) =>
          HomeCubit(HomeRepoImpl(getIt.get<APIService>()))..getBestProducts(),
      child: const HomeView(),
    ),
    BlocProvider(
      create: (context) => CartCubit(),
      child: const CartView(),
    ),
    const Center(
      child: Text(
        'Settings',
        style: TextStyle(fontSize: 40),
      ),
    ),
    const ProfileView(),
  ];
// List<BottomNavigationBarItem> get bottomNavigationBarItems {
//   return [
//     const BottomNavigationBarItem(
//       label: 'Home',
//       icon: Icon(
//         Icons.home,
//       ),
//     ),
//     // BottomNavigationBarItem(
//     //   label: '',
//     //   icon: Icon(
//     //     Icons.category,
//     //   ),
//     // ),
//     const BottomNavigationBarItem(
//       label: 'Profile',
//       icon: Icon(
//         Icons.person,
//       ),
//     ),
//     BottomNavigationBarItem(
//       label: 'Cart',
//       icon: isCartItems
//           ? const Badge(
//               label: Text('2'),
//               child: Icon(
//                 Icons.shopping_cart,
//               ),
//             )
//           : const Icon(
//               Icons.shopping_cart,
//             ),
//     ),
//   ];
// }
}