import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../admin/posts/data/models/product_model.dart';
import '../../../data/repos/categories_repo_impl.dart';

part 'categories_details_state.dart';

class CategoriesDetailsCubit extends Cubit<CategoriesDetailsState> {
  CategoriesDetailsCubit(this.categoriesRepo)
      : super(CategoriesDetailsInitial());

  final CategoriesRepoImpl categoriesRepo;

  Future<void> getProducts({required String category}) async {
    emit(CategoriesDetailsLoading());
    var result = await categoriesRepo.getProducts(category: category);
    result.fold(
      (failure) => emit(
        CategoriesDetailsFailure(failure.errorMessage),
      ),
      (productsList) => emit(
        CategoriesDetailsSuccess(productsList),
      ),
    );
  }
}