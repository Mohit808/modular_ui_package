import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modular_ui_package/common_functions/image_network.dart';
import 'package:modular_ui_package/common_widget/appbar_common.dart';
import 'package:modular_ui_package/common_widget/button_single_atom.dart';
import 'package:modular_ui_package/common_widget/container_decorated.dart';
import 'package:modular_ui_package/molecules/auth/widgets/social_login_widget.dart';
import 'package:modular_ui_package/molecules/profile/widgets/log_out_widget.dart';
import 'package:modular_ui_package/molecules/profile/widgets/profile_header_widget.dart';
import 'package:modular_ui_package/molecules/profile/widgets/profile_item_widgets.dart';
import 'package:modular_ui_package/molecules/profile/widgets/social_icon_widget.dart';
import 'package:modular_ui_package/text_atoms/text_common.dart';
import 'package:modular_ui_package/theme/app_colors.dart';
import 'package:modular_ui_package/utils/app_images.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommon(title: "Profile",titleColor: AppColors.primary,color: Colors.transparent,elevation: 0,),
      body: SingleChildScrollView(
        child: Padding(
          padding:const EdgeInsets.symmetric(horizontal: 16,vertical: 4),
          child: Column(children: [

            const ProfileHeaderWidget(),
            const SizedBox(height: 24,),
            const ProfileItemWidgets(),
            const SizedBox(height: 48,),
            ButtonSingleAtom(color: Colors.white,colorBorder: Colors.grey.shade300,widget: const Row(mainAxisAlignment: MainAxisAlignment.center,children: [
              Icon(Icons.exit_to_app,color: Colors.red,),
              HeadingText(text: "Logout",color: Colors.red,)
            ],),),

            // const LogOutWidget(),
            const SizedBox(height: 48,),
            const NormalHeadingText(text: "Delete Account"),
            const SizedBox(height: 24,),
            const SocialIconWidget(),
            const SizedBox(height: 48,),
            NetworkOrAssetImage(src: AppImagesConst.logo),
            const SizedBox(height: 48,)
          ],),
        ),
      ),
    );
  }
}
