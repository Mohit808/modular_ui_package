import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ControllerSocialLogin extends GetxController{
  bool isGoogleLogin = false;
  bool isAppleLogin = false;

  loginWithGoogle(){
    GoogleSignIn _googleSignIn = GoogleSignIn();
    print(_googleSignIn);
    _googleSignIn.signIn();
  }

  loginWithApple(){

  }
}