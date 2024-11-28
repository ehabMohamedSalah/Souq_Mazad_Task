import 'dart:convert';
import 'package:flutter/services.dart';
import '../model/product_model.dart';

class ProductRepository {
  Future<List<Product>> fetchProducts() async {
    final jsonData = await rootBundle.loadString('assets/products.json');
    final List<dynamic> data = json.decode(jsonData);
    return data.map((item) => Product.fromJson(item)).toList();
  }
}
