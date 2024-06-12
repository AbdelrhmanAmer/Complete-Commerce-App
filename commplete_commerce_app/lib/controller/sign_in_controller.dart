import 'package:commplete_commerce_app/core/constant/app_routes.dart';
import 'package:get/get.dart';

 

class SignInController extends GetxController{
  var remember = false.obs;

  login(){

  }
  goToSignUp(){
    Get.toNamed(Routes.signUp);
  }

}