import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/layout/presentaion/views/home_view.dart';
import 'package:flutter/material.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());

  final List<Widget> layoutPages = [
    const HomeView(),
    const Center(
      child: Text(
        'test 2',
        style: TextStyle(fontSize: 40),
      ),
    ),
    const Center(
      child: Text(
        'test 3',
        style: TextStyle(fontSize: 40),
      ),
    ),
    const Center(
      child: Text(
        'test 4',
        style: TextStyle(fontSize: 40),
      ),
    ),
  ];
  final List<BottomNavigationBarItem> bottomNavigationBarItems = const [
    BottomNavigationBarItem(
      label: '',
      icon: Icon(
        Icons.home,
      ),
    ),
    BottomNavigationBarItem(
      label: '',
      icon: Icon(
        Icons.category,
      ),
    ),
    BottomNavigationBarItem(
      label: '',
      icon: Icon(
        Icons.shopping_cart,
      ),
    ),
    BottomNavigationBarItem(
      label: '',
      icon: Icon(
        Icons.person,
      ),
    ),
  ];
  int bottomNavigationBarCurrentIndex = 0;

  void changeTap(newIndex) {
    bottomNavigationBarCurrentIndex = newIndex;
    emit(LayoutChangeTap());
  }
}