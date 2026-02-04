import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/molecules/auth/widgets/social_login/controller_social_login.dart';
import 'package:modular_ui_package/utils/app_images.dart';
import 'package:modular_ui_package/utils/network_handling/api_response.dart';

import '../../../common_functions/image_network.dart';
import '../../../common_widget/button_single_atom.dart';
import '../../../text_atoms/text_common.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialLoginWidget extends StatelessWidget {
  const SocialLoginWidget({super.key, this.callBack, this.hideAppleLogin, this.apiResponseGoogle});
  final Function(dynamic)? callBack;
  final bool? hideAppleLogin;
  final ApiResponse? apiResponseGoogle;


  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerSocialLogin(),
      builder: (controller) {
        return Column(spacing: 24,children: [

          ButtonSingleAtom(status:apiResponseGoogle?.status,color: Colors.white,colorBorder: Colors.grey.shade400,widget: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
            // ImageCommon( AppImagesConst.google),
            FaIcon(FontAwesomeIcons.google),
            const SizedBox(width: 16,),
            const NormalHeadingText(text: "Continue with Google",color: Colors.grey,)
          ],),tap: () async {
            dynamic value=await controller.loginWithGoogle();
            if(callBack!=null) callBack!(value);
          },),


          if(hideAppleLogin!=true)ButtonSingleAtom(color: Colors.white,colorBorder: Colors.grey.shade400,widget: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
            // ImageCommon( AppImagesConst.apple),
            FaIcon(FontAwesomeIcons.apple),
            const SizedBox(width: 16,),
            const NormalHeadingText(text: "Continue with Apple",color: Colors.grey,)
          ],),),
        ],);
      }
    );
  }
}
