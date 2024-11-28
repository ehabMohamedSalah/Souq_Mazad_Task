import 'package:e_commerce_task/core/adaptive_layout/adaptive_layout.dart';
import 'package:e_commerce_task/presentation/home/Tabs/category_tab/layouts/category_desktop_layout.dart';
import 'package:e_commerce_task/presentation/home/Tabs/category_tab/layouts/category_mobile_layout.dart';
import 'package:e_commerce_task/presentation/home/Tabs/category_tab/layouts/category_tablet_layout.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdaptiveLayout(
        mobileLayout:(context) => CategoryMobileLayout()  ,
        desktopLayout:(context) => CategoryDesktopLayout() ,
        tabletLayout: (context) => CategoryTabletLayout() ,
      ),
    );
  }
}
