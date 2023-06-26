import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/models/user_model.dart';

import '../../../../core/errors/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserModel>> userRegister({
    required String name,
    required String email,
    required String password,
    required String address,
});
  Future<Either<Failure, UserModel>> userLogin({
    required String email,
    required String password,
});
  Future<void> getUserData();
}