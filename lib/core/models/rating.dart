import 'dart:convert';

class Rating {
  final String userId;
  final double rating;

  Rating({required this.userId, required this.rating});

  factory Rating.getNew() {
    return Rating(
      userId: '',
      rating: 0.0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "userId": userId,
      "rating": rating,
    };
  }

  factory Rating.fromMap(Map<String, dynamic> json) {
    return Rating(
      userId: json["userId"] ?? '',
      rating: json['rating']?.toDouble() ?? 0.00,
    );
  }

  String toJson() => json.encode(toMap());

  factory Rating.fromJson(String source) => Rating.fromMap(json.decode(source));
}