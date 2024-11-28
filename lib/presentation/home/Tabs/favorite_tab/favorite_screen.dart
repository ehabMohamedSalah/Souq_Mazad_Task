import 'package:e_commerce_task/core/adaptive_layout/adaptive_layout.dart';
import 'package:e_commerce_task/presentation/home/Tabs/favorite_tab/layouts/favorite_desktop_layout.dart';
import 'package:e_commerce_task/presentation/home/Tabs/favorite_tab/layouts/favorite_mobile_layout.dart';
import 'package:e_commerce_task/presentation/home/Tabs/favorite_tab/layouts/favorite_tablet_layout.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
        mobileLayout:  (context) => FavoriteMobileLayout(),
        tabletLayout: (context) => FavoriteTabletLayout(),
        desktopLayout:(context) => FavoriteDesktopLayout(),
    );
  }
}
