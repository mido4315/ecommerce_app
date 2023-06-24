part of 'categories_details_cubit.dart';

abstract class CategoriesDetailsState {}

class CategoriesDetailsInitial extends CategoriesDetailsState {}

class CategoriesDetailsLoading extends CategoriesDetailsState {}

class CategoriesDetailsSuccess extends CategoriesDetailsState {
 final List<ProductModel> products;

  CategoriesDetailsSuccess(this.products);
}

class CategoriesDetailsFailure extends CategoriesDetailsState {
  final String errorMessage;

  CategoriesDetailsFailure(this.errorMessage);
}