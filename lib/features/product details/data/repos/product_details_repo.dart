import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/core/models/product_model.dart';

abstract class ProductDetailsRepo {
  Future<Either<Failure, void>> rateProduct({
    required ProductModel product,
    required double rating,
  });

  Future<Either<Failure, void>> addProductToCart({
    required ProductModel product,
    required int quantity,
  });

  Future<Either<Failure, void>> deleteFromCart({
    required ProductModel product,
  });
}