

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/service_locator.dart';
import '../../../../auth/data/repos/auth_repo_impl.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  var user =  getIt.get<AuthRepoImpl>().myUserModel;


}