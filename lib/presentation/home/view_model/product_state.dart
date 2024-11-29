// lib/blocs/product_state.dart
import 'package:e_commerce_task/Domain_layer/entity/product_entity.dart';
import 'package:e_commerce_task/data_layer/model/product_model.dart';


abstract class ProductState {}

class ProductLoadingState extends ProductState {}
class ProductLoadedState extends ProductState {
  final List<ProductEntity> products;

  ProductLoadedState(this.products,  );
}
class ProductDetailsState extends ProductState {
  final ProductEntity product;
  ProductDetailsState(this.product);
}
class ProductErrorState extends ProductState {
  final String message;
  ProductErrorState(this.message);
}
