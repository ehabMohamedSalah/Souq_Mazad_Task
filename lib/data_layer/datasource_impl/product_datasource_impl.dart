import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:e_commerce_task/data_layer/datasource_contract/product_datasource_contract.dart';
import 'package:e_commerce_task/data_layer/model/product_model.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductDatasourceContract)
class ProductDatasourceImpl extends ProductDatasourceContract{

  @override
  Future<Either<List<ProductModel>,String>> fetchProducts() async {
    try{
      final jsonData = await rootBundle.loadString('assets/products.json'); //hbd2 a2ra file mn al root
      final List<dynamic> data = json.decode(jsonData);
      final productsModel=data.map((item) => ProductModel.fromJson(item)).toList();//b7wl al data le list of object
      return left (productsModel);
    }catch(error){
      return Right(error.toString());
    }
  }

}