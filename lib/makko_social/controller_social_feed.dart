import 'package:get/get.dart';

class ControllerSocialFeed extends GetxController{
  bool layoutChanged=false;

  changeLayout(){
    layoutChanged=!layoutChanged;
    update();
  }
}