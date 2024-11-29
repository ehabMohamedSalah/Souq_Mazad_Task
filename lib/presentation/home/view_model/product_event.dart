// lib/blocs/product_event.dart
import 'package:e_commerce_task/Domain_layer/entity/product_entity.dart';
import 'package:e_commerce_task/data_layer/model/product_model.dart';

abstract class ProductEvent {}

class FetchProductsEvent extends ProductEvent {}
 class SelectProductEvent extends ProductEvent {
  final ProductEntity product;
  SelectProductEvent(this.product);
}
