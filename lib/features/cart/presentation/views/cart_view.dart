import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:ecommerce_app/features/cart/presentation/view%20model/cart%20cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/product%20details/presentation/views/widgets/input_quantity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:input_quantity/input_quantity.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/service_locator.dart';
import '../../../auth/data/repos/auth_repo_impl.dart';
import '../../../home/presentation/views/widgets/product_card_horizontal.dart';
import '../../../product details/presentation/view model/product details cubit/product_details_cubit.dart';
import 'widgets/address_bar.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartItems = BlocProvider
        .of<CartCubit>(context).user.cart;
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const AddressBar(),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount:cartItems!.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // context.push(
                          //   AppRouter.kProductDetailsView,
                          //   extra: state.bestProducts[index],
                          // );
                        },
                        child: ProductCardHorizontal(
                          product: ProductModel.fromMap(cartItems[index]['product']),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: InputQty(
                            maxVal: ProductModel.fromMap(cartItems[index]['product']).quantity,
                            initVal: cartItems[index]['qty'],
                            minVal: 1,
                            steps: 1,
                            showMessageLimit: false,
                            borderShape: BorderShapeBtn.none,
                            plusBtn: const Icon(Icons.add_circle_outline),
                            minusBtn: const Icon(Icons.remove_circle_outline),
                            btnColor1: AppColors.buttonDark,
                            btnColor2: AppColors.background2,
                            onQtyChanged: (val) {
                              //BlocProvider.of<ProductDetailsCubit>(context).quantity = val as int;
                            },
                          ),
                        ),
                      ),

                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}