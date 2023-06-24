import 'package:flutter/material.dart';

class CategoriesDetailsView extends StatelessWidget {
  const CategoriesDetailsView({
    Key? key,
    required this.categoryTitle,
  }) : super(key: key);
  final String categoryTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(categoryTitle),
      ),
    );
  }
}