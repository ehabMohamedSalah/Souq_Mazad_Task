import 'package:e_commerce_task/Domain_layer/entity/product_entity.dart';
import 'package:e_commerce_task/core/utilis/Appstyle.dart';
import 'package:e_commerce_task/presentation/home/view_model/product_Bloc.dart';
import 'package:e_commerce_task/presentation/home/view_model/product_event.dart';
import 'package:e_commerce_task/presentation/home/view_model/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../../../core/di/di.dart';
import '../../../../../core/utilis/routes_manager.dart';
import '../widgets/Products_details/layouts/productdetails_mobilelayout.dart';
import '../widgets/Products_details/product_details_screen.dart';

class ProductListMobileLayout extends StatelessWidget {
List<ProductEntity>productss=[];
  @override
  Widget build(BuildContext context) {
     return BlocProvider(
    create: (context) => getIt<ProductBloc>()..add(FetchProductsEvent()),
    child: Scaffold(
      appBar: AppBar(title: Text('Products',style: Appstyle.medium25(context),)),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ProductLoadedState) {
            return ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 20),
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProudctDetailsMobileLayout(product: product),
                      ),
                    );
                  },
                  child: Card(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Row(
                        children: [

                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              product.thumbnail,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 12),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name,
                                  style: Appstyle.medium25(context),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "\$${product.price.toStringAsFixed(2)}",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.teal,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  product.description,
                                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );


          } else if (state is ProductErrorState) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return ListView.separated(
            separatorBuilder: (context, index) => SizedBox(height: 20,),
            itemCount:  productss.length,
            itemBuilder: (context, index) {
              final product = productss[index];
              return   ListTile(
                leading: Image.asset(product.thumbnail, width: 100, height: 100,fit: BoxFit.cover,),
                title: Text(product.name,style: Appstyle.smallLabelText(context),),
                subtitle: Text("\$${product.price.toStringAsFixed(2)}",style: Appstyle.small20(context),),

                onTap: () {
                   Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProudctDetailsMobileLayout(product: product),
                      ));
                },
              );
            },
          );
        },
      ),
    ),
    );
  }
}