
import 'package:flutter/material.dart';
import '../text_atoms/text_common.dart';
import '../theme/app_sizes.dart';

class InputWithHeadingMolecule extends StatelessWidget{
  const InputWithHeadingMolecule({super.key, required this.heading, this.mandatoryString, required this.widget, this.colorMandatoryString});
  final dynamic heading;
  final String? mandatoryString;
  final Widget widget;
  final Color? colorMandatoryString;


  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
      const SizedBox(height: AppSizes.h_16),
      heading.runtimeType!=String?heading: Row(
        children: [
          SmallText(text: "$heading",),
          mandatoryString==null?SizedBox():SmallText(text: " $mandatoryString",color: colorMandatoryString,),
        ],
      ),
      const SizedBox(height: AppSizes.h_8),
      widget
    ],);
  }

}