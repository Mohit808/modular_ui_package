import 'package:flutter/material.dart';
import '../text_atoms/text_common.dart';
import '../theme/app_colors.dart';
import '../utils/strings.dart';

class AppBarCommon extends StatelessWidget implements PreferredSizeWidget{

  final dynamic title;
  final List<Widget> actions;
  final double? height;
  final double? elevation;
  final Widget? leading;
  final Color? titleColor;
  final Color? color;
  final Color? colorIconTheme;
  final bool? centerTitle;
  final double? leadingWidth;

  const AppBarCommon({super.key, required this.title, this.actions = const [], this.height, this.elevation, this.leading, this.titleColor, this.color, this.colorIconTheme, this.centerTitle, this.leadingWidth});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: leadingWidth ,
      elevation: elevation,
      backgroundColor: color??AppColors.primary,
      leading:leading,
      iconTheme: IconThemeData(color: colorIconTheme??Colors.black),
      title: title.runtimeType!=String?title:NormalHeadingText(text: title,color: titleColor,fontWeight: title==Strings.appName?null:FontWeight.w500,size:  title==Strings.appName?null:18,),
      actions: actions,
      centerTitle: centerTitle??true,
    );
  }


  @override
  Size get preferredSize => Size.fromHeight(height??kToolbarHeight);
}