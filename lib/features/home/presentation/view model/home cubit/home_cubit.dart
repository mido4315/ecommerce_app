import 'package:ecommerce_app/features/home/data/repos/home_repo_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/models/product_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());

  final HomeRepoImpl homeRepo;

  Future<void> getSearchedProducts({required String searchString}) async {
    var result = await homeRepo.getSearchedProducts(searchString: searchString);
    result.fold(
      (failure) => emit(
        SearchFailure(failure.errorMessage),
      ),
      (productsList) => emit(
        SearchSuccess(productsList),
      ),
    );
  }

  Future<void> getBestProducts() async {
    emit(HomeLoading());
    var result = await homeRepo.getBestProducts();
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