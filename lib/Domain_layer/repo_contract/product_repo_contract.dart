
import 'package:dartz/dartz.dart';
import 'package:e_commerce_task/Domain_layer/entity/product_entity.dart';

abstract class ProductRepoContract{
  Future<Either<List<ProductEntity>,String>> fetchProducts() ;

}