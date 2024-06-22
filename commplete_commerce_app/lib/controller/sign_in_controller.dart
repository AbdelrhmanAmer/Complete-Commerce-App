import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../core/constant/app_routes.dart';
 

class SignInController extends GetxController{
  var remember = false.obs;

  late TextEditingController email, password;

  login(){

  }
  goToSignUp(){
    Get.toNamed(Routes.signUp);
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