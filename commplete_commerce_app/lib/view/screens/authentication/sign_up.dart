import 'package:commplete_commerce_app/core/class/status_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/authentication/sign_up_controller.dart';
import '../../../core/constant/constants.dart';
import '../../../core/constant/color.dart';
import '../../widgets/authentication/account_prompt.dart';
import '../../widgets/authentication/sign_up/sign_up_form.dart';
import '../../widgets/authentication/social_icons.dart';
import '../../widgets/custom_button.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpController());

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Sign Up')),
        body: GetBuilder<SignUpController>(builder: (controller) {
          return controller.statusRequest.value == StatusRequest.loading
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: size.height * .05),
                        Text('Register Account',
                            style: Get.textTheme.displayLarge),
                        SizedBox(height: size.height * .03),
                        Text(
                          'Complete your details or continue\nwith social media',
                          style:
                              Get.textTheme.labelSmall!.copyWith(height: 1.5),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: size.height * .04),
                        SignUpFrom(controller: controller),
                        SizedBox(height: size.height * .02),
                        CustomButton(
                          backgroundColor: AppColor.primaryColor,
                          foregroundColor: Colors.white,
                          text: 'Continue',
                          press: controller.signUp,
                          widthRatio: .85,
                        ),
                        SizedBox(height: size.height * .03),
                        const SocialIcons(),
                        SizedBox(height: size.height * .02),
                        AccountPrompt(
                          promptText: 'Have an account? ',
                          actionText: 'Sign In',
                          onActionPressed: controller.goToSignIn,
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
