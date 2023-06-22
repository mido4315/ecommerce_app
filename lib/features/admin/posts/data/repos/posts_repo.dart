import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';

abstract class PostsRepo {
  Future<Either<Failure, bool>> addProduct({
    required String name,
    required String description,
    required double price,
    required int quantity,
    required String category,
    required List<File> images,
  });
}