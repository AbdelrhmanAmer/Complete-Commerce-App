import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../core/constant/app_routes.dart';
 

class ForgotPasswordController extends GetxController{

  late TextEditingController email;

  checkEmail(){
    
  }
  goToOtp(){
    Get.toNamed(Routes.otp);
  }
  goToSignUp(){
    Get.offNamed(Routes.signUp);
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}