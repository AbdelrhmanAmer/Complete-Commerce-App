import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/authentication/sign_in_controller.dart';
import '../../../core/class/status_request.dart';
import '../../../core/constant/constants.dart';
import '../../../core/constant/color.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/authentication/sign_in/sign_in_form.dart';
import '../../widgets/authentication/account_prompt.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignInController());

    return SafeArea(
      child: Scaffold(
        body: GetBuilder<SignInController>(
          builder: (controller) {
            return controller.statusRequest.value == StatusRequest.loading
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: size.height * .4,
                          child: Image.asset(
                            'assets/images/log-in.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: size.height * .022),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Welcome Back!',
                                  style:
                                      Theme.of(context).textTheme.displaySmall),
                              SizedBox(height: size.height * .01),
                              Text(
                                'Log in with your data that you entered during your registration. ',
                                style: Get.textTheme.labelMedium!
                                    .copyWith(height: 1.5),
                              ),
                              SizedBox(height: size.height * .02),
                              SignInForm(controller: controller),
                              SizedBox(height: size.height * .05),
                              Center(
                                child: CustomButton(
                                  backgroundColor: AppColor.primaryColor,
                                  foregroundColor: Colors.white,
                                  text: 'Log In',
                                  press: controller.signIn,
                                ),
                              ),
                              SizedBox(height: size.height * .02),
                              AccountPrompt(
                                promptText: 'Don\'t have an account? ',
                                actionText: 'Sign Up',
                                onActionPressed: controller.goToSignUp,
                              ),
                              SizedBox(height: size.height * .01),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}
