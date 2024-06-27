import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/app_routes.dart';

class OtpController extends GetxController {
  late String otpCode = '';

  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;
  FocusNode? pin5FocusNode;

  checkOtp() {}
  nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();

    }
  }

  goToResetPassword() {
    Get.offNamed(Routes.resetPassword);
  }

  resendOtp() {}

  @override
  void onInit() {
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    pin5FocusNode = FocusNode();
    super.onInit();
  }

  @override
  void dispose() {
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
    pin5FocusNode!.dispose();

    super.dispose();
  }
}
