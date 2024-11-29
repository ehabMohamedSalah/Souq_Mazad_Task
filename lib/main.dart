import 'package:device_preview/device_preview.dart';
  import 'package:e_commerce_task/presentation/home/Tabs/ProductList_tab/ProductList_screen.dart';
import 'package:e_commerce_task/presentation/home/Tabs/ProductList_tab/widgets/Products_details/product_details_screen.dart';
 import 'package:e_commerce_task/presentation/home/home_screen.dart';
import 'package:e_commerce_task/presentation/home/view_model/product_Bloc.dart';
  import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'config/theme/appTheme.dart';
import 'core/di/di.dart';
import 'core/myobserver.dart';
import 'core/productservice.dart';
import 'core/utilis/routes_manager.dart';
import 'data_layer/datasource_contract/product_datasource_contract.dart';



void main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  // Use cubits...
  configureDependencies();


    runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => BlocProvider(
          create: (context) => getIt<ProductBloc>(),
          child: MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


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
        RouteManager.ProductDetailsScreen:(context) => ProductDetailsScreen(),


      },
      theme:AppTheme.lightTheme ,
      initialRoute:   RouteManager.homeScreenRoutes  ,


    );
  }
}

