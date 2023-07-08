import 'package:ecommerce_app/features/admin/analytics/data/repos/analytics_repo.dart';
import 'package:ecommerce_app/features/admin/analytics/data/repos/analytics_repo_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/sales_model.dart';

part 'analytics_state.dart';

class AnalyticsCubit extends Cubit<AnalyticsState> {
  AnalyticsCubit(this.analyticsRepo) : super(AnalyticsInitial());

  final AnalyticsRepoImpl analyticsRepo;

  int tabTextIndexSelected = 2;


  getTotalSales() async {
    emit(AnalyticsLoading());
    var result = await analyticsRepo.getTotalSales();

    result.fold(
      (failure) => emit(
        AnalyticsFailure(
          failure.errorMessage,
        ),
      ),
      (sales) => emit(
        AnalyticsSuccess(
          sales: sales['sales'],
          totalSales: sales['totalSales'],
          totalOrders: sales['totalOrders'],
          totalProducts: sales['totalProducts'],
        ),
      ),
    );
  }
}