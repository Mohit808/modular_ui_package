import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_sizes.dart';

class GradientAtom{
  static LinearGradient? gradient;
}

class BorderAtom{
  static double borderRadiusValue=4.0;
  static BorderRadius _borderRadius=BorderRadius.circular(AppSizes.h_4);
  static get borderRadius => _borderRadius;
  static get border => Border.all(color: AppColors.primary);

  static BorderRadius _borderRadiusTextField=BorderRadius.circular(AppSizes.h_4);
  static get borderRadiusTextField => _borderRadiusTextField;

  static set setRadius(value){
    _borderRadius=value;
  }
  static set setRadiusTextField(value){
    _borderRadiusTextField=value;
  }
}
