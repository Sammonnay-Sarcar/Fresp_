import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class product {
  final String name;
  final String description;
  final String richDescription;
  final String image;
  final String brand;
  final int price;
  final String category;
  final int countInStock;
  final int rating;
  final int numReviews;
  final bool isFeatured;
  final String id;
  product({
    required this.name,
    required this.description,
    required this.richDescription,
    required this.image,
    required this.brand,
    required this.price,
    required this.category,
    required this.countInStock,
    required this.rating,
    required this.numReviews,
    required this.isFeatured,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'richDescription': richDescription,
      'image': image,
      'brand': brand,
      'price': price,
      'category': category,
      'countInStock': countInStock,
      'rating': rating,
      'numReviews': numReviews,
      'isFeatured': isFeatured,
      'id': id,
    };
  }

  factory product.fromMap(Map<String, dynamic> map) {
    return product(
      name: map['name'] as String,
      description: map['description'] as String,
      richDescription: map['richDescription'] as String,
      image: map['image'] as String,
      brand: map['brand'] as String,
      price: map['price'] as int,
      category: map['category'] as String,
      countInStock: map['countInStock'] as int,
      rating: map['rating'] as int,
      numReviews: map['numReviews'] as int,
      isFeatured: map['isFeatured'] as bool,
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory product.fromJson(String source) =>
      product.fromMap(json.decode(source) as Map<String, dynamic>);
}
