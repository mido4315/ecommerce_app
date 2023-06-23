import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/product_model.dart';
import '../../../data/repos/posts_repo_impl.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit(this.postsRepo) : super(PostsInitial());
  final PostsRepoImpl postsRepo;

  Future<void> getProducts() async {
    emit(PostsLoading());
    var result = await postsRepo.getProducts();
    result.fold(
      (failure) => emit(
        PostsFailure(failure.errorMessage),
      ),
      (productsList) => emit(
        PostsSuccess(productsList),
      ),
    );
  }
}