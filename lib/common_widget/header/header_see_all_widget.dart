import 'package:flutter/material.dart';
import 'package:modular_ui_package/theme/app_colors.dart';

import '../../text_atoms/text_common.dart';

class HeaderSeeAllWidget extends StatelessWidget {
  const HeaderSeeAllWidget({super.key, required this.heading, this.subTitle, this.fontSizeHeading});
  final String heading;
  final String? subTitle;
  final double? fontSizeHeading;

  @override
  Widget build(BuildContext context) {
    return  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
      Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadingText(text: heading??"The Ice-Cream Shop",letterSpacing: 0.5,size: fontSizeHeading,),
          subTitle==null?SizedBox(): SizedBox(height: 4,),
          subTitle==null?SizedBox():SmallText(text: subTitle??"Satisfaction in every scoop",)
        ],
      ),
      NormalText(text: "See All",color: AppColors.primary,fontWeight: FontWeight.w600,)
    ],);
  }
}
