
import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          ),
          fillColor: Colors.white,
          filled: true,
          hintText: 'Search...',
          hintStyle:  TextStyle(color: AppColors.text1.withOpacity(0.6)),
          prefixIcon:  Icon(Icons.search,color: AppColors.text1.withOpacity(0.6),),
        ),
      ),
    );
  }
}