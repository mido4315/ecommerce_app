import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/models/order.dart';

abstract class MyOrdersRepo {
  Future<Either<Failure, List<OrderModel>>> getOrders();
}