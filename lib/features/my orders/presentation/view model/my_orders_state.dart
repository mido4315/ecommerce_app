part of 'my_orders_cubit.dart';

abstract class MyOrdersState {}

class MyOrdersInitial extends MyOrdersState {}

class MyOrdersLoading extends MyOrdersState {}

class MyOrdersSuccess extends MyOrdersState {
  final List<OrderModel> myOrders;

  MyOrdersSuccess(this.myOrders);
}

class MyOrdersFailure extends MyOrdersState {
  final String errorMessage;

  MyOrdersFailure(this.errorMessage);
}