import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../core/constant/app_routes.dart';
 

class SignInController extends GetxController{
  var remember = false.obs;

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController email, password;

  signIn(){
    var formData = formState.currentState;
    if(formData!.validate()){

    }else{
      return "Not Valid Sign In";
    }
  }
  goToSignUp(){
    Get.offNamed(Routes.signUp);
  }
  goToForgotPassword(){
    Get.offNamed(Routes.forgotPassword);
  }
  
  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    
    super.dispose();
  }
}