import 'package:ecommerce_app/core/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:input_quantity/input_quantity.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../view model/product details cubit/product_details_cubit.dart';

class InputQuantity extends StatelessWidget {
  const InputQuantity({
    super.key,
    required this.quantity,
  });

  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(8, 0, 0, 3),
          child: Text('Quantity',style: TextStyle(
            color: AppColors.text1,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),),
        ),
        InputQty(
          maxVal: quantity,
          initVal: 1,
          minVal: 1,
          steps: 1,
          showMessageLimit: false,
          borderShape: BorderShapeBtn.none,
          plusBtn: const Icon(Icons.add_circle_outline),
          minusBtn: const Icon(Icons.remove_circle_outline),
          btnColor1: AppColors.buttonDark,
          btnColor2: AppColors.background2,
          onQtyChanged: (val) {
            BlocProvider.of<ProductDetailsCubit>(context).quantity = val as int;
          },
        ),
      ],
    );
  }
}