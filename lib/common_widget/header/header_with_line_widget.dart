import 'package:flutter/material.dart';

import '../../text_atoms/text_common.dart';

class HeaderWithLineWidget extends StatelessWidget {
  const HeaderWithLineWidget({super.key, this.text});
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SmallText(text: text??"BEAUTY & PERSONAL CARE",fontWeight: FontWeight.w700,letterSpacing: 0.5,),
      const SizedBox(width: 16,),
      Expanded(child: Container(width: double.infinity,height: 1,decoration: BoxDecoration(color: Colors.grey,gradient: LinearGradient(colors: [
        Colors.grey.shade400,
        Colors.transparent
      ],stops: [0,0.9])),))
    ],);
  }
}
