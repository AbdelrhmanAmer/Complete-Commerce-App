import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../core/functions/handle_response_status.dart';
import '../../../core/class/status_request.dart';
import '../../../core/constant/app_routes.dart';
import '../../../data/data_source/remote/auth/forgotPassword/otp_reset_password_data.dart';

class PasswordRecoveryController extends GetxController {
  final otpResetPasswordData = OtpResetPasswordData(Get.find());

  Rx<StatusRequest> statusRequest = StatusRequest.error.obs;
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController email;
  String? phone;

  checkEmail() async {
    FormState? formData = formState.currentState;
    if (formData == null) {
      return;
    }

    if (formData.validate()) {
      statusRequest.value = StatusRequest.loading;
      update();

      var response = await otpResetPasswordData.checkEmailExistence(email.text);
      statusRequest.value = handleResponseStatus(response);
      update();
      phone = response['data']['user_phone'];

      if (statusRequest.value == StatusRequest.success) {
        goToChooseVerificationMethodScreen();
      }
    }
  }

  goToChooseVerificationMethodScreen() {
    if (phone != null) {
      Get.toNamed(Routes.chooseVerificationMethod,
          arguments: {'email': email.text, 'phone': phone});
    } else {
      Get.toNamed(Routes.chooseVerificationMethod,
          arguments: {'email': email.text, 'phone': null});
    }
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
