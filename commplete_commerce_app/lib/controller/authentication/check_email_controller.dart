import 'package:commplete_commerce_app/core/constant/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckEmailController extends GetxController {
  late TextEditingController email;

  goToSuccessSignUp() {
    Get.offNamed(Routes.successSignUp);
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
