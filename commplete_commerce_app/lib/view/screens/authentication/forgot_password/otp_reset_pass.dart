import 'package:commplete_commerce_app/core/class/status_request.dart';
import 'package:commplete_commerce_app/view/widgets/authentication/timer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/constants.dart';
import '../../../../core/constant/color.dart';
import '../../../../controller/authentication/forgotPassword/otp_reset_pass_controller.dart';
import '../../../widgets/authentication/account_prompt.dart';
import '../../../widgets/authentication/otp_form.dart';
import '../../../widgets/custom_button.dart';

class OTPResetPassword extends StatelessWidget {
  const OTPResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OtpResetPasswordController());

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(title: const Text('OTP Verification')),
          body: GetBuilder<OtpResetPasswordController>(
            builder: (controller) {
              return controller.statusRequest.value == StatusRequest.loading
                  ? const Center(child: CircularProgressIndicator())
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: size.height * .05),
                            Text(
                              'OTP Verification',
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                            SizedBox(height: size.height * .03),
                            Text(
                              'We have sent code to ${controller.email}',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(height: 1.5),
                              textAlign: TextAlign.center,
                            ),
                            const Timer(
                              hours: 0,
                              minutes: 0,
                              seconds: 0,
                            ),
                            SizedBox(height: size.height * .19),
                            OTPForm(controller: controller),
                            SizedBox(height: size.height * .20),
                            CustomButton(
                              backgroundColor: AppColor.primaryColor,
                              foregroundColor: Colors.white,
                              text: 'Continue',
                              press: controller.checkOtp,
                              widthRatio: .85,
                            ),
                            SizedBox(height: size.height * .04),
                            AccountPrompt(
                              promptText: '',
                              actionText: 'Resend OTP Code',
                              textDecoration: TextDecoration.underline,
                              onActionPressed: controller.resendOtp,
                            ),
                            SizedBox(height: size.height * .01),
                          ],
                        ),
                      ),
                    );
            },
          )),
    );
  }
}
