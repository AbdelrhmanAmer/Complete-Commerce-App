import 'package:get/get.dart';

import '../core/constant/app_routes.dart';
 

class SignInController extends GetxController{
  var remember = false.obs;

  login(){

  }
  goToSignUp(){
    Get.toNamed(Routes.signUp);
  }

}