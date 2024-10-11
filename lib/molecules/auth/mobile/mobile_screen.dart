import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/common_widget/container_decorated.dart';
import 'package:modular_ui_package/molecules/auth/mobile/controller_mobile_screen.dart';
import 'package:modular_ui_package/molecules/text_field_with_heading_molecule.dart';
import 'package:modular_ui_package/utils/utils.dart';

import '../../../common_widget/appbar_common.dart';
import '../../../common_widget/button_single_atom.dart';
import '../../../text_atoms/text_common.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_paddings.dart';
import '../../../tokens/input_formatter/min_number_input_formatter.dart';
import '../../../utils/network_handling/api_response.dart';
import '../widgets/referal_code_widget.dart';

class MobileScreen extends StatelessWidget {
  const MobileScreen({super.key, this.height, this.titleColor, this.colorBackground, this.endPointMobile, this.mapKey, this.endPointOtp,});
  final double? height;
  final Color? titleColor;
  final Color? colorBackground;
  final String? endPointMobile;
  final String? endPointOtp;
  final dynamic mapKey;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerMobileScreen(endPointMobile: endPointMobile,endPointOtp: endPointOtp,mapKey: mapKey,),
      builder: (controller) {
        return Scaffold(
          appBar: AppBarCommon(title: "",titleColor: titleColor??AppColors.primary,color: colorBackground??AppColors.scaffoldBackgroundColor,elevation: 0,height: height,),
          body: SingleChildScrollView(
            child: Padding(
              padding: AppPaddings.paddingAll16,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                // const SizedBox(height: 48,),
                ContainerDecorated(padding: 8,borderRadius: 50,child: Icon(Icons.call,color: Colors.white,),color: AppColors.primary,),
                const SizedBox(height: 16,),
                const BigText24(text: "Continue with phone"),
                const SizedBox(height: 48,),
                Form(key: controller.formKey,child: TextFieldWithHeadingMolecule(controller: controller.textEditingController,heading: "Mobile number",hintText: "Enter number...",keyboardType: TextInputType.number,validator: (value){
                  if (value!.isEmpty) return "Number is empty";
                  if (value.length != 10) return "Enter valid number";
                  if (!GetUtils.isNumericOnly(value)) return "Invalid character";
                  return null;
                },inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                  FilteringTextInputFormatter.digitsOnly,
                  MinNumberInputFormatter(),
                ],onChanged: (value){
                  if(value!.length==10){
                    controller.enableMobileButton=true;
                    hideKeyboard();
                  }else{
                    controller.enableMobileButton=false;
                  }
                  controller.update();
                  return null;
                },)),
                const SizedBox(height: 48,),
                const TermsWidget(),
                const SizedBox(height: 72,),
                ButtonSingleAtom(color: controller.enableMobileButton?null:Colors.grey,status: controller.apiResponse.status,widget: "CONTINUE",tap: (){
                  controller.sendOtpMethod();
                },)
              ],),
            ),
          ),
        );
      }
    );
  }
}
