import 'package:e_commerce_task/core/adaptive_layout/adaptive_layout.dart';
import 'package:e_commerce_task/data_layer/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  ProductDetailsScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
        mobileLayout:  (context) => ,
        tabletLayout: (context) => ,
        desktopLayout: (context) => ,
    );
  }
}