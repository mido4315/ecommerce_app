import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/auth/data/models/user%20model/user_model.dart';
import '../../../../core/errors/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserModel>> userRegister({
    required String name,
    required String email,
    required String password,
    required String phoneNumber,
});
  Future<Either<Failure, UserModel>> userLogin();
}