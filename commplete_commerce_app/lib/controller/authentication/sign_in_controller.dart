import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/functions/set_shared_user.dart';
import '../../core/functions/show_custom_snack_bar.dart';
import '../../core/class/status_request.dart';
import '../../core/functions/handle_response_status.dart';
import '../../core/services/services.dart';
import '../../data/data_source/remote/auth/sign_in_data.dart';
import '../../core/constant/app_routes.dart';
import '../../data/model/user.dart';

class SignInController extends GetxController {
  RxBool remember = false.obs;
  Rx<StatusRequest> statusRequest = StatusRequest.error.obs;
  late User user;

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

      if (statusRequest.value == StatusRequest.success) {
        if (response['data']['approved'] == '1') {
          user = User.fromJson(response['data']);

          myServices.sharedPreferences.setString('step', '2');

          setSharedUser(user);
          Get.offAllNamed(Routes.root, arguments: {'user': user});

          showCustomSnackBar(
              title: response['status'], content: response['message']);
        } else if (response['data']['approved'] == '0') {
          Get.offNamed(Routes.otpSignUp, arguments: {'email': email.text});
          return;
        }
      }
    }
  }

  goToSignUp() {
    Get.offNamed(Routes.signUp);
  }

  goToForgotPassword() {
    Get.offNamed(Routes.passwordRecovery);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    user = User();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
