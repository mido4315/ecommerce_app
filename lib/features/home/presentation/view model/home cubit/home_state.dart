part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<ProductModel> bestProducts;

  HomeSuccess(this.bestProducts);
}
class HomeFailure extends HomeState {
  final String errorMessage;

  HomeFailure(this.errorMessage);
}

class SearchSuccess extends HomeState {
  final List<ProductModel> searchedProducts;

  SearchSuccess(this.searchedProducts);
}

class SearchFailure extends HomeState {
  final String errorMessage;

  SearchFailure(this.errorMessage);
}