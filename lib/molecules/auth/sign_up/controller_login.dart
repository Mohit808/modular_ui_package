import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/utils/network_handling/network_manager.dart';

class ControllerLogin extends GetxController{
  TextEditingController textEditingControllerEmail=TextEditingController();
  TextEditingController textEditingControllerPass=TextEditingController();
  TextEditingController textEditingControllerConfirmPass=TextEditingController();
  TextEditingController textEditingControllerFirstName=TextEditingController();
  TextEditingController textEditingControllerLastName=TextEditingController();
  GlobalKey<FormState> formKey=GlobalKey();
  String selectedTab="Login";
  @override
  void onInit() {
    super.onInit();
  }

  loginFunction(){
    if(!formKey.currentState!.validate()) return;
  }
  createAccount(){
    if(!formKey.currentState!.validate()) return;
    print("qqwqewqe");
    NetworkManager().post("signUp",data: {
      "email":textEditingControllerEmail.text,
      "password":textEditingControllerPass.text,
      "firstName":textEditingControllerFirstName.text,
      "lastName":textEditingControllerLastName.text,
    });
  }

}