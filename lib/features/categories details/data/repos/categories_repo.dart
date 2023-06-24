import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../admin/posts/data/models/product_model.dart';

abstract class CategoriesRepo {
  Future<Either<Failure, List<ProductModel>>> getProducts({required String category});

}