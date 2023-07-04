import 'dart:convert';

class UserModel {
  final String? name;
  final String email;
  final String password;
  String? address;
  final String? type;
  final String? id;
  final DateTime? createdAt;
  final int? v;
  final String? token;
  List<dynamic>? cart;

  UserModel(
      {this.name,
      required this.email,
      required this.password,
      this.address,
      this.type,
      this.id,
      this.createdAt,
      this.v,
      this.token,
       this.cart});

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
        cart: List<Map<String, dynamic>>.from(
          data['cart']?.map(
            (x) => Map<String, dynamic>.from(x),
          ),
        ),
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'email': email,
        'password': password,
        'address': address,
        'type': type,
        '_id': id,
        "cart": cart,
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

  UserModel copyWith({
    String? id,
    String? name,
    String? password,
    String? email,
    String? address,
    String? type,
    String? token,
    List<dynamic>? cart,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      password: password ?? this.password,
      email: email ?? this.email,
      address: address ?? this.password,
      type: type ?? this.type,
      token: token ?? this.token,
      cart: cart ?? this.cart,
    );
  }
}