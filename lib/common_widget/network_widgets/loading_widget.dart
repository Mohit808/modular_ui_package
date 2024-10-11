import 'package:flutter/material.dart';
import 'package:modular_ui_package/theme/app_colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.center});
  final dynamic center;
  @override
  Widget build(BuildContext context) {
    return center==null?  CircularProgressIndicator(color: AppColors.primary,):  Center(child: CircularProgressIndicator(color: AppColors.primary,),);
  }
}
