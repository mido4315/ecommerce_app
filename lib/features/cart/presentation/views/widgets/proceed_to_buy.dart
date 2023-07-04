import 'package:ecommerce_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_styles.dart';
import '../../view model/cart cubit/cart_cubit.dart';

class ProceedToBuy extends StatelessWidget {
  const ProceedToBuy({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(18.w, 12.h, 18.w, 0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                return Text(
                  'Total Price ${BlocProvider.of<CartCubit>(context).totalPrice.toInt()}',
                  style: AppStyles.textStyleTitle20,
                );
              },
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(18.w, 0, 18.w, 16.h),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                context.push(
                  AppRouter.kAddressView,
                  extra: BlocProvider.of<CartCubit>(context).totalPrice,
                );
              },
              child: Text(
                'Proceed To Buy',
                style: AppStyles.textStyleTitle22,
              ),
            ),
          ),
        ),
      ],
    );
  }
}