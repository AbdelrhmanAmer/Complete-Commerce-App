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
  late TextEditingController address;

  Rx<StatusRequest> signupStatusRequest = StatusRequest.error.obs;
  Rx<StatusRequest> setupProfileStatusRequest = StatusRequest.error.obs;

  GlobalKey<FormState> signupFormState = GlobalKey<FormState>();
  GlobalKey<FormState> setupFromState = GlobalKey<FormState>();

  SignUpData signUpData = SignUpData(Get.find());
  bool acceptTerms = false;

  setupProfile() async {
    FormState? setupFromData = setupFromState.currentState;
    if (setupFromData!.validate()) {
      setupProfileStatusRequest.value = StatusRequest.loading;
      update();

      var response = await signUpData.setupProfile(
        email: email.text,
        username: username.text,
        address: address.text,
        phone: phone.text,
      );

      setupProfileStatusRequest.value = handleResponseStatus(response);
      update();

      if (setupProfileStatusRequest.value == StatusRequest.success) {
        if (response is Map) {
          goToOtp();
        }
      }
    }
  }

  signUp() async {
    FormState? signupFromData = signupFormState.currentState;
    if (signupFromData!.validate()) {
      signupStatusRequest.value = StatusRequest.loading;
      update();

      var response = await signUpData.signUp(
        password: password.text,
        email: email.text,
      );

      signupStatusRequest.value = handleResponseStatus(response);
      update();

      if (signupStatusRequest.value == StatusRequest.success) {
        if (response is Map) {
          goToSetupProfile();
        }
      }
    }
  }

  toggleTermsState() {
    acceptTerms = !acceptTerms;
    update();
  }

  goToOtp() {
    Get.toNamed(Routes.otpSignUp, arguments: {'email': email.text});
  }

  goToSignIn() {
    Get.offNamed(Routes.signIn);
  }

  goToSetupProfile() {
    Get.offAllNamed(Routes.setupProfile);
  }

  @override
  void onInit() {
    username = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    address = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    phone.dispose();
    email.dispose();
    password.dispose();
    address.dispose();

    super.dispose();
  }
}
