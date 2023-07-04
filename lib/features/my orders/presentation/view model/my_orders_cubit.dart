import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/order.dart';
import '../../data/repos/my_orders_repo_impl.dart';

part 'my_orders_state.dart';

class MyOrdersCubit extends Cubit<MyOrdersState> {
  MyOrdersCubit(this.myOrdersRepo) : super(MyOrdersInitial());

  final MyOrdersRepoImpl myOrdersRepo;

  Future<void> getOrders() async {
    var result = await myOrdersRepo.getOrders();

    result.fold(
      (failure) => emit(
        MyOrdersFailure(
          failure.errorMessage,
        ),
      ),
      (orderList) => emit(
        MyOrdersSuccess(orderList),
      ),
    );
  }
}