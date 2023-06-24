import 'dart:convert';
import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/utils/service_locator.dart';
import 'package:ecommerce_app/features/admin/posts/data/models/product_model.dart';
import 'package:ecommerce_app/features/auth/data/repos/auth_repo_impl.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/utils/api_service.dart';
import 'posts_repo.dart';

class PostsRepoImpl implements PostsRepo {
  PostsRepoImpl(this.apiService);

  APIService apiService;

  // get the admin token
  final String token = getIt.get<AuthRepoImpl>().myUserModel.token!;

  // create headers
  Map<String, String> get headers => {
        'Content-Type': 'application/json; charset=utf-8',
        'my-souq-auth-token': token
      };

  @override
  Future<Either<Failure, List<ProductModel>>> getProducts() async {
    List<ProductModel> productsList = [];

    try {
      // make a post request to the server
      List<dynamic> result = await apiService.getList(
        path: '/admin/get-products',
        headers: headers,
      );
      for (int i = 0; i < result.length; i++) {
        productsList.add(ProductModel.fromMap(result[i]));
      }
      return Right(productsList);
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

  @override
  Future<Either<Failure, ProductModel>> addProduct({
    required String name,
    required String description,
    required double price,
    required int quantity,
    required String category,
    required List<File> images,
  }) async {
    try {
      // use cloudinary to save images and take its link to add to the database
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

      // create the product model body to send to server
      ProductModel productModel = ProductModel(
        name: name,
        description: description,
        price: price,
        quantity: quantity,
        category: category,
        images: productImages,
      );

      // make a post request to the server
      Map<String, dynamic> result = await apiService.post(
        path: '/admin/add-product',
        headers: headers,
        data: productModel.toJson(),
      );

      return Right(ProductModel.fromMap(result));
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

  @override
  Future<void> deleteProduct(String productId) async {
    try {
      // make a post request to the server
      var result = await apiService.post(
        path: '/admin/delete-products',
        headers: headers,
        data: json.encode({'id': productId}),
      );
    } catch (e) {
      if (e is DioException) {
        Left(
          ServerFailure.fromDioError(e),
        );
      }
      left(ServerFailure(
        e.toString(),
      ));
    }
  }
}