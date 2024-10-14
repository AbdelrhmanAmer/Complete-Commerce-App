import 'package:commplete_commerce_app/core/class/status_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/authentication/sign_up_controller.dart';
import '../../../core/constant/constants.dart';
import '../../../core/constant/color.dart';
import '../../widgets/authentication/account_prompt.dart';
import '../../widgets/authentication/sign_up/sign_up_form.dart';
import '../../widgets/authentication/sign_up/terms_of_services_checkbox.dart';
import '../../widgets/custom_button.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpController());

    return SafeArea(
      child: Scaffold(
        body: GetBuilder<SignUpController>(builder: (controller) {
          return controller.statusRequest.value == StatusRequest.loading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: size.height * .4,
                        child: Image.asset(
                          'assets/images/ecommerce.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: size.height * .02),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Let\'s Get Started!',
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(
                                      fontWeight: FontWeight.w500,
                                    )),
                            const SizedBox(height: 6),
                            Text(
                              'Please enter your valid data in order to create an account.',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(
                                    height: 1.5,
                                  ),
                            ),
                            SizedBox(height: size.height * .02),
                            SignUpFrom(controller: controller),
                            SizedBox(height: size.height * .02),
                            const TermsOfServiceCheckBox(),
                            SizedBox(height: size.height * .035),
                            Center(
                              child: CustomButton(
                                backgroundColor: AppColor.primaryColor,
                                foregroundColor: Colors.white,
                                text: 'Sign up',
                                press: controller.signUp,
                              ),
                            ),
                            // SizedBox(height: size.height * .03),
                            // const SocialIcons(),
                            SizedBox(height: size.height * .02),
                            AccountPrompt(
                              promptText: 'Do you have an account ? ',
                              actionText: 'Log in',
                              onActionPressed: controller.goToSignIn,
                            ),
                            SizedBox(height: size.height * .01),
                          ],
                        ),
                      )
                    ],
                  ),
                );
        }),
      ),
    );
  }
}
