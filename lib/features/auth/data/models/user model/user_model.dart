import 'dart:convert';

class UserModel {
  final String? name;
  final String email;
  final String password;
  final String? address;
  final String? type;
  final String? id;
  final DateTime? createdAt;
  final int? v;
  final String? token;

  UserModel({
    this.name,
    required this.email,
    required this.password,
    this.address,
    this.type,
    this.id,
    this.createdAt,
    this.v,
    this.token,
  });

  factory UserModel.fromMap(Map<String, dynamic> data) => UserModel(
        name: data['name'] as String?,
        email: data['email'] as String,
        password: data['password'] as String,
        address: data['address'] as String?,
        type: data['type'] as String?,
        id: data['_id'] as String?,
        createdAt: data['createdAt'] == null
            ? null
            : DateTime.parse(data['createdAt'] as String),
        v: data['__v'] as int?,
        token: data['token'],
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'email': email,
        'password': password,
        'address': address,
        'type': type,
        '_id': id,
        'createdAt': createdAt?.toIso8601String(),
        '__v': v,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UserModel].
  factory UserModel.fromJson(String data) {
    return UserModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UserModel] to a JSON string.
  String toJson() => json.encode(toMap());
}