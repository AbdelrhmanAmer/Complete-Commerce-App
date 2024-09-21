import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/authentication/sign_in_controller.dart';
import '../../../core/class/status_request.dart';
import '../../../core/constant/constants.dart';
import '../../../core/constant/color.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/authentication/sign_in/sign_in_form.dart';
import '../../widgets/authentication/account_prompt.dart';
import '../../widgets/authentication/social_icons.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignInController());

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: GetBuilder<SignInController>(builder: (controller) {
        return controller.statusRequest.value == StatusRequest.loading
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: size.height * .01),
                      SizedBox(
                        height: size.height * .2,
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: CircleAvatar(
                            child:
                                Image.asset('assets/images/logo.png', scale: 1),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * .02),
                      Text('Welcome Back', style: Theme.of(context).textTheme.displayLarge),
                      SizedBox(height: size.height * .02),
                      Text(
                        'Sign in with your email and password\n or continue with social media',
                        style: Get.textTheme.labelSmall!.copyWith(height: 1.5),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: size.height * .03),
                      SignInForm(controller: controller),
                      SizedBox(height: size.height * .02),
                      CustomButton(
                        backgroundColor: AppColor.primaryColor,
                        foregroundColor: Colors.white,
                        text: 'Sign In',
                        press: controller.signIn,
                        width: .85,
                      ),
                      SizedBox(height: size.height * .02),
                      const SocialIcons(),
                      SizedBox(height: size.height * .01),
                      AccountPrompt(
                        promptText: 'Don\'t have an account? ',
                        actionText: 'Sign Up',
                        onActionPressed: controller.goToSignUp,
                      ),
                      SizedBox(height: size.height * .01),
                    ],
                  ),
                ),
              );
      }),
    ));
  }
}
