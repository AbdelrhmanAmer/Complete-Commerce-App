import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/constants.dart';
import '../../../../core/constant/color.dart';
import '../../../../controller/authentication/otp_reset_pass_controller.dart';
import '../../../widgets/authentication/account_prompt.dart';
import '../../../widgets/authentication/otp_form.dart';
import '../../../widgets/custom_button.dart';

class OTPResetPassword extends StatelessWidget {
  const OTPResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(OtpController());

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('OTP Verification')),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: size.height * .05),
                Text(
                  'OTP Verification',
                  style: Get.textTheme.displayLarge,
                ),
                SizedBox(height: size.height * .03),
                Text(
                  'We have sent code to abdo@gmail.com',
                  style: Get.textTheme.labelSmall!.copyWith(height: 1.5),
                  textAlign: TextAlign.center,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'The Code will expired in ',
                      style: Get.textTheme.labelSmall!.copyWith(height: 1.5),
                    ),
                    TweenAnimationBuilder(
                        tween: Tween(begin: 60, end: 0.0),
                        duration: const Duration(seconds: 60),
                        builder: (_, value, child) {
                          return Text(
                            '00:${value.toInt()}',
                            style: const TextStyle(
                                fontSize: 14, color: AppColor.primaryColor),
                          );
                        })
                  ],
                ),
                SizedBox(height: size.height * .19),
                OTPForm(controller: controller),
                SizedBox(height: size.height * .20),
                CustomButton(
                  backgroundColor: AppColor.primaryColor,
                  foregroundColor: Colors.white,
                  text: 'Continue',
                  press: controller.goToResetPassword,
                  widthRatio: .85,
                ),
                SizedBox(height: size.height * .04),
                AccountPrompt(
                  promptText: '',
                  actionText: 'Resend OTP Code',
                  buttonTextColor: AppColor.grey.withOpacity(.6),
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
