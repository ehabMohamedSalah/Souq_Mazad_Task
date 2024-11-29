import 'package:dartz/dartz.dart';
import '../model/product_model.dart';

abstract class ProductDatasourceContract{
  Future<Either<List<ProductModel>,String>> fetchProducts() ;

}