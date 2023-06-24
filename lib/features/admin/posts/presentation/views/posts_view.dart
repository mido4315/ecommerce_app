import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/utils/app_router.dart';
import 'package:ecommerce_app/features/admin/posts/presentation/view%20model/posts%20cubit/posts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../widgets/simpe_app_bar.dart';
import 'widgets/single_product.dart';
import 'widgets/single_product_bottom_bar.dart';

class PostsView extends StatelessWidget {
  const PostsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(title: 'Posts'),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GoRouter.of(context).push(AppRouter.kAddNewProduct);
        },
        backgroundColor: AppColors.buttonLight,
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
      body: BlocBuilder<PostsCubit, PostsState>(
        builder: (context, state) {
          if (state is PostsSuccess) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: state.productsList.length,
              itemBuilder: (context, index) {
                final theProduct = state.productsList[index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SingleProduct(
                      image: theProduct.images[0],
                    ),
                    SingleProductBottomBar(theProduct: theProduct)
                  ],
                );
              },
            );
          } else if (state is PostsFailure) {
            return Center(
              child: Text(
                state.errorMessage,
                style: const TextStyle(fontSize: 50),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}