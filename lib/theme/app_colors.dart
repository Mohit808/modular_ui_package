import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppColors{
  static Color get primary => Get.theme.primaryColor;
  static Color get scaffoldBackgroundColor=> Get.theme.scaffoldBackgroundColor;


  // primaryColorLight: AppColors.materialColor, optional (if required like app bar title in black)
  // primarySwatch: AppColors.materialColor,   required (app bar title in white)

  static MaterialColor materialColor = MaterialColor(
    0xFFF5C418,
    <int, Color>{
      50: Color(0xFFF5C418),
      100: Color(0xFFF5C418),
      200: Color(0xFFF5C418),
      300: Color(0xFFF5C418),
      400: Color(0xFFF5C418),
      500: Color(0xFFF5C418),
      600: Color(0xFFF5C418),
      700: Color(0xFFF5C418),
      800: Color(0xFFF5C418),
      900: Color(0xFFF5C418),
    },
  );

}