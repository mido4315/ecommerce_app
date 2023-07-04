part of 'cart_cubit.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class ShowCartItems extends CartState {}

class CartQuantityChanges extends CartState {}

class OrderHasBeenCreated extends CartState {}
class OrderHasNotBeenCreated extends CartState {
  final String errorMessage;

  OrderHasNotBeenCreated(this.errorMessage);
}