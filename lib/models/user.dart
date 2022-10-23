import 'dart:convert';
import 'dart:ffi';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final String id;
  final String name;
  final String number;

  final String email;
  final List<dynamic> address;
  final List<dynamic> orderHistory;
  User({
    required this.id,
    required this.name,
    required this.number,
    required this.email,
    required this.address,
    required this.orderHistory,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'number': number,
      'email': email,
      'address': address,
      'orderHistory': orderHistory,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] as String,
      name: map['name'] as String,
      number: map['phone'] as String,
      email: map['email'] as String,
      address: List<Map<String, dynamic>>.from(
          map['address']?.map((x) => Map<String, dynamic>.from(x))),
      orderHistory: List<dynamic>.from((map['orderHistory'] as List<dynamic>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
