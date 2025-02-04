import 'package:flutter/material.dart';
import 'package:modular_ui_package/theme/app_colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.center, this.paddingTop});
  final dynamic center;
  final double? paddingTop;
  @override
  Widget build(BuildContext context) {
    return center==null?  CircularProgressIndicator(color: AppColors.primary,):  Padding(
      padding:  EdgeInsets.only(top: paddingTop??0),
      child: Center(child: CircularProgressIndicator(color: AppColors.primary,),),
    );
  }
}
