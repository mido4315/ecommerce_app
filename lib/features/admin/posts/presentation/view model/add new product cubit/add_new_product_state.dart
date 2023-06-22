part of 'add_new_product_cubit.dart';

abstract class PostsState {}

class PostsInitial extends PostsState {}

class PostsSuccess extends PostsState {}
class PostsFailure extends PostsState {
  PostsFailure(this.errorMessage);
  final String errorMessage;
}