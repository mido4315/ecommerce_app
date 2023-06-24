part of 'add_new_product_cubit.dart';

abstract class AddNewProductState {}

class AddNewProductInitial extends AddNewProductState {}

class AddNewProductLoading extends AddNewProductState {}
class AddNewProductSuccess extends AddNewProductState {}
class AddNewProductFailure extends AddNewProductState {
  AddNewProductFailure(this.errorMessage);
  final String errorMessage;
}