import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/models/product_model.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/utils/api_service.dart';
import '../../../../core/utils/service_locator.dart';
import '../../../auth/data/repos/auth_repo_impl.dart';
import 'product_details_repo.dart';

class ProductDetailsRepoImpl implements ProductDetailsRepo {
  ProductDetailsRepoImpl(this.apiService);

  final APIService apiService;

  // get the admin token
  final String _token = getIt.get<AuthRepoImpl>().myUserModel.token!;

  // create headers
  Map<String, String> get _headers => {
        'Content-Type': 'application/json; charset=utf-8',
        'my-souq-auth-token': _token
      };

  @override
  Future<Either<Failure, void>> rateProduct({
    required ProductModel product,
    required double rating,
  }) async {
    try {
      // make a post request to the server
      await apiService.post(
        path: '/api/rate-product',
        headers: _headers,
        data: json.encode({
          'id': product.id,
          'rating': rating,
        }),
      );
      return const Right(null);
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

  @override
  Future<Either<Failure, void>> addProductToCart({
    required ProductModel product,
    required int quantity,
  }) async {
    try {
      // make a post request to the server
      var result = await apiService.post(
          path: '/api/add-to-cart',
          headers: _headers,
          data: jsonEncode({
            'id': product.id,
            'qty': quantity,
          }));
      getIt.get<AuthRepoImpl>().myUserModel.cart = result['cart'];
      return right(null);
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