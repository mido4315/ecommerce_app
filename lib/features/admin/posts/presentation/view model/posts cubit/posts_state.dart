part of 'posts_cubit.dart';

abstract class PostsState {}

class PostsInitial extends PostsState {}

class PostsLoading extends PostsState {}

class PostsSuccess extends PostsState {
  PostsSuccess(this.productsList);

  List<ProductModel> productsList;
}

class PostsFailure extends PostsState {
  PostsFailure(this.errorMessage);

  final String errorMessage;
}