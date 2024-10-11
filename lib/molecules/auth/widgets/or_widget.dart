import 'package:flutter/material.dart';

import '../../../text_atoms/text_common.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 24,),
      Row(children: [
        Expanded(child: Container(height: 1,color: Colors.grey.shade300,)),
        const SmallText(text: " or ",fontWeight: FontWeight.w600,),
        Expanded(child: Container(height: 1,color: Colors.grey.shade300,)),
      ],),
      const SizedBox(height: 24,),
    ],);
  }
}
