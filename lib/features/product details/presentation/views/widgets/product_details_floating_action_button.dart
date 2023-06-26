import 'package:ecommerce_app/features/product%20details/presentation/view%20model/product%20details%20cubit/product_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../../../../../core/models/product_model.dart';

class ProductDetailFloatingActionButton extends StatelessWidget {
  const ProductDetailFloatingActionButton({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: Icons.menu,
      activeIcon: Icons.close,
      closeManually: false,
      curve: Curves.bounceIn,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      onOpen: () {},
      onClose: () {},
      children: [
        SpeedDialChild(
          child: const Icon(Icons.shopping_cart_outlined),
          label: 'Add to Cart',
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: () {
            BlocProvider.of<ProductDetailsCubit>(context).addProductToCart(
              product: product,
              quantity: BlocProvider.of<ProductDetailsCubit>(context).quantity,
            );
          },
        ),
        SpeedDialChild(
          child: const Icon(Icons.monetization_on_outlined),
          label: 'Buy Now',
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: () {},
        ),
      ],
    );
  }
}