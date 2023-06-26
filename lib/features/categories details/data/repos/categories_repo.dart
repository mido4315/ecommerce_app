import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/models/product_model.dart';

abstract class CategoriesRepo {
  Future<Either<Failure, List<ProductModel>>> getProducts({required String category});

}