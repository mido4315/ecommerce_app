import 'dart:convert';

import 'rating.dart';

class ProductModel {
  final String name;
  final String description;
  final double price;
  final int quantity;
  final String category;
  final List<String> images;
  String? id;
  String? userId;
  final List<Rating>? rating;
  double? selQty;

  ProductModel({
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    required this.category,
    required this.images,
    this.id,
    this.userId,
    this.rating,
    this.selQty
  });

  factory ProductModel.fromMap(Map<String, dynamic> json) {
    return ProductModel(
      name: json["name"],
      description: json["description"],
      price: double.parse(json["price"].toString()),
      quantity: int.parse(json["qty"].toString()),
      category: json["category"],
      images: List<String>.from(json["images"]),
      id: json["_id"],
      userId: json["userId"],
      rating: json['rating'] != null
          ? List<Rating>.from(
              json['rating']?.map(
                (x) => Rating.fromMap(x),
              ),
            )
          : null,
      selQty: json['selQty']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "description": description,
      "price": price,
      "qty": quantity,
      "category": category,
      "images": images,
      "_id": id,
      "userId": userId,
      "rating": rating,
      "selQty":selQty
    };
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String data) {
    return ProductModel.fromMap(json.decode(data));
  }
}