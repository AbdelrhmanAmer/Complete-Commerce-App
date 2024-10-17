import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/status_request.dart';
import '../../../data/data_source/remote/auth/forgotPassword/otp_reset_password_data.dart';
import '../../../core/constant/app_routes.dart';
import '../../../core/functions/handle_response_status.dart';

class OtpResetPasswordController extends GetxController {
  late List<String> otpCode = List.filled(5, '');
  final otpResetPasswordData = OtpResetPasswordData(Get.find());

  Rx<StatusRequest> statusRequest = StatusRequest.error.obs;
  String? email;

  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;

  List<FocusNode?>? focusNodes;

  confirmOtp() async {
    statusRequest.value = StatusRequest.loading;
    update();

    var response =
        await otpResetPasswordData.verifyResetOtp(email!, otpCode.join(''));

    statusRequest.value = handleResponseStatus(response);
    update();

    if (statusRequest.value == StatusRequest.success) {
      if (response is Map) {
        Get.toNamed(Routes.resetPassword, arguments: {'email': email});
      }
    }
  }

  nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  goToResetPassword() {
    Get.offAllNamed(Routes.resetPassword);
  }

  resendOtp() {
    otpResetPasswordData.sendResetPasswordOtp(email!);
  }

  @override
  void onInit() {
    email = Get.arguments['email'];

    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    focusNodes = [pin2FocusNode, pin3FocusNode, pin4FocusNode];
    super.onInit();
  }

  @override
  void dispose() {
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();

    super.dispose();
  }
}
