// lib/models/product_model.dart
import 'package:e_commerce_task/Domain_layer/entity/product_entity.dart';

class ProductModel {
  final String name;
  final double price;
  final String thumbnail;
  final String imageUrl;
  final String description;

  ProductModel({
    required this.name,
    required this.price,
    required this.thumbnail,
    required this.imageUrl,
    required this.description,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      price: json['price'],
      thumbnail: json['thumbnail'],
      imageUrl: json['imageUrl'],
      description: json['description'],
    );
  }
ProductEntity  toProductEntity(){
    return ProductEntity(
      name: name,
      price:price ,
      description: description,
      imageUrl: imageUrl,
      thumbnail:thumbnail ,
    );
}
}
