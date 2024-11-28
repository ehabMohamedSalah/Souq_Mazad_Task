import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../../core/utilis/color_manager.dart';


class HomeMobileLayout extends StatefulWidget {
  const HomeMobileLayout({super.key});

  @override
  State<HomeMobileLayout> createState() => _HomeMobileLayoutState();
}
int _currentIndex = 2;

// List of widgets corresponding to each item in the CurvedNavigationBar
final List<Widget> _pages = [
 /* ShopScreen(),
  PharmacyScreen(),
  HomeTabScreen(),
  HospitalScreen(),
  DoctorScreen(),*/

];
class _HomeMobileLayoutState extends State<HomeMobileLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  ColorManager.primaryColor,
      bottomNavigationBar: CurvedNavigationBar(
        index: 2,
        backgroundColor:   ColorManager.primaryColor,
        color:  ColorManager.secondaryColor,
        items: <Widget>[
          Icon(Icons.add, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.compare_arrows, size: 30),
        ],
        onTap: (index) {
          //Handle button tap
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: _pages[_currentIndex],
    );
  }
}
