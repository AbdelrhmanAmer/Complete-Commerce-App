import 'package:commplete_commerce_app/core/class/status_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constant/constants.dart';
import '../../../../controller/authentication/otp_sign_up_controller.dart';
import '../../../../../core/constant/color.dart';
import '../../../../core/functions/maskEmail.dart';
import '../../../widgets/authentication/otp_form.dart';
import '../../../widgets/authentication/timer.dart';
import '../../../widgets/custom_button.dart';

class OtpSignUp extends StatelessWidget {
  const OtpSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OtpSignUpController());

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: GetBuilder<OtpSignUpController>(
          builder: (controller) => controller.statusRequest.value ==
                  StatusRequest.loading
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: size.height * .05),
                      Text(
                        'Verification code',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'We have sent the code verification to ',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Flexible(
                            child: Text(maskEmail(controller.email!),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(fontWeight: FontWeight.bold)),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Change email ?',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color: AppColor.primaryColor,
                                      fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: size.height * .01),
                      OTPForm(controller: controller),
                      SizedBox(height: size.height * .01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Resend code after ',
                              style: Theme.of(context).textTheme.labelMedium),
                          const Timer(hours: 0, minutes: 2, seconds: 0)
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                              foregroundColor: AppColor.primaryColor,
                              backgroundColor: Colors.white,
                              text: 'Resend',
                              press: controller.resendOtp,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: CustomButton(
                              backgroundColor: AppColor.primaryColor,
                              foregroundColor: Colors.white,
                              text: 'Confirm',
                              press: controller.confirmOtp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * .06),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
