import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/authentication/forgotPassword/password_recovery_controller.dart';
import '../../../../core/functions/validate_input.dart';
import '../../../../core/class/status_request.dart';
import '../../../../core/constant/constants.dart';
import '../../../../core/constant/color.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/authentication/input_decoration.dart';

class PasswordRecovery extends StatelessWidget {
  const PasswordRecovery({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PasswordRecoveryController());

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: GetBuilder<PasswordRecoveryController>(builder: (controller) {
          return controller.statusRequest.value == StatusRequest.loading
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: size.height * .03),
                      Text(
                        'Password recovery',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      SizedBox(height: size.height * .01),
                      Text(
                        'Enter your E-mail address to recover your password',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(height: 1.5),
                      ),
                      SizedBox(height: size.height * .02),
                      Form(
                        key: controller.formState,
                        child: TextFormField(
                          style: Get.textTheme.bodyMedium,
                          decoration: inputDecoration(
                            hintText: "Email address",
                            iconPath: 'assets/icons/Message.svg',
                          ),
                          validator: (val) {
                            return validateInput(val!, 'email');
                          },
                          controller: controller.email,
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      const Spacer(),
                      Center(
                        child: CustomButton(
                          backgroundColor: AppColor.primaryColor,
                          foregroundColor: Colors.white,
                          text: 'Next',
                          press: controller.checkEmail,
                        ),
                      ),
                      SizedBox(height: size.height * .06),
                    ],
                  ),
                );
        }),
      ),
    );
  }
}
