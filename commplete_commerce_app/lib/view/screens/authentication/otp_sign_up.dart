import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/constants.dart';
import '../../../controller/authentication/otp_sign_up_controller.dart';
import '../../../../core/constant/color.dart';
import '../../widgets/authentication/account_prompt.dart';
import '../../widgets/authentication/otp_form.dart';
import '../../widgets/authentication/timer.dart';
import '../../widgets/custom_button.dart';

class OTPSignUp extends StatelessWidget {
  const OTPSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(OtpSignUpController());

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('OTP Sign Up Verification')),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: size.height * .05),
                Text(
                  'OTP Sign Up Verification',
                  style: Get.textTheme.displayLarge,
                ),
                SizedBox(height: size.height * .03),
                Text(
                  'We have sent code to ${controller.email}',
                  style: Get.textTheme.labelSmall!.copyWith(height: 1.5),
                  textAlign: TextAlign.center,
                ),
                const Timer(
                  begin: 120,
                  end: 0,
                  duration: 120,
                ),
                SizedBox(height: size.height * .03),
                OTPForm(controller: controller),
                SizedBox(height: size.height * .30),
                CustomButton(
                  backgroundColor: AppColor.primaryColor,
                  foregroundColor: Colors.white,
                  text: 'Continue',
                  press: () => controller.checkOtp(),
                  widthRatio: .85,
                ),
                SizedBox(height: size.height * .04),
                AccountPrompt(
                  promptText: '',
                  actionText: 'Resend OTP Code',
                  buttonTextColor: AppColor.lightGrey.withOpacity(.6),
                  textDecoration: TextDecoration.underline,
                  onActionPressed: controller.resendOtp,
                ),
                SizedBox(height: size.height * .01),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
