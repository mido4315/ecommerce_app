
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class ProductDetailFloatingActionButton extends StatelessWidget {
  const ProductDetailFloatingActionButton({
    super.key,
  });

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
            // productServices.addProductToCart(
            //     context: context,
            //     product: widget.product,
            //     qty: 1
            // );
            Navigator.pop(context);
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