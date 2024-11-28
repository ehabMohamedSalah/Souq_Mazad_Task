

import 'package:e_commerce_task/core/adaptive_layout/adaptive_layout.dart';
import 'package:e_commerce_task/presentation/home/Tabs/ProductList_tab/layouts/HomeTab_DesktopLayout.dart';
import 'package:e_commerce_task/presentation/home/Tabs/ProductList_tab/layouts/HomeTab_TabletLayout.dart';
import 'package:e_commerce_task/presentation/home/Tabs/ProductList_tab/layouts/ProductList_MobileLaayout.dart';
 import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  AdaptiveLayout(
        mobileLayout:  (context) =>  ProductListMobileLayout(),
        tabletLayout: (context) => ProductListTabletLayout(),
        desktopLayout:(context) => ProductListDesktopLayout(),

    );
  }
}
