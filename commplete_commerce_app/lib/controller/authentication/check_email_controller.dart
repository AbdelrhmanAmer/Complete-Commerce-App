import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../core/constant/app_routes.dart';

class CheckEmailController extends GetxController {
  late TextEditingController email;

  goToOtpSignUp() {
    Get.offNamed(Routes.otpSignUp);
  }

  @override
  void onInit() {
    super.onInit();
    email = TextEditingController();
    updateEmail();
  }

  void updateEmail() {
    final emailArg = Get.arguments != null && Get.arguments is Map
        ? Get.arguments['email'] as String
        : '';
    email.text = emailArg;
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
