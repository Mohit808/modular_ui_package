import 'package:flutter/material.dart';
import '../common_widget/border_atom.dart';


class ContainerDecorated extends StatelessWidget {
  const ContainerDecorated({super.key, this.borderRadius, this.child, this.color, this.colorBorder,  this.padding, this.onTap, this.paddingEdgeInsets, this.shadow, this.elevation, this.linearGradient, this.radialGradient, this.width, this.height, this.margin, this.marginEdgeInsets});
  final double? borderRadius;
  final Widget? child;
  final Color? color;
  final Color? colorBorder;
  final double? padding;
  final Function()? onTap;
  final EdgeInsets? paddingEdgeInsets;
  final List<BoxShadow>? shadow;
  final double? elevation;
  final LinearGradient? linearGradient;
  final RadialGradient? radialGradient;
  final double? width;
  final double? height;
  final double? margin;
  final EdgeInsets? marginEdgeInsets;


  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: marginEdgeInsets??EdgeInsets.all(margin??0.0),
        child: InkWell(onTap: onTap,child: Material(elevation: elevation??0,borderRadius: BorderRadius.circular(borderRadius??BorderAtom.borderRadiusValue),child: Container(height: height,width: width,padding: paddingEdgeInsets??EdgeInsets.all(padding??4),decoration: BoxDecoration(gradient: linearGradient??radialGradient,boxShadow: shadow,borderRadius: BorderRadius.circular(borderRadius??BorderAtom.borderRadiusValue ),border: Border.all(color: colorBorder??Colors.transparent),color: color??Colors.grey.shade200),child: child,))),
      );
  }
}
