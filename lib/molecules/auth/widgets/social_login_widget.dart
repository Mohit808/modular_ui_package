import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/molecules/auth/widgets/social_login/controller_social_login.dart';
import 'package:modular_ui_package/utils/app_images.dart';

import '../../../common_functions/image_network.dart';
import '../../../common_widget/button_single_atom.dart';
import '../../../text_atoms/text_common.dart';


class SocialLoginWidget extends StatelessWidget {
  const SocialLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerSocialLogin(),
      builder: (controller) {
        return Column(children: [

          ButtonSingleAtom(color: Colors.white,colorBorder: Colors.grey.shade400,widget: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
            ImageCommon(src: AppImagesConst.google),
            const SizedBox(width: 16,),
            const NormalHeadingText(text: "Continue with Google",color: Colors.grey,)
          ],),tap: (){
            controller.loginWithGoogle();
          },),
          const SizedBox(height: 24,),


          ButtonSingleAtom(color: Colors.white,colorBorder: Colors.grey.shade400,widget: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
            ImageCommon(src: AppImagesConst.apple),
            const SizedBox(width: 16,),
            const NormalHeadingText(text: "Continue with Apple",color: Colors.grey,)
          ],),),
        ],);
      }
    );
  }
}
