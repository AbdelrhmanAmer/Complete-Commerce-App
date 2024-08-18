import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/functions/show_custom_snackbar.dart';
import '../../core/class/status_request.dart';
import '../../core/functions/handle_response_status.dart';
import '../../core/services/services.dart';
import '../../data/data_source/remote/auth/sign_in_data.dart';
import '../../core/constant/app_routes.dart';

class SignInController extends GetxController {
  RxBool remember = false.obs;
  RxBool hiddenPassword = true.obs;
  Rx<StatusRequest> statusRequest = StatusRequest.error.obs;

  SignInData signInData = SignInData(Get.find());

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  MyServices myServices = Get.find();

  late TextEditingController email, password;

  signIn() async {
    FormState? formData = formState.currentState;
    if (formData!.validate()) {
      statusRequest.value = StatusRequest.loading;
      update();

      var response = await signInData.postData(email.text, password.text);

      statusRequest.value = handleResponseStatus(response);
      update();

      log('SignInController.dart: Controller ${response.toString()}');
      log('SignInController.dart: StatusRequest= ${statusRequest.value.toString()} ');
      if (statusRequest.value == StatusRequest.success) {

        myServices.sharedPreferences.setString('id', response['data']['user_id'].toString());
        myServices.sharedPreferences.setString('email', response['data']['email']);
        myServices.sharedPreferences.setString('phone', response['data']['phone']);
        myServices.sharedPreferences.setString('username', response['data']['username']);
        myServices.sharedPreferences.setString('address', response['data']['address']);
        myServices.sharedPreferences.setString('step', '2');
        

        Get.offAllNamed(Routes.home);
        showCustomSnackbar(
            title: response['status'], content: response['message']);
      }
    }
  }

  togglePasswordVisibility() {
    hiddenPassword.value = !hiddenPassword.value;
  }

  goToSignUp() {
    Get.offNamed(Routes.signUp);
  }

  goToForgotPassword() {
    Get.offNamed(Routes.forgotPassword);
  }

  @override
  void onInit() {

    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
