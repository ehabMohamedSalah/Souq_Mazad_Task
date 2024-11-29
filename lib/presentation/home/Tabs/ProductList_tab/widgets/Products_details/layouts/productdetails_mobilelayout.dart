import 'package:e_commerce_task/Domain_layer/entity/product_entity.dart';
import 'package:e_commerce_task/core/utilis/color_manager.dart';
import 'package:e_commerce_task/data_layer/model/product_model.dart';
import 'package:e_commerce_task/presentation/home/Tabs/ProductList_tab/ProductList_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../../core/di/di.dart';
import '../../../../../view_model/product_Bloc.dart';
import '../../../../../view_model/product_event.dart';
import '../../../../../view_model/product_state.dart';

@injectable
class ProudctDetailsMobileLayout extends StatelessWidget {

  final ProductEntity product;
  ProudctDetailsMobileLayout({required this.product});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          product.name,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: ColorManager.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Stack(
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    image: DecorationImage(
                      image: AssetImage(product.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 20,
                  child: IconButton(
                    icon: Icon(Icons.favorite_border, color: Colors.white, size: 30),
                    onPressed: () {

                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "\$${product.price.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.teal,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Description",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    product.description,
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),

            Center(
              child: ElevatedButton.icon(
                onPressed: () {

                },
                icon: Icon(Icons.shopping_cart),
                label: Text(
                  "Buy Now",
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  backgroundColor: ColorManager.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}