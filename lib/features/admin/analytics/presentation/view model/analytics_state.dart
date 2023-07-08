part of 'analytics_cubit.dart';

abstract class AnalyticsState {}

class AnalyticsInitial extends AnalyticsState {}

class AnalyticsLoading extends AnalyticsState {}

class AnalyticsSuccess extends AnalyticsState {
  final List<Sales>? sales;
  final double? totalSales;
  final double? totalOrders;
  final double? totalProducts;

  AnalyticsSuccess({
    required this.sales,
    required this.totalSales,
    required this.totalOrders,
    required this.totalProducts,
  });
}

class AnalyticsFailure extends AnalyticsState {
  final String errorMessage;

  AnalyticsFailure(this.errorMessage);
}