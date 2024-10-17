import 'package:get/get.dart';

import '../../../core/constant/app_routes.dart';
import '../../../data/data_source/remote/auth/forgotPassword/otp_reset_password_data.dart';

class ChooseVerificationMethodController extends GetxController {
  String? email;
  String? phone;
  bool sendEmail = true;

  final otpResetPasswordData = OtpResetPasswordData(Get.find());

  goToOtpScreen() {
    Get.toNamed(Routes.otpResetPassword, arguments: {'email': email});
  }

  toggleVerifyMethod() {
    sendEmail = !sendEmail;
    update();
  }

  sendEmailOtp() async {
    otpResetPasswordData.sendResetPasswordOtp(email!);
    Get.toNamed(
      Routes.otpResetPassword,
      arguments: {'email': email},
    );
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    phone = Get.arguments['phone'];

    super.onInit();
  }
}
