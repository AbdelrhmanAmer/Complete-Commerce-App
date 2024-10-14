import 'package:get/get.dart';

import '../../../core/constant/app_routes.dart';

class ChooseVerificationMethodController extends GetxController {
  String? email;
  String? phone;

  goToOtpScreen() {
    Get.toNamed(Routes.otpResetPassword, arguments: {'email': email});
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    phone = Get.arguments['phone'];

    super.onInit();
  }
}
