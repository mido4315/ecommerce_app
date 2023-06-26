import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/core/utils/api_service.dart';
import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:ecommerce_app/features/categories%20details/data/repos/categories_repo.dart';

import '../../../../core/utils/service_locator.dart';
import '../../../auth/data/repos/auth_repo_impl.dart';

class CategoriesRepoImpl extends CategoriesRepo {
  CategoriesRepoImpl(this.apiService);

  final APIService apiService;

  // get the admin token
  final String _token = getIt.get<AuthRepoImpl>().myUserModel.token!;

  // create headers
  Map<String, String> get _headers => {
        'Content-Type': 'application/json; charset=utf-8',
        'my-souq-auth-token': _token
      };

  @override
  Future<Either<Failure, List<ProductModel>>> getProducts({required String category}) async {
    List<ProductModel> products = [];
    try {
      // make a post request to the server
      List<dynamic> result = await apiService.getList(
        path: '/api/get-products?category=$category',
        headers: _headers,
      );
      for (int i = 0; i < result.length; i++) {
        products.add(ProductModel.fromMap(result[i]));
      }

      return right(products);
    } catch (e) {
      if (e is DioException) {
        return Left(
          ServerFailure.fromDioError(e),
        );
      }
      return Left(
        ServerFailure(e.toString()),
      );
    }
  }
}