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
          appBar: AppBar(),
          body: GetBuilder<ResetPasswordController>(
            builder: (controller) {
              return controller.statusRequest.value == StatusRequest.loading
                  ? const Center(child: CircularProgressIndicator())
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: size.height * .03),
                          Text(
                            'Set new password',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          SizedBox(height: size.height * .01),
                          Text(
                            'Your new password must be different from previously used passwords',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(height: 1.5),
                          ),
                          SizedBox(height: size.height * .02),
                          ResetPasswordForm(controller: controller),
                          const Spacer(),
                          CustomButton(
                            backgroundColor: AppColor.primaryColor,
                            foregroundColor: Colors.white,
                            text: 'Change password',
                            press: controller.resetPassword,
                          ),
                          SizedBox(height: size.height * .06),
                        ],
                      ),
                    );
            },
          )),
    );
  }
}

