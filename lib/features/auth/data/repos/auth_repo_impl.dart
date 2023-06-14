import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/core/utils/api_service.dart';

import 'package:ecommerce_app/features/auth/data/models/user%20model/user_model.dart';

import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  AuthRepoImpl(this.apiService);

  APIService apiService;

  @override
  Future<Either<Failure, UserModel>> userRegister({
    required String name,
    required String email,
    required String password,
    required String phoneNumber,
  }) async {
    try {
      UserModel data = UserModel(
        name: name,
        email: email,
        password: password,
        phoneNumber: phoneNumber,
      );
      var result = await apiService.post(path: '/api/signup', data: data.toJson());
      UserModel user = UserModel.fromMap(result);
      return Right(user);
    } catch (e) {
      if (e is DioException) {
        return Left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(ServerFailure(
        e.toString(),
      ));
    }
  }

  @override
  Future<Either<Failure, UserModel>> userLogin() {
    // TODO: implement userLogin
    throw UnimplementedError();
  }
}