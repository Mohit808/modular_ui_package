
import 'package:flutter/material.dart';
import '../text_atoms/text_common.dart';
import '../theme/app_sizes.dart';

class InputWithHeadingMolecule extends StatelessWidget{
  const InputWithHeadingMolecule({super.key, required this.heading, this.mandatoryString, required this.widget, this.colorMandatoryString,this.fontWeightHeading});
  final dynamic heading;
  final String? mandatoryString;
  final Widget widget;
  final Color? colorMandatoryString;
  final FontWeight? fontWeightHeading;


  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
      const SizedBox(height: AppSizes.h_16),
      heading.runtimeType!=String?heading: Row(
        children: [
          SmallText(text: "$heading",fontWeight: fontWeightHeading,),
          mandatoryString==null?SizedBox():SmallText(text: " $mandatoryString",color: colorMandatoryString,fontWeight: fontWeightHeading,),
        ],
      ),
      const SizedBox(height: AppSizes.h_8),
      widget
    ],);
  }

}
