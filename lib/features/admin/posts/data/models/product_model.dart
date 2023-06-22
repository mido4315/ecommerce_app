import 'dart:convert';

class ProductModel {
  final String name;
  final String description;
  final double price;
  final int quantity;
  final String category;
  final List<String> images;
  String? id;
  String? userId;

  ProductModel({
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    required this.category,
    required this.images,
    required id,
    required userId,
  });

  factory ProductModel.fromMap(Map<String, dynamic> json) {
    return ProductModel(
      name: json["name"],
      description: json["description"],
      price: double.parse(json["price"]),
      quantity: int.parse(json["quantity"]),
      category: json["category"],
      images: List<String>.from(json["images"]),
      id: json["_id"],
      userId: json["userId"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "description": description,
      "price": price,
      "quantity": quantity,
      "category": category,
      "images": jsonEncode(images),
      "id": id,
      "userId": userId,
    };
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String data) {
    return ProductModel.fromMap(json.decode(data));
  }
}