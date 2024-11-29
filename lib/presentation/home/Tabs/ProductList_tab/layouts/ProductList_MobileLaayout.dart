import 'package:e_commerce_task/core/utilis/Appstyle.dart';
import 'package:e_commerce_task/presentation/home/view_model/product_Bloc.dart';
import 'package:e_commerce_task/presentation/home/view_model/product_event.dart';
import 'package:e_commerce_task/presentation/home/view_model/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/Products_details/product_details_screen.dart';

class ProductListMobileLayout extends StatelessWidget {
  const ProductListMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Products")),

    );
  }
}
