part of 'admin_orders_cubit.dart';

abstract class AdminOrdersState {}

class AdminOrdersInitial extends AdminOrdersState {}

class AdminOrdersLoading extends AdminOrdersState {}

class AdminOrdersSuccess extends AdminOrdersState {
  final List<OrderModel> orders;

  AdminOrdersSuccess(this.orders);
}

class AdminOrdersFailure extends AdminOrdersState {
  final String errorMessage;

  AdminOrdersFailure(this.errorMessage);
}