import 'package:device_preview/device_preview.dart';
import 'package:e_commerce_task/data_layer/repo/product_repo.dart';
import 'package:e_commerce_task/presentation/home/Tabs/ProductList_tab/ProductList_screen.dart';
import 'package:e_commerce_task/presentation/home/home_screen.dart';
import 'package:e_commerce_task/presentation/home/view_model/product_Bloc.dart';
import 'package:e_commerce_task/presentation/home/view_model/product_event.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/theme/appTheme.dart';
import 'core/utilis/routes_manager.dart';


void main() => runApp(
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => BlocProvider(
      create: (context) => ProductBloc(ProductRepository())..add(FetchProductsEvent()),
      child: MyApp(),
    ), // Wrap your app
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      routes: {
        RouteManager.homeScreenRoutes: (context) => HomeScreen(),
        RouteManager.productListScreen: (_) => ProductListScreen(),

      },
      theme:AppTheme.lightTheme ,
      initialRoute:   RouteManager.homeScreenRoutes  ,


    );
  }
}

