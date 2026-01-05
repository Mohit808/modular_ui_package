import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/models/model_x.dart';
import 'package:modular_ui_package/utils/network_handling/api_response.dart';
import 'package:modular_ui_package/utils/network_handling/network_manager.dart';
import 'package:modular_ui_package/utils/utils.dart';

import '../otp/otp_screen.dart';

class ControllerMobileScreen extends GetxController{
  TextEditingController textEditingController=TextEditingController();
  TextEditingController textEditingControllerOtp=TextEditingController();
  GlobalKey<FormState> formKey=GlobalKey();
  GlobalKey<FormState> formKeyOtp=GlobalKey();
  String? endPointMobile;
  String? endPointOtp;
  String? mapKey;
  ApiResponse apiResponse=ApiResponse(status: Status.INITIAL);
  ApiResponse apiResponseOtp=ApiResponse(status: Status.INITIAL);
  bool enableMobileButton=false;

  ControllerMobileScreen({this.endPointMobile,this.endPointOtp,this.mapKey});


  sendOtpMethod() async {
    if(!formKey.currentState!.validate()) return;
    try{
      apiResponse=ApiResponse(status: Status.LOADING);
      update();
      var res=await NetworkManager().post("$endPointMobile",data: {
        mapKey:textEditingController.text
      });
      ModelX modelX=ModelX.fromJson(res);
      apiResponse=ApiResponse(status: Status.COMPLETED,data: modelX,message: modelX.message);
      if(modelX.status==200){
        Get.to(()=>const OtpScreen())!.then((onValue){
          if(onValue!=null){
            Get.back(result: onValue);
          }
        });
      }else{
        showToastError(modelX.message);
      }
    }catch(e){
      print("$e");
      apiResponse=ApiResponse(status: Status.ERROR,message: "$e");
      showToastError("$e");
    }
    update();
  }

  verifyOtp() async {
    if(!formKeyOtp.currentState!.validate()) return;
    try{
      apiResponseOtp=ApiResponse(status: Status.LOADING);
      update();
      var res=await NetworkManager().post(endPointOtp!,data: {
        mapKey:textEditingController.text,
        "otp":textEditingControllerOtp.text
      });
      ModelX modelX=ModelX.fromJson(res);
      apiResponseOtp=ApiResponse(status: Status.COMPLETED,data: modelX,message: modelX.message);
      if(modelX.status==200) {
        boxModular.write(UtilsModular.user, res);
        Get.back(result: res);
      }else{
        showToastError(modelX.message);
      }
    }catch(e){
      apiResponseOtp=ApiResponse(status: Status.ERROR,message: "$e");
      showToastError("$e");
    }
    update();
  }
}