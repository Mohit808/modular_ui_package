import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class CustomStepProgressContainer extends StatelessWidget {
  const CustomStepProgressContainer({super.key, required this.length, required this.selected});
  final int length;
  final int selected;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      for(int x in List.generate(length, (generator) => generator).toList())
        Expanded(child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: x>selected?Colors.grey:AppColors.primary),margin: EdgeInsets.symmetric(horizontal: 4),height: 5,))
    ],);
  }
}
