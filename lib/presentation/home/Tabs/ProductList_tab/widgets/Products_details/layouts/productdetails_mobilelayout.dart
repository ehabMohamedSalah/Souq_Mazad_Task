import 'package:e_commerce_task/data_layer/model/product_model.dart';
import 'package:e_commerce_task/presentation/home/Tabs/ProductList_tab/ProductList_screen.dart';
import 'package:flutter/material.dart';

class ProudctDetailsMobileLayout extends StatelessWidget {
  final ProductModel product;
  ProudctDetailsMobileLayout({required this.product});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

          title: Text(product.name),
       ),

    );
  }
}