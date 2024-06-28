import 'package:commplete_commerce_app/core/constant/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckEmailController extends GetxController {
  late TextEditingController email;

  goToOtpSignUp() {
    Get.offNamed(Routes.otpSignUp);
  }

  @override
  void onInit() {
    super.onInit();
    final emailArg = Get.arguments is Map ? Get.arguments['email'] as String : '';
    email = TextEditingController(text: emailArg);
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
