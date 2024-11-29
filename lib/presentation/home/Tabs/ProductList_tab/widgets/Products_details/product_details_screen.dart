import 'package:e_commerce_task/core/adaptive_layout/adaptive_layout.dart';
import 'package:e_commerce_task/data_layer/model/product_model.dart';
import 'package:e_commerce_task/presentation/home/Tabs/ProductList_tab/widgets/Products_details/layouts/productdetails_mobilelayout.dart';
import 'package:flutter/material.dart';

import 'layouts/prodctDetails_tabletlayout.dart';
import 'layouts/productDetails_desktoplayout.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel product;

  ProductDetailsScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
        mobileLayout:  (context) => ProudctDetailsMobileLayout(product: product,),
        tabletLayout: (context) => ProductDetailsTabletLayout(  ),
        desktopLayout: (context) =>ProductDetailsDesktopLayout(  ) ,
    );
  }
}