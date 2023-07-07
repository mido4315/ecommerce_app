import 'package:ecommerce_app/features/admin/admin%20orders/data/repos/admin_orders_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/order.dart';
import '../../../../core/utils/api_service.dart';
import '../../../../core/utils/service_locator.dart';
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