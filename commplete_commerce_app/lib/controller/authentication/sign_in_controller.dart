import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/constant/app_routes.dart';

class SignInController extends GetxController {
  RxBool remember = false.obs;
  RxBool hiddenPassword = true.obs;

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController email, password;

  togglePasswordVisibility() {
    hiddenPassword.value = !hiddenPassword.value;
  }
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