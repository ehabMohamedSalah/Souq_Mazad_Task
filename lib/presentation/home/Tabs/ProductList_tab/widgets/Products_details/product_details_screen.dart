import 'package:e_commerce_task/Domain_layer/entity/product_entity.dart';
import 'package:e_commerce_task/core/adaptive_layout/adaptive_layout.dart';
import 'package:e_commerce_task/data_layer/model/product_model.dart';
import 'package:e_commerce_task/presentation/home/Tabs/ProductList_tab/widgets/Products_details/layouts/productdetails_mobilelayout.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'layouts/prodctDetails_tabletlayout.dart';
import 'layouts/productDetails_desktoplayout.dart';
 class ProductDetailsScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
      ProductEntity products = ModalRoute
          .of(context)
          ?.settings
          .arguments as ProductEntity;
    return AdaptiveLayout(
        mobileLayout:  (context) => ProudctDetailsMobileLayout(product: products,),
        tabletLayout: (context) => ProductDetailsTabletLayout(  ),
        desktopLayout: (context) =>ProductDetailsDesktopLayout(  ) ,
    );
  }
}