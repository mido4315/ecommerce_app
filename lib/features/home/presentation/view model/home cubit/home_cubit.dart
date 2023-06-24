import 'package:ecommerce_app/features/home/data/repos/home_repo_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../admin/posts/data/models/product_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());

  final HomeRepoImpl homeRepo;

  Future<void> getSearchedProducts({required String searchString}) async {
    emit(HomeLoading());
    var result = await homeRepo.getSearchedProducts(searchString: searchString);
    result.fold(
      (failure) => emit(
        HomeFailure(failure.errorMessage),
      ),
      (productsList) => emit(
        HomeSuccess(productsList),
      ),
    );
  }
}