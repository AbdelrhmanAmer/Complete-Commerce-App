import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../core/constant/app_routes.dart';

class SignUpController extends GetxController {
  late TextEditingController username, email, phone, password;
  RxBool hiddenPassword = true.obs;

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  togglePasswordVisibility() {
    hiddenPassword.value = !hiddenPassword.value;
  }

  signUp() {
    var formData = formState.currentState;
    if (formData!.validate()) {
      Get.toNamed(Routes.otpSignUp);
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
