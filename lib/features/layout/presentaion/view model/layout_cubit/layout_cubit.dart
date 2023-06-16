import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/layout/presentaion/views/home_view.dart';
import 'package:flutter/material.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit()
      : isCartItems = false,
        super(LayoutInitial());

  final bool isCartItems;

  int bottomNavigationBarCurrentIndex = 0;

  void changeTap(newIndex) {
    bottomNavigationBarCurrentIndex = newIndex;
    emit(LayoutChangeTap());
  }

  final List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.favorite_rounded,
    Icons.settings_rounded,
    Icons.person_rounded,
  ];

  final List<String> listOfStrings = [
    'Home',
    'Favorite',
    'Settings',
    'Account',
  ];

  final List<Widget> layoutPages = [
    const HomeView(),
    const Center(
      child: Text(
        'profile',
        style: TextStyle(fontSize: 40),
      ),
    ),
    const Center(
      child: Text(
        'cart',
        style: TextStyle(fontSize: 40),
      ),
    ),
    const Center(
      child: Text(
        'cart',
        style: TextStyle(fontSize: 40),
      ),
    ),
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