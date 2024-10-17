import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/authentication/sign_up_controller.dart';
import '../../../../core/constant/constants.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/authentication/sign_up/setup_profile/personalImagePicker.dart';
import '../../../widgets/authentication/sign_up/setup_profile/setup_appbar.dart';
import '../../../widgets/authentication/sign_up/setup_profile/setup_profile_form.dart';

class SetupProfile extends StatelessWidget {
  const SetupProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<SignUpController>(
        builder: (controller) => Scaffold(
          appBar: setupAppbar(context),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const PersonalImagePicker(),
                SizedBox(height: size.height * .02),
                SetupProfileForm(controller: controller),
                const Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: 'Skip',
                        press: () => controller.goToOtp(),
                        foregroundColor: Theme.of(context).colorScheme.primary,
                        backgroundColor: Theme.of(context).colorScheme.surface,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: CustomButton(
                        text: 'Sign up',
                        press: () => controller.setupProfile(),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * .03),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
