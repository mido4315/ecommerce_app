import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failure.dart';

abstract class AnalyticsRepo {
  Future<Either<Failure, Map<String, dynamic>>> getTotalSales();
}