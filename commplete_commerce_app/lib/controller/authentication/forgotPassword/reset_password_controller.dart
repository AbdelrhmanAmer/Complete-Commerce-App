import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_routes.dart';
import '../../../core/functions/handle_response_status.dart';
import '../../../core/functions/show_custom_snack_bar.dart';
import '../../../data/data_source/remote/auth/forgotPassword/reset_password_data.dart';
import '../../../core/class/status_request.dart';

class ResetPasswordController extends GetxController {
  String? email;
  late TextEditingController password;
  late TextEditingController repassword;
  Rx<StatusRequest> statusRequest = StatusRequest.error.obs;

  final ResetPasswordData _resetPasswordData = ResetPasswordData(Get.find());
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  resetPassword() async {
    FormState? formData = formState.currentState;
    if (formData!.validate()) {
      statusRequest.value = StatusRequest.loading;
      update();

      var response = await _resetPasswordData.postData(email!, password.text);
        
      statusRequest.value = handleResponseStatus(response);
      update();

      log('ResetPasswordController.dart: Controller ${response.toString()}');
      log('ResetPasswordController.dart: StatusRequest= ${statusRequest.value.toString()} ');
      if (statusRequest.value == StatusRequest.success) {
        Get.offAllNamed(Routes.signIn);
        showCustomSnackBar(
            title: response['status'], content: response['message']);
      }
    }
  }

  @override
  void onInit() {
    email = Get.arguments['email'];

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
