import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../widgets/simpe_app_bar.dart';

class PostsView extends StatelessWidget {
  const PostsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(title: 'Posts'),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(AppRouter.kAddNewProduct);
        },
        backgroundColor: AppColors.buttonLight,
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}