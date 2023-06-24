import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/utils/app_router.dart';
import 'package:ecommerce_app/features/admin/posts/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
    required this.isLiked,
  }) : super(key: key);

  final ProductModel product;
  final bool isLiked;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: <BoxShadow>[
            BoxShadow(color: Colors.black12, blurRadius: 15, spreadRadius: 10),
          ]),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    //Navigator.pushNamed(context, ProductDetailScreen.routeName, arguments: product);
                    context.push(AppRouter.kProductDetailsView, extra: product);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            product.images[0],
                            height: 90.h,
                            width: 140.w,
                          )),
                      Text(
                        product.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${product.price} \$',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.indigo),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                icon: Icon(
                  isLiked ? Icons.favorite : Icons.favorite_border,
                  color: Colors.red,
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}