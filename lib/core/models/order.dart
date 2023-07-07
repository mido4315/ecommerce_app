import 'dart:convert';

import 'product_model.dart';

class OrderModel {
  final String id;
  final List<ProductModel> products;
  final String address;
  final String userId;
  final int orderedAt;
   int status;
  final String paymentMethod;
  final double totalPrice;

  OrderModel({required this.id, required this.products, required this.address,
    required this.userId, required this.orderedAt,
    required this.status, required this.paymentMethod, required this.totalPrice});

  factory OrderModel.getNewEmpty() {
    return OrderModel(
      id:  '',
      products: [],
      address: '',
      userId:  '',
      orderedAt: 0,
      status: 0,
      paymentMethod: '',
      totalPrice: 0
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "products": products,
      "address": address,
      "userId": userId,
      "orderedAt": orderedAt,
      "status": status,
      "paymentMethod": paymentMethod,
      "totalPrice": totalPrice
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> json) {
    return OrderModel(
      id: json["_id"] ?? '',
      products: List<ProductModel>.from(
        json['products']?.map(
              (x) {
                var product = ProductModel.fromMap(x['product']);
                product.selQty = x['qty']?.toDouble() ?? 0;
                return product;
              },
        ),
      )	,
      address: json["address"] ?? '',
      userId: json["userId"]?? '' ,
      orderedAt: json["orderTime"] ?? 0,
      status: json["status"] ?? 0,
      paymentMethod: json["paymentMethod"] ?? '',
      totalPrice: json["totalPrice"]?.toDouble() ?? 0.0
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) => OrderModel.fromMap(json.decode(source));
}