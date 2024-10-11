import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/molecules/auth/widgets/email_pass_widget.dart';
import 'package:modular_ui_package/molecules/auth/widgets/social_login_widget.dart';

import '../../common_widget/appbar_common.dart';
import '../../common_widget/button_single_atom.dart';
import '../../text_atoms/text_common.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_paddings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommon(title: "Misto",titleColor: AppColors.primary,color: AppColors.scaffoldBackgroundColor,elevation: 0,),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPaddings.paddingAll16,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            const BigText20(text: "Login"),
            const SizedBox(height: 24,),
            EmailPassWidget(),

            const SizedBox(height: 16,),

            Row(children: [

              SizedBox(height: 24,width: 24,child: Checkbox(value: true, onChanged: (onChanged){})),
              const SmallText(text: "Remember me",color: Colors.grey,),
              const Spacer(),
              const SmallText(text: "Forgot Password?",fontWeight: FontWeight.w600,)
            ],),
            const SizedBox(height: 24,),

            ButtonSingleAtom(widget: "SIGN IN",colorText: Colors.black,),
            SocialLoginWidget(),
            const SizedBox(height: 48,),
            Align(alignment: Alignment.center,
              child: InkWell(onTap: (){
                // Get.off(()=>SignUpScreen());
              },
                child: Text.rich(textAlign: TextAlign.center,
                  TextSpan(
                    children: [
                       TextSpan( text: "Don't have account? ", style: TextStyle(fontWeight: FontWeight.w500,),),
                      TextSpan(text: ' Sign up',style: TextStyle(fontWeight: FontWeight.w500,color: AppColors.primary)),
                    ],
                  ),
                ),
              ),
            ),
          ],),
        ),
      ),
    );
  }
}
