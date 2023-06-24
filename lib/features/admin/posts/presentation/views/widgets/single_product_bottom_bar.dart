import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/widgets/show_alert_dialog.dart';
import '../../../data/models/product_model.dart';
import '../../view model/posts cubit/posts_cubit.dart';

class SingleProductBottomBar extends StatelessWidget {
  const SingleProductBottomBar({
    super.key,
    required this.theProduct,
  });

  final ProductModel theProduct;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 12.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            theProduct.name,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          IconButton(
            onPressed: () {
              showAlertDialog(
                context: context,
                onOk: () async {
                  try {
                    BlocProvider.of<PostsCubit>(context)
                        .deleteProduct(theProduct.id!);
                    BlocProvider.of<PostsCubit>(context).getProducts();
                  } catch (e) {
                    print('a77777777777a');
                    print(e);
                  }
                  Navigator.pop(context);
                },
                txtHead: 'Delete Product',
                txtMsg: 'Are you sure? to delete this product',
              );
            },
            icon: const Icon(Icons.delete_outline),
          ),
        ],
      ),
    );
  }
}