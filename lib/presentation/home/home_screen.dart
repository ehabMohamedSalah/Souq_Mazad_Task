import 'package:flutter/material.dart';
 import '../../config/size_config.dart';
import '../../core/adaptive_layout/adaptive_layout.dart';
import '../../core/utilis/Appstyle.dart';
import '../../core/utilis/color_manager.dart';
import '../../core/utilis/string_manager.dart';
import 'layouts/home_desktop_layout.dart';
import 'layouts/home_mobile_layout.dart';
import 'layouts/home_tablet_layout.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      key: scaffoldKey,
      appBar: MediaQuery.sizeOf(context).width < SizeConfig.tablet
          ? AppBar(
        elevation: 0,
        backgroundColor:   ColorManager.secondaryColor,
        leading: IconButton(
            onPressed: () {
              scaffoldKey.currentState!.openDrawer();
            },
            icon: const Icon(Icons.menu,color: Colors.white,size:37 ,)),
        title: Text(StringsManager.ecommerceApp,style: Appstyle.large30(context),),
        actions: [

          Image.asset('assets/images/3_home&bottoms/ill-vent (1) 1.png' ),
        ],
      )
          : null,
      backgroundColor:   ColorManager.primaryColor,


      body: AdaptiveLayout(
        mobileLayout: (context) => const HomeMobileLayout(),
        tabletLayout: (context) => const HomeTabletLayout(),
        desktopLayout: (context) => const HomeDesktopLayout(),
      ),
    );

  }
}
