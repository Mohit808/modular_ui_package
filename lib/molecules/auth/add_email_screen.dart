import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_widget/appbar_common.dart';
import '../../common_widget/button_single_atom.dart';
import '../../common_widget/textfield_atom.dart';
import '../../text_atoms/text_common.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_paddings.dart';
import '../../utils/strings.dart';


class AddEmailScreen extends StatelessWidget {
  const AddEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommon(title: Strings.appName,titleColor: AppColors.primary,color: AppColors.scaffoldBackgroundColor,elevation: 0,),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPaddings.paddingAll16,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            const BigText20(text: "Add Email"),
            const SizedBox(height: 16,),
            const Row(children: [
              SmallText(text: "for linking to ",color: Colors.grey,),
              SmallText(text: "+91 9876543210",fontWeight: FontWeight.w600,),
            ],),
            const SizedBox(height: 24,),
            const SmallText(text: "Email Address",color: Colors.black54,),
            const SizedBox(height: 4,),
            TextFieldCommon(hintText: "Enter email"),

          ],),
        ),
      ),
      persistentFooterButtons: [
        ButtonSingleAtom(widget: "CONTINUE",colorText: Colors.black,tap: (){
          // Get.to(()=>BuildDigitalStoreScreen());
        },),
      ],
    );
  }
}
