import 'package:ecommerce_app/core/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/models/product_model.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../../auth/data/repos/auth_repo_impl.dart';
import '../../../data/repos/product_details_repo_impl.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(this.productDetailsRepo) : super(ProductDetailsInitial());

  final ProductDetailsRepoImpl productDetailsRepo;
  double _totalRating = 0;
  double userRating = 0;
  double avgRating = 0;

  void calculateRating(ProductModel product) {
    final UserModel user = getIt.get<AuthRepoImpl>().myUserModel;
    for (int i = 0; i < product.rating!.length; i++) {
      _totalRating += product.rating![i].rating;
      if (product.rating![i].userId == user.id) {
        userRating = product.rating![i].rating;
      }
      if (_totalRating > 0) {
        avgRating = _totalRating / product.rating!.length;
      }
    }
  }

  Future<void> rateProduct({
    required ProductModel product,
    required double rating,
  }) async {

        await productDetailsRepo.rateProduct(product: product, rating: rating);
  }

  int quantity = 0;

  Future<void> addProductToCart({
    required ProductModel product,
    required int quantity,
  }) async {
     await productDetailsRepo.addProductToCart(
      product: product,
      quantity: quantity,
    );
  }
}