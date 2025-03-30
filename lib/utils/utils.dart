import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';

import '../common_widget/border_atom.dart';
import '../theme/app_colors.dart';
import '../theme/app_sizes.dart';
String token="";
late GetStorage box;


showToast(msg){
  Fluttertoast.showToast(msg: msg);
}
showToastSuccess(msg){
  Fluttertoast.showToast(msg: msg,backgroundColor: Colors.green);
}
showToastError(msg){
  Fluttertoast.showToast(msg: msg,backgroundColor: Colors.red);
}

var closeLoading;
showLoading(){
  closeLoading = BotToast.showLoading();
}

hideKeyboard(){
  SystemChannels.textInput.invokeMethod('TextInput.hide');
  FocusManager.instance.primaryFocus?.unfocus();
}


class Utils{
  init({colorCode, double? radius,LinearGradient? gradient,Color? textFieldBackgroundColor}){
    setUpThemeColor(colorCode??0xFF345259); //0xFF345259
    AppColors.textFieldBackgroundColor=textFieldBackgroundColor;
    BorderAtom.setRadius= BorderRadius.circular(radius??AppSizes.h_4); //AppSizes.h_10
    BorderAtom.setRadiusTextField= BorderRadius.circular(radius??AppSizes.h_4); //AppSizes.h_10
    BorderAtom.borderRadiusValue = radius??AppSizes.h_4;
    GradientAtom.gradient=gradient;
    initialize();
  }

  setUpThemeColor(code){
    AppColors.materialColor=MaterialColor(code, <int, Color>{
      50: Color(code),
      100: Color(code),
      200: Color(code),
      300: Color(code),
      400: Color(code),
      500: Color(code),
      600: Color(code),
      700: Color(code),
      800: Color(code),
      900: Color(code),
    });
  }

  static String userToken="token";
  static String user="user";

  initialize() async {
    await GetStorage.init();
    box=GetStorage();
    var value=box.read(Utils.userToken);
    if(value!=null){
      token=value;
      print("TOKEEEEN= $token");
    }
  }

}
