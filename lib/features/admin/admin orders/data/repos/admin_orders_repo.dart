import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/core/models/order.dart';

import '../../../../../core/utils/api_service.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../../auth/data/repos/auth_repo_impl.dart';

class AdminOrdersRepo {
  AdminOrdersRepo(this.apiService);

  final APIService apiService;

  // get the admin token
  final String _token = getIt.get<AuthRepoImpl>().myUserModel.token!;

  // create headers
  Map<String, String> get _headers => {
        'Content-Type': 'application/json; charset=utf-8',
        'my-souq-auth-token': _token
      };

  Future<Either<Failure, List<OrderModel>>> getOrders() async {
    try {
      List<OrderModel> orders = [];
      // make a post request to the server
      List<dynamic> result = await apiService.getList(
        path: '/api/all-orders-admin',
        headers: _headers,
      );
      for (int i = 0; i < result.length; i++) {
        orders.add(OrderModel.fromMap(result[i]));
      }

      return right(orders);
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

  Future<Either<Failure, void>> changeOrderStatus({
    required int status,
    required OrderModel order,
  }) async {
    try {
      // make a post request to the server
      await apiService.post(
        path: '/admin/update-order-status',
        headers: _headers,
        data: json.encode({
          'id': order.id,
          'status': status,
        }),
      );
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(ServerFailure(
        e.toString(),
      ));
    }
  }
}