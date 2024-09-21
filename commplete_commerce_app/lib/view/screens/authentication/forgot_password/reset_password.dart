import 'package:commplete_commerce_app/core/class/status_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/authentication/forgotPassword/reset_password_controller.dart';
import '../../../../core/constant/constants.dart';
import '../../../../core/constant/color.dart';
import '../../../widgets/authentication/resetPassword/reset_password_form.dart';
import '../../../widgets/custom_button.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordController());

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(title: const Text('Reset Password')),
          body: GetBuilder<ResetPasswordController>(
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
                              'Reset Password',
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                            SizedBox(height: size.height * .03),
                            Text(
                              'Please enter your new password and confirm it\n',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(height: 1.5),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: size.height * .09),
                            ResetPasswordForm(controller: controller),
                            SizedBox(height: size.height * .22),
                            CustomButton(
                              backgroundColor: AppColor.primaryColor,
                              foregroundColor: Colors.white,
                              text: 'Continue',
                              press: controller.resetPassword,
                              width: .75,
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

