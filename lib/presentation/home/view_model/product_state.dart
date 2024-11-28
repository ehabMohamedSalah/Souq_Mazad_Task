// lib/blocs/product_state.dart
import 'package:e_commerce_task/data_layer/model/product_model.dart';


abstract class ProductState {}

class ProductLoadingState extends ProductState {}
class ProductLoadedState extends ProductState {
  final List<Product> products;
  final bool hasMore;
  ProductLoadedState(this.products, this.hasMore);
}
class ProductDetailsState extends ProductState {
  final Product product;
  ProductDetailsState(this.product);
}
class ProductErrorState extends ProductState {
  final String message;
  ProductErrorState(this.message);
}
