import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/data_source/remote/auth/otp_sign_up_data.dart';
import '../../core/class/status_request.dart';
import '../../core/constant/app_routes.dart';
import '../../core/functions/handle_data.dart';

class OtpSignUpController extends GetxController {
  late List<String> otpCode = List.filled(5, '');
  String? email;
  OtpSignUpData otpSignUpData = OtpSignUpData(Get.find());
  StatusRequest? statusRequest;

  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;
  FocusNode? pin5FocusNode;

  List<FocusNode?>? focusNodes;

  checkOtp() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await otpSignUpData.postData(email!, otpCode.join(''));

    statusRequest = handleData(response);
    print('OtpSignUpController.dart: Controller $response');
    print('OtpSignUpController.dart: StatusRequest= $statusRequest ');

    if (statusRequest == StatusRequest.success) {
      if (response is Map) {
        Get.offAllNamed(Routes.successSignUp);
      }
    }
    update();
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
