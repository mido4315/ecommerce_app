import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/admin/posts/data/models/product_model.dart';

import '../../../../../core/errors/failure.dart';

abstract class PostsRepo {
  Future<Either<Failure, ProductModel>> addProduct({
    required String name,
    required String description,
    required double price,
    required int quantity,
    required String category,
    required List<File> images,
  });
  Future<Either<Failure, List<ProductModel>>> getProducts();
}