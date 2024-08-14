import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../core/functions/handle_response_status.dart';
import '../../data/data_source/remote/auth/check_email_data.dart';
import '../../core/class/status_request.dart';
import '../../core/constant/app_routes.dart';

class ForgotPasswordController extends GetxController {
  final CheckEmailData checkEmailData = CheckEmailData(Get.find());

  Rx<StatusRequest> statusRequest = StatusRequest.error.obs;
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController email;
  

  checkEmail() async {
    FormState? formData = formState.currentState;
    if (formData == null) {
      log('FormState is null. Cannot validate form.');
      return;
    }

    if (formData!.validate()) {
      statusRequest.value = StatusRequest.loading;
      update();

      var response = await checkEmailData.postData(email.text);

      statusRequest.value = handleResponseStatus(response);
      update();

      log('FogotPasswordController.dart: Controller ${response.toString()}');
      log('FogotPasswordController.dart: StatusRequest= ${statusRequest.value.toString()} ');
      if (statusRequest.value == StatusRequest.success) {
        Get.toNamed(Routes.otpResetPassword);
      }
    }
  }

  goToSignUp() {
    Get.offAllNamed(Routes.signUp);
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
