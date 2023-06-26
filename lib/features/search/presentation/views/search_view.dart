import 'package:ecommerce_app/widgets/product_card.dart';
import 'package:ecommerce_app/widgets/simple_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../../core/models/product_model.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key, required this.products}) : super(key: key);

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(title: 'Search Results'),
      body: GridView.builder(
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 165,
        ),
        itemBuilder: (context, index) {
          return ProductCard(
            product: products[index],
            isLiked: false,
          );
          // return Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   mainAxisSize: MainAxisSize.min,
          //   children: [
          //     SingleProduct(
          //       image: theProduct.images[0],
          //     ),
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceAround,
          //       children: [
          //         Text(theProduct.name),
          //         Text('${theProduct.price}EGP'),
          //       ],
          //     )
          //   ],
          // );
        },
      ),
    );
  }
}