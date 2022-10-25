import 'dart:convert';
import 'dart:io';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  final String name;
  final String description;
  // final String richDescription;
  final List<String> images;
  final String brand;
  final double price;
  final String category;
  final double countInStock;
  // final int rating;
  // final int numReviews;
  // final bool isFeatured;
  final String? id;
  Product({
    required this.name,
    required this.description,
    required this.images,
    required this.brand,
    required this.price,
    required this.category,
    required this.countInStock,
    // required this.rating,
    // required this.numReviews,
    // required this.isFeatured,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'images': images,
      'brand': brand,
      'price': price,
      'category': category,
      'countInStock': countInStock,
      // 'rating': rating,
      // 'numReviews': numReviews,
      // 'isFeatured': isFeatured,
      'id': id,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] as String,
      description: map['description'] as String,
      images: List<String>.from((map['images'] as List<String>)),
      brand: map['brand'] as String,
      price: map['price'] as double,
      category: map['category'] as String,
      countInStock: map['countInStock'] as double,
      // rating: map['rating'] as int,
      // numReviews: map['numReviews'] as int,
      // isFeatured: map['isFeatured'] as bool,
      id: map['_id'] != null ? map['_id'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
