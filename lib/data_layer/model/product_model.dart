// lib/models/product_model.dart
class Product {
  final String name;
  final double price;
  final String thumbnail;
  final String imageUrl;
  final String description;

  Product({
    required this.name,
    required this.price,
    required this.thumbnail,
    required this.imageUrl,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      price: json['price'],
      thumbnail: json['thumbnail'],
      imageUrl: json['imageUrl'],
      description: json['description'],
    );
  }
}
