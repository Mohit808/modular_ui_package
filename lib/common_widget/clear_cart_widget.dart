import 'package:flutter/material.dart';

import '../text_atoms/text_common.dart';

class ClearCartWidget extends StatelessWidget {
  const ClearCartWidget({super.key,this.hideClearBtn});
  final dynamic hideClearBtn;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
      HeadingText(text: "Your Cart",letterSpacing: 0.5,color: Colors.black,),
      hideClearBtn!=null?SizedBox():Row(
        children: [
          SmallText(text: "Clear cart  ",letterSpacing: 0.5,color: Colors.black54,fontWeight: FontWeight.w700,size: 13,),
          Icon(Icons.delete_rounded,size: 14,)
        ],
      ),
    ],);

  }
}
