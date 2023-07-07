import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/models/order.dart';
import '../../data/repos/admin_orders_repo.dart';

part 'admin_orders_state.dart';

class AdminOrdersCubit extends Cubit<AdminOrdersState> {
  AdminOrdersCubit(this.adminOrdersRepo) : super(AdminOrdersInitial());

  final AdminOrdersRepo adminOrdersRepo;

  Future<void> getOrders() async {
    var result = await adminOrdersRepo.getOrders();

    result.fold(
      (failure) => emit(
        AdminOrdersFailure(
          failure.errorMessage,
        ),
      ),
      (orderList) => emit(
        AdminOrdersSuccess(orderList),
      ),
    );
  }
}