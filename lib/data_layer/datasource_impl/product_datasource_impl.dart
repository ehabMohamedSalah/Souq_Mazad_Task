import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_task/data_layer/datasource_contract/product_datasource_contract.dart';
import 'package:e_commerce_task/data_layer/model/product_model.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import '../../core/productservice.dart';

@Injectable(as: ProductDatasourceContract)
class ProductDatasourceImpl extends ProductDatasourceContract {
    ProductService productService;
      @factoryMethod
  ProductDatasourceImpl(this.productService);

  @override
  Future<Either<List<ProductModel>, String>> fetchProducts() async {
    try {
      final jsonData = await productService.loadProducts();
      final productsModel = jsonData.map((item) => ProductModel.fromJson(item)).toList();
      return left(productsModel);
    } catch (error) {
      return right(error.toString());
    }
  }
}
