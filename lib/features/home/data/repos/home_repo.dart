import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../admin/posts/data/models/product_model.dart';


abstract class HomeRepo {
  Future<Either<Failure, List<ProductModel>>> getSearchedProducts({required String searchString});

}