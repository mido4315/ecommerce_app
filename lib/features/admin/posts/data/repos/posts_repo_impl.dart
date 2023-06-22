import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/utils/api_service.dart';
import 'posts_repo.dart';

class PostsRepoImpl implements PostsRepo {
  PostsRepoImpl(this.apiService);

  APIService apiService;

  @override
  Future<Either<Failure, bool>> addProduct({
    required String name,
    required String description,
    required double price,
    required int quantity,
    required String category,
    required List<File> images,
  }) async {
    try {
      final cloud = CloudinaryPublic('dfazlwkze', 'e7paevkr');
      List<String> productImages = [];
      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloud.uploadFile(
          CloudinaryFile.fromFile(
            images[i].path,
            folder: category,
          ),
        );
        productImages.add(res.secureUrl);
      }
      apiService.post(
        path: 'products',
      );
      return const Right(true);
    } catch (e) {
      if (e is DioException) {
        return Left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(ServerFailure(
        e.toString(),
      ));
    }
  }
}