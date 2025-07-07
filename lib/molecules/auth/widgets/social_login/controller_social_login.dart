import 'dart:developer';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ControllerSocialLogin extends GetxController{
  bool isGoogleLogin = false;
  bool isAppleLogin = false;

  loginWithGoogle()async{
    try{
      GoogleSignIn googleSignIn = GoogleSignIn(scopes: [
        'email'
      ],serverClientId: "232148425129-3q1hlbsv0uoppd0b2c7g3ubns7kqdrng.apps.googleusercontent.com");
      var googleAccount=await googleSignIn.signIn();

      GoogleSignInAuthentication googleSignInAuthentication=await googleAccount!.authentication;
      print("xxxxxxxxxxxx");
      // print(googleSignInAuthentication.accessToken);
      log("${googleSignInAuthentication.idToken}");
      return googleSignInAuthentication.idToken;

      // print(googleAccount.displayName);
      // print(googleAccount.id);
      // googleAccount.photoUrl;
      // googleAccount.email;
    }catch(e){}
  }

  loginWithApple(){

  }
}