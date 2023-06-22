import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/posts_repo_impl.dart';

part 'add_new_product_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit(this.postsRepo) : super(PostsInitial());

  final PostsRepoImpl postsRepo;


  Future<void> getProducts({
    required String name,
    required String description,
    required double price,
    required int quantity,
    required String category,
    required List<File> images,
  }) async {
    var result = await postsRepo.getProducts();
    result.fold(
          (failure) => emit(
        PostsFailure(failure.errorMessage),
      ),
          (r) => emit(
        PostsSuccess(),
      ),
    );
  }

  Future<void> addProduct({
    required String name,
    required String description,
    required double price,
    required int quantity,
    required String category,
    required List<File> images,
  }) async {
    var result = await postsRepo.addProduct(
        name: name,
        description: description,
        price: price,
        quantity: quantity,
        category: category,
        images: images);
    result.fold(
      (failure) => emit(
        PostsFailure(failure.errorMessage),
      ),
      (r) => emit(
        PostsSuccess(),
      ),
    );
  }
}