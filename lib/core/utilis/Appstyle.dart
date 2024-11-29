import 'package:e_commerce_task/config/size_config.dart';
import 'package:flutter/material.dart';

import 'color_manager.dart';


abstract class Appstyle{

  static TextStyle medium25(BuildContext context) {
    return TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: ColorManager.textColor,  // Consistent text color
    );
  }

  // Small label text style
  static TextStyle smallLabelText(BuildContext context) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: ColorManager.textColor,  // Consistent text color
    );
  }

  // Price text style
  static TextStyle small20(BuildContext context) {
    return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: ColorManager.primaryColor,  // Primary color for price
    );
  }

  // Title text style for details
  static TextStyle medium20(BuildContext context) {
    return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: ColorManager.textColor,  // Consistent text color
    );
  }

}


// sacleFactor
// responsive font size
// (min , max) fontsize
double getResponsiveFontSize(context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(context) {
  // var dispatcher = PlatformDispatcher.instance;
  // var physicalWidth = dispatcher.views.first.physicalSize.width;
  // var devicePixelRatio = dispatcher.views.first.devicePixelRatio;
  // double width = physicalWidth / devicePixelRatio;

  double width = MediaQuery.sizeOf(context).width;
  if (width < 600) {
    return width / 400;
  } else if (width < SizeConfig.tablet) {
    return width / 700;
  } else {
    return width / 1000;
  }
}



