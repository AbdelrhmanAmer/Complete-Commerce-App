import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../core/constant/app_routes.dart';

class ResetPasswordController extends GetxController{

  late TextEditingController password;
  late TextEditingController repassword;

  goToSuccess(){
    Get.offNamed(Routes.successResetPassword);
  }

  @override
  void onInit() {
    password = TextEditingController();
    repassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
    super.dispose();
  }
}