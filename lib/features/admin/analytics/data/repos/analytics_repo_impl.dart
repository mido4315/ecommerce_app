import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/core/utils/api_service.dart';
import 'package:ecommerce_app/features/admin/analytics/data/models/sales_model.dart';

import '../../../../../core/utils/service_locator.dart';
import '../../../../auth/data/repos/auth_repo_impl.dart';
import 'analytics_repo.dart';

class AnalyticsRepoImpl extends AnalyticsRepo {
  AnalyticsRepoImpl(this.apiService);

  final APIService apiService;

  // get the admin token
  final String _token = getIt.get<AuthRepoImpl>().myUserModel.token!;

  // create headers
  Map<String, String> get _headers => {
        'Content-Type': 'application/json; charset=utf-8',
        'my-souq-auth-token': _token
      };

  @override
  Future<Either<Failure, Map<String, dynamic>>> getTotalSales() async {
    List<Sales> sales = [];
    double totalSales = 0;
    double totalOrders = 0;
    double totalProducts = 0;
    try {
      var result = await apiService.get(
        path: '/admin/analytics',
        headers: _headers,
      );
      totalSales = double.parse(result['totalSales'].toString());
      totalOrders = double.parse(result['totalOrders'].toString()) ;
      totalProducts = double.parse(result['totalProducts'].toString());
      sales = [
        Sales(
            label: 'Laptops',
            totalSale: double.parse(result['catMobiles'].toString()) ),
        Sales(
            label: 'Rams',
            totalSale: double.parse(result['catComputers'].toString())),
        Sales(
            label: 'Cables',
            totalSale: double.parse(result['catEssentials'].toString())),
        Sales(
            label: 'GPUs',
            totalSale: double.parse(result['catAppliances'].toString()) ),
        Sales(
            label: 'HDDs',
            totalSale: double.parse(result['catFashion'].toString()) ),
      ];
      return right(
        {
          'sales': sales,
          'totalSales': totalSales,
          'totalOrders': totalOrders,
          'totalProducts': totalProducts,
        },
      );
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(e.toString()),
      );
    }
  }
}