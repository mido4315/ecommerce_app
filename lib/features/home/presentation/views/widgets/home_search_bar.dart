import 'package:ecommerce_app/core/utils/app_router.dart';
import 'package:ecommerce_app/core/widgets/custom_snack_bar.dart';
import 'package:ecommerce_app/features/home/presentation/view%20model/home%20cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
        onSubmitted: (value) {
          BlocProvider.of<HomeCubit>(context).getSearchedProducts(searchString: value);
        },
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
          hintStyle: TextStyle(color: AppColors.text1.withOpacity(0.6)),
          prefixIcon: Icon(
            Icons.search,
            color: AppColors.text1.withOpacity(0.6),
          ),
        ),
      ),
    );
  }
}