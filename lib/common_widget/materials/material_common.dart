import 'package:flutter/material.dart';

import '../../text_atoms/text_common.dart';
import '../../theme/app_colors.dart';

class RowBiCommon extends StatelessWidget{
  final dynamic first;
  final dynamic second;
  final MainAxisAlignment? mainAxisAlignment;
  const RowBiCommon({super.key, this.first,this.second, this.mainAxisAlignment});

  @override
  Widget build(BuildContext context) {
    return  Row(mainAxisAlignment: mainAxisAlignment??MainAxisAlignment.start,children: [
      first.runtimeType!=IconData?first:Icon(first,color: AppColors.primary,),
      SizedBox(width: 8,),
      second.runtimeType!=String?second:SmallText(text: second,),

    ],);
  }

}