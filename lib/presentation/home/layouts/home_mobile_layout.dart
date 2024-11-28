import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:e_commerce_task/presentation/home/Tabs/ProductList_tab/ProductList_screen.dart';
import 'package:e_commerce_task/presentation/home/Tabs/category_tab/category_screen.dart';
import 'package:e_commerce_task/presentation/home/Tabs/favorite_tab/favorite_screen.dart';
 import 'package:flutter/material.dart';

import '../../../core/utilis/color_manager.dart';


class HomeMobileLayout extends StatefulWidget {
  const HomeMobileLayout({super.key});

  @override
  State<HomeMobileLayout> createState() => _HomeMobileLayoutState();
}
int _currentIndex = 0;

// List of widgets corresponding to each item in the CurvedNavigationBar
final List<Widget> _pages = [
  ProductListScreen(),
  CategoryScreen(),
  FavoriteScreen(),


];
class _HomeMobileLayoutState extends State<HomeMobileLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  ColorManager.primaryColor,
      bottomNavigationBar: CurvedNavigationBar(
        index: 0,
        backgroundColor:   ColorManager.white,
        color:  ColorManager.secondaryColor,
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.category_rounded, size: 30),
          Icon(Icons.favorite, size: 30),
        ],
        onTap: (index) {
          //Handle button tap
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: _pages[_currentIndex],
      //
    );
  }
}
