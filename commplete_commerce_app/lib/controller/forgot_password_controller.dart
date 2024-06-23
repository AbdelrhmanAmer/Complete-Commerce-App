import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../core/constant/app_routes.dart';
 

class ForgotPasswordController extends GetxController{
  var remember = false.obs;

  late TextEditingController email;

  goToVerfyCode(){

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