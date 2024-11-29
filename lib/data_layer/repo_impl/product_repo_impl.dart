import 'package:dartz/dartz.dart';
import 'package:e_commerce_task/Domain_layer/entity/product_entity.dart';
import 'package:e_commerce_task/Domain_layer/repo_contract/product_repo_contract.dart';
import 'package:injectable/injectable.dart';

import '../datasource_contract/product_datasource_contract.dart';

@Injectable(as: ProductRepoContract)
class ProductRepoImpl extends ProductRepoContract{
  ProductDatasourceContract productDatasource;
  ProductRepoImpl(this.productDatasource);
  @override
  Future<Either<List<ProductEntity>, String>> fetchProducts() async{
    var response=await productDatasource.fetchProducts();

    return response.fold(
            (productsModel) {
              var  ProductsEntity=productsModel.map((product) => product.toProductEntity()).toList();
              return left(ProductsEntity);
            },
            (error) {
              return right(error.toString());
            }
    );
  }
}