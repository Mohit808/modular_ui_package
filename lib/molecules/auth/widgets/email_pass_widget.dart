import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widget/textfield_atom.dart';
import '../../../text_atoms/text_common.dart';

class EmailPassWidget extends StatelessWidget {
  const EmailPassWidget({super.key, this.confirmPassShow, this.textEditingControllerEmail, this.textEditingControllerPass, this.textEditingControllerConfirmPass, this.formKey});
  final bool? confirmPassShow;
  final TextEditingController? textEditingControllerEmail;
  final TextEditingController? textEditingControllerPass;
  final TextEditingController? textEditingControllerConfirmPass;
  final GlobalKey<FormState>? formKey;

  @override
  Widget build(BuildContext context) {
    return Form(key: formKey,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
        const SizedBox(height: 24,),
        const SmallText(text: "Email Address",color: Colors.black54,),
        const SizedBox(height: 4,),
        TextFieldCommon(controller: textEditingControllerEmail,hintText: "Enter email",validator: (value){
          if(value!.isEmpty) return "Enter email";
          if(!GetUtils.isEmail(value)) return "Enter valid email";
          return null;
        },),

        const SizedBox(height: 16,),
        const SmallText(text: "Password",color: Colors.black54,),
        const SizedBox(height: 4,),
        TextFieldCommon(controller: textEditingControllerPass,hintText: "Enter password",validator: (value){
          if(value!.isEmpty) return "Enter pass";
          return null;
        },),

        confirmPassShow==null?const SizedBox():Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
          const SizedBox(height: 16,),
          const SmallText(text: "Confirm Password",color: Colors.black54,),
          const SizedBox(height: 4,),
          TextFieldCommon(controller: textEditingControllerConfirmPass,hintText: "Enter confirm password",validator: (value){
            if(value!.isEmpty) return "Enter confirm pass";
            if(textEditingControllerPass!.text!=value) return "Pass did not match";
            return null;
          },),
        ],)
      ],),
    );
  }
}
