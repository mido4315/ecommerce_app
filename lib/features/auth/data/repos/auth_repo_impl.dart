
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/core/models/user_model.dart';
import 'package:ecommerce_app/core/utils/api_service.dart';
import 'package:ecommerce_app/core/utils/service_locator.dart';
import 'package:ecommerce_app/core/utils/shared_preferences.dart';

import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  AuthRepoImpl(this.apiService);

  APIService apiService;
  late UserModel myUserModel;

  @override
  Future<Either<Failure, UserModel>> userRegister({
    required String name,
    required String email,
    required String password,
    required String address,
  }) async {
    try {
      UserModel data = UserModel(
        name: name,
        email: email,
        password: password,
        address: address,
      );
      var result =
          await apiService.post(path: '/api/signup', data: data.toJson());
      UserModel user = UserModel.fromMap(result);
      myUserModel = user;
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
  Future<Either<Failure, UserModel>> userLogin({
    required String email,
    required String password,
  }) async {
    try {
      UserModel data = UserModel(
        email: email,
        password: password,
      );
      var result =
          await apiService.post(path: '/api/signin', data: data.toJson());
      UserModel user = UserModel.fromMap(result);
      getIt.get<SharedPrefs>().setData(key: 'token', value: user.token);

      //______________________________________saving user data with shard preferences
      // List<String> userArgs = [
      //   user.name!,
      //   user.email,
      //   user.address!,
      //   user.type!,
      //   user.token!,
      // ];
      // getIt.get<SharedPrefs>().setData(key: 'user', value: userArgs);
      myUserModel = user;
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

//______________________________________get user data every time the app opens and check his token
  @override
  Future<void> getUserData() async {
    try {
      String token = getIt.get<SharedPrefs>().getData(key: 'token');
      final Map<String, String> headers = {
        'Content-Type': 'application/json; charset=utf-8',
        'my-souq-auth-token': token
      };
      Response result = await apiService.isValidToken(
        headers: headers,
      );
      if (result.data == true) {
        var userResult = await apiService.get(
          path: "/",
          headers: headers,
        );
        myUserModel = UserModel.fromMap(userResult);
      }
    } catch (e) {
      print(e);
    }
  }
}