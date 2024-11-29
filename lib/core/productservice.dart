import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

@singleton
class ProductService {

  Future<List<dynamic>> loadProducts() async {
    try {
      final jsonData = await rootBundle.loadString('assets/products.json');
      final List<dynamic> data = json.decode(jsonData);
      return data;
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }
}
