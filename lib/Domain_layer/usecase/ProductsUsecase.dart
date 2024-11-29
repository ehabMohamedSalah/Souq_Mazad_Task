
import 'package:dartz/dartz.dart';
import 'package:e_commerce_task/Domain_layer/repo_contract/product_repo_contract.dart';
import 'package:injectable/injectable.dart';

import '../entity/product_entity.dart';

@injectable
class ProductsUsecase{
  ProductRepoContract productRepo;
  @factoryMethod
  ProductsUsecase(this.productRepo);

  Future<Either<List<ProductEntity>, String>> call(){
    return productRepo.fetchProducts();
  }

}