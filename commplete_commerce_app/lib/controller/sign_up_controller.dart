import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../core/constant/app_routes.dart';

class SignUpController extends GetxController {
  late TextEditingController username, email, phone, password;

  login() {}
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
