// lib/blocs/product_event.dart
import 'package:e_commerce_task/data_layer/model/product_model.dart';

abstract class ProductEvent {}

class FetchProductsEvent extends ProductEvent {}
class FetchMoreProductsEvent extends ProductEvent {}
class SelectProductEvent extends ProductEvent {
  final Product product;
  SelectProductEvent(this.product);
}
