import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/molecules/auth/mobile/controller_mobile_screen.dart';

import '../../../common_widget/appbar_common.dart';
import '../../../common_widget/button_single_atom.dart';
import '../../../common_widget/container_decorated.dart';
import '../../../common_widget/otp_atom.dart';
import '../../../text_atoms/text_common.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_paddings.dart';
import '../../../utils/strings.dart';
import '../add_email_screen.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key, this.height, this.titleColor, this.colorBackground});

  final double? height;
  final Color? titleColor;
  final Color? colorBackground;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerMobileScreen(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBarCommon(title: "",titleColor: titleColor??AppColors.primary,color: colorBackground??AppColors.scaffoldBackgroundColor,elevation: 0,height: height,),
          body: SingleChildScrollView(
            child: Padding(
              padding: AppPaddings.paddingAll16,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [

                ContainerDecorated(padding: 8,borderRadius: 50,child: Icon(Icons.more_horiz,color: Colors.white,),color: AppColors.primary,),
                SizedBox(height: 16,),

                const BigText24(text: "Enter Your OTP"),
                  const SizedBox(height: 48,),
                  const SmallText(text: "We have send OTP to your mobile number"),
                  const SizedBox(height: 4,),
                Row(
                  children: [
                    const SmallText(text: "+91 9876543210",fontWeight: FontWeight.w500,),
                    const SizedBox(width: 16,),
                    Icon(Icons.edit,size: 13,color: AppColors.primary,),
                    SmallText(text: " Edit",color: AppColors.primary,fontWeight: FontWeight.w600,)
                  ],
                ),
                const SizedBox(height: 48,),
                Form(key: controller.formKeyOtp,child: OtpAtom(textEditingController: controller.textEditingControllerOtp)),
                const SizedBox(height: 4,),
                const Align(alignment: AlignmentDirectional.topEnd,child: SmallText(text: "00:22")),
                const SizedBox(height: 16,),
                // Align(alignment: Alignment.center,child: Column(children: [
                //   SmallText(text: "Didn’t receive OTP yet?",color: Colors.grey,),
                //   SmallText(text: "Resend code",textDecoration: TextDecoration.underline,color: AppColors.primary,fontWeight: FontWeight.w500,)
                // ],),),
                Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan( text: "Didn’t receive OTP yet? ",style: TextStyle(fontSize: 12)),
                      TextSpan( text: 'Resend code', style: TextStyle(color: AppColors.primary,fontSize: 12,fontWeight: FontWeight.w600,decoration: TextDecoration.underline),),
                    ],
                  ),
                ),


                const SizedBox(height: 72,),
                ButtonSingleAtom(status: controller.apiResponseOtp.status,widget: "VERIFY",tap: (){
                  controller.verifyOtp();
                },)
              ],),
            ),
          ),
        );
      }
    );
  }
}
