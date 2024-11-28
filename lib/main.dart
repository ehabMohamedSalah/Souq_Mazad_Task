import 'package:device_preview/device_preview.dart';
import 'package:e_commerce_task/presentation/home/home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'config/theme/appTheme.dart';
import 'core/utilis/routes_manager.dart';

void main() => runApp(
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MyApp(), // Wrap your app
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
        RouteManager.homeScreenRoutes:(context) => HomeScreen(),



      },
      theme:AppTheme.lightTheme ,
      initialRoute:   RouteManager.homeScreenRoutes  ,


    );
  }
}

