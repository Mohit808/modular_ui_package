import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/common_functions/image_network.dart';
import 'package:modular_ui_package/common_widget/button_single_atom.dart';
import 'package:modular_ui_package/text_atoms/text_common.dart';
import 'package:modular_ui_package/utils/app_images.dart';

class DialogLogout extends StatelessWidget {
  const DialogLogout({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(content: Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(mainAxisSize: MainAxisSize.min,children: [
        Align(alignment: Alignment.center,child: ImageCommon(src: AppImagesConst.logout,height: 70,width: 70,)),
        SizedBox(height: 24,),
        NormalHeadingText(text: "Oh no! You're leaving...",fontWeight: FontWeight.w400,),
        SizedBox(height: 8,),
        NormalHeadingText(text: "You want to logout?"),
      ],),
    ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(children: [
            Expanded(child: ButtonSingleAtom(tap: (){
              Get.back();
            },widget: "Cancel",color: Colors.white,colorBorder: Colors.red,colorText: Colors.red,)),
            SizedBox(width: 16,),
            Expanded(child: ButtonSingleAtom(tap: (){
              Get.back(result: true);
            },widget: "Confirm",color: Colors.red,colorBorder: Colors.red,colorText: Colors.white,)),
          ],),
        )
      ],
    );
  }
}
