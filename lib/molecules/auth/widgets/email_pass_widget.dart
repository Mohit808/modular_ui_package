import 'package:flutter/material.dart';

import '../../../common_widget/textfield_atom.dart';
import '../../../text_atoms/text_common.dart';

class EmailPassWidget extends StatelessWidget {
  const EmailPassWidget({super.key, this.confirmPassShow});
  final bool? confirmPassShow;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
      const SizedBox(height: 24,),
      const SmallText(text: "Email Address",color: Colors.black54,),
      const SizedBox(height: 4,),
      TextFieldCommon(hintText: "Enter email"),

      const SizedBox(height: 16,),
      const SmallText(text: "Password",color: Colors.black54,),
      const SizedBox(height: 4,),
      TextFieldCommon(hintText: "Enter password"),

      confirmPassShow==null?const SizedBox():Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
        const SizedBox(height: 16,),
        const SmallText(text: "Confirm Password",color: Colors.black54,),
        const SizedBox(height: 4,),
        TextFieldCommon(hintText: "Enter confirm password"),
      ],)
    ],);
  }
}
