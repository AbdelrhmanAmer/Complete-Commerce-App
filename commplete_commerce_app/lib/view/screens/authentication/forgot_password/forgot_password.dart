import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/authentication/forgotPassword/forgot_password_controller.dart';
import '../../../../core/functions/validate_input.dart';
import '../../../../core/class/status_request.dart';
import '../../../../core/constant/constants.dart';
import '../../../../core/constant/color.dart';
import '../../../widgets/authentication/account_prompt.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/authentication/input_decoration.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgotPasswordController());

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Forgot Passwword')),
        body: GetBuilder<ForgotPasswordController>(builder: (controller) {
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
                          'Check Email',
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        SizedBox(height: size.height * .03),
                        Text(
                          'Please enter you email and we will send\n you a OTP to reutrn your account',
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(height: 1.5),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: size.height * .19),
                        Form(
                          key: controller.formState,
                          child: TextFormField(
                            decoration: inputDecoration(
                              labelText: "Email",
                              hintText: "Enter your email",
                              iconData: Icons.email_outlined,
                            ),
                            controller: controller.email,
                            validator: (value) {
                              return validateInput(value!, 'email');
                            },
                          ),
                        ),
                        SizedBox(height: size.height * .22),
                        CustomButton(
                          backgroundColor: AppColor.primaryColor,
                          foregroundColor: Colors.white,
                          text: 'Continue',
                          press: controller.checkEmail,
                          width: .85,
                        ),
                        SizedBox(height: size.height * .04),
                        AccountPrompt(
                          promptText: 'Don\'t have an account?',
                          actionText: 'Sign Up',
                          onActionPressed: controller.goToSignUp,
                        ),
                        SizedBox(height: size.height * .01),
                      ],
                    ),
                  ),
                );
        }),
      ),
    );
  }
}
