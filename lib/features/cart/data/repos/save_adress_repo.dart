import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/utils/api_service.dart';
import '../../../../core/utils/service_locator.dart';
import '../../../auth/data/repos/auth_repo_impl.dart';

class OrdersRepo {
  OrdersRepo(this.apiService);

  final APIService apiService;

  // get the admin token
  final String _token = getIt.get<AuthRepoImpl>().myUserModel.token!;

  // create headers
  Map<String, String> get _headers => {
        'Content-Type': 'application/json; charset=utf-8',
        'my-souq-auth-token': _token
      };

  Future<Either<Failure, void>> addNewAddress({
    required String address,
  }) async {
    try {
      // make a post request to the server
      var result = await apiService.post(
          path: '/api/save-user-address',
          headers: _headers,
          data: jsonEncode({
            'address': address,
          }));
      getIt.get<AuthRepoImpl>().myUserModel.address = result['address'];
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

  Future<Either<Failure, void>> createNewOrder({
    required String address,
    required double totalPrice,
    required String paymentMethod,
  }) async {
    try {
      // make a post request to the server
       await apiService.post(
          path: '/api/order',
          headers: _headers,
          data: jsonEncode({
            'cart': getIt.get<AuthRepoImpl>().myUserModel.cart,
            'address': address,
            'totalPrice': totalPrice,
            'paymentMethod': paymentMethod,
          }));
      getIt.get<AuthRepoImpl>().myUserModel.cart = [];
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