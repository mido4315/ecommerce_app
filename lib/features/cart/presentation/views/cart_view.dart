import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:ecommerce_app/features/cart/presentation/view%20model/cart%20cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:input_quantity/input_quantity.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../home/presentation/views/widgets/product_card_horizontal.dart';
import 'widgets/address_bar.dart';
import 'widgets/proceed_to_buy.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var cartItems = BlocProvider.of<CartCubit>(context).user.cart;

    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                const AddressBar(),
                const ProceedToBuy(),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount:
                      BlocProvider.of<CartCubit>(context).user.cart!.length,
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
                            product: ProductModel.fromMap(
                                BlocProvider.of<CartCubit>(context)
                                    .user
                                    .cart![index]['product']),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: InputQty(
                              maxVal: ProductModel.fromMap(
                                      BlocProvider.of<CartCubit>(context)
                                          .user
                                          .cart![index]['product'])
                                  .quantity,
                              initVal: BlocProvider.of<CartCubit>(context)
                                  .user
                                  .cart![index]['qty'],
                              minVal: 0,
                              steps: 1,
                              showMessageLimit: false,
                              borderShape: BorderShapeBtn.none,
                              plusBtn: const Icon(Icons.add_circle_outline),
                              minusBtn: const Icon(Icons.remove_circle_outline),
                              btnColor1: AppColors.buttonDark,
                              btnColor2: AppColors.background2,
                              onQtyChanged: (val) {
                                var product = ProductModel.fromMap(
                                    BlocProvider.of<CartCubit>(context)
                                        .user
                                        .cart![index]['product']);
                                var productQuantity =
                                    BlocProvider.of<CartCubit>(context)
                                        .user
                                        .cart![index]['qty'];
                                int value = val!.toInt();
                                if (productQuantity > value) {
                                  BlocProvider.of<CartCubit>(context)
                                      .onQuantityDecrease(
                                    product: product,
                                  );
                                } else if (productQuantity < value) {
                                  BlocProvider.of<CartCubit>(context)
                                      .onQuantityIncrease(
                                    product: product,
                                    quantity: 1,
                                    index: index,
                                  );
                                } else {}
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
        );
      },
    );
  }
}