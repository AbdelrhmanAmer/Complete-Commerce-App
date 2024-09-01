import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/functions/show_custom_snackbar.dart';
import '../../data/data_source/remote/auth/otp_sign_up_data.dart';
import '../../core/class/status_request.dart';
import '../../core/constant/app_routes.dart';
import '../../core/functions/handle_response_status.dart';

class OtpSignUpController extends GetxController {
  late List<String> otpCode = List.filled(5, '');
  String? email;
  OtpSignUpData otpSignUpData = OtpSignUpData(Get.find());
  Rx<StatusRequest> statusRequest = StatusRequest.error.obs;

  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;
  FocusNode? pin5FocusNode;

  List<FocusNode?>? focusNodes;

  checkOtp() async {
    statusRequest.value = StatusRequest.loading;
    update();

    var response = await otpSignUpData.postData(email!, otpCode.join(''));

    statusRequest.value = handleResponseStatus(response);
    update();

    log('OtpSignUpController.dart: Controller ${response.toString()}');
    log('OtpSignUpController.dart: StatusRequest= ${statusRequest.toString()} ');

    if (statusRequest.value == StatusRequest.success) {
      if (response is Map) {
        showCustomSnackbar(
          title: response['status'],
          content: response['message'],
        );
        Get.offAllNamed(Routes.signIn);
      }
    }
  }

  nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  resendOtp() {}

  @override
  void onInit() {
    email = Get.arguments['email'];

    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    pin5FocusNode = FocusNode();
    focusNodes = [pin2FocusNode, pin3FocusNode, pin4FocusNode, pin5FocusNode];
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
