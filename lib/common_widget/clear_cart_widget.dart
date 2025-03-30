import 'package:flutter/material.dart';

import '../text_atoms/text_common.dart';

class ClearCartWidget extends StatelessWidget {
  const ClearCartWidget({super.key,this.hideClearBtn, this.onTap});
  final dynamic hideClearBtn;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
      const HeadingText(text: "Your Cart",letterSpacing: 0.5,color: Colors.black,),
      hideClearBtn!=null?const SizedBox():InkWell(onTap: (){
        if(onTap!=null) onTap!();
      },
        child: const Row(
          children: [
            SmallText(text: "Clear cart  ",letterSpacing: 0.5,color: Colors.black54,fontWeight: FontWeight.w700,size: 13,),
            Icon(Icons.delete_rounded,size: 14,)
          ],
        ),
      ),
    ],);

  }
}
