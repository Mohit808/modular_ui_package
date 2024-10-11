import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class SliderDotWidget extends StatelessWidget {
  const SliderDotWidget({super.key, required this.index, required this.length, this.width, this.colorEnable, this.colorDisable});
  final int index;
  final int length;
  final double? width;
  final Color? colorEnable;
  final Color? colorDisable;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center,children:

    List.generate(length, (generator)=>Container(margin: EdgeInsets.symmetric(horizontal: 4),height: 10,width: index==generator?width??10:10,decoration: BoxDecoration(color: index==generator?colorEnable??AppColors.primary:colorDisable??Colors.grey,borderRadius: BorderRadius.circular(20)),),));
  }
}
