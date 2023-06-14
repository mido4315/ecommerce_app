import 'package:ecommerce_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authRepo) : super(RegisterInitial());

  final AuthRepoImpl authRepo;

  Future<void> userRegister({
    required String name,
    required String email,
    required String password,
    required String phoneNumber,
  }) async {
    var result = await authRepo.userRegister(
      name: name,
      email: email,
      password: password,
      phoneNumber: phoneNumber,
    );
    result.fold(
      (failure) => emit(
        RegisterFailure(failure.errorMessage),
      ),
      (user) => emit(
        RegisterSuccess(),
      ),
    );
  }
}