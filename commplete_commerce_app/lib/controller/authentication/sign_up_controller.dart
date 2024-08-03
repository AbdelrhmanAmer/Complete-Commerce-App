import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../core/functions/handle_response_status.dart';
import '../../data/data_source/remote/auth/sign_up_data.dart';
import '../../core/class/status_request.dart';
import '../../core/constant/app_routes.dart';

class SignUpController extends GetxController {
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController phone;

  Rx<StatusRequest> statusRequest = StatusRequest.error.obs;
  RxBool hiddenPassword = true.obs;

  SignUpData signUpData = SignUpData(Get.find());
  List data = [];

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  togglePasswordVisibility() {
    hiddenPassword.value = !hiddenPassword.value;
  }

  signUp() async {
    FormState? formData = formState.currentState;
    if (formData!.validate()) {
      statusRequest.value = StatusRequest.loading;
      update();

      var response = await signUpData.postData(
          username.text, password.text, email.text, phone.text);

      statusRequest.value = handleResponseStatus(response);
      log('SignUpController.dart: Controller ${{response.toString()}}');
      log('SignUpController.dart: StatusRequest= ${statusRequest.value.toString()} ');

      if (statusRequest.value == StatusRequest.success) {
        if (response is Map) {
          Get.offNamed(Routes.otpSignUp, arguments: {
            'email': email.text,
          });
        }
      }
      update();
    } else {
      return "Not Valid Inputs";
    }
  }

  goToSignIn() {
    Get.offNamed(Routes.signIn);
  }

  @override
  void onInit() {
    username = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    phone.dispose();
    email.dispose();
    password.dispose();

    super.dispose();
  }
}
