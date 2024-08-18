import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/functions/validate_input.dart';
import '../../../../core/constant/constants.dart';
import '../../../../controller/authentication/sign_in_controller.dart';
import '../../input_decoration.dart';
import 'forgot_password_widget.dart';
import 'remeber_me_row.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
    required this.controller,
  });

  final SignInController controller;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isSmallScreen = screenWidth < 280; // Adjust the threshold as needed

    return Form(
      key: controller.formState,
      child: Column(
        children: [
          TextFormField(
            style: Get.textTheme.bodyMedium,
            decoration: inputDecoration(
              labelText: "Email",
              hintText: "Enter your email",
              iconData: Icons.email_outlined,
            ),
            controller: controller.email,
            validator: (value) => validateInput(value!, 'email'),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: size.height * .03),
          Obx(
            () => TextFormField(
              style: Get.textTheme.bodyMedium,
              decoration: inputDecoration(
                labelText: "Password",
                hintText: "Enter your password",
                iconData: controller.hiddenPassword.value
                    ? CupertinoIcons.eye
                    : CupertinoIcons.eye_slash,
                onpressed: controller.togglePasswordVisibility,
                pressed: true,
              ),
              validator: (value) =>
                  validateInput(value!, 'password', min: 6, max: 50),
              keyboardType: TextInputType.text,
              controller: controller.password,
              obscureText: controller.hiddenPassword.value,
            ),
          ),
          SizedBox(height: size.height * .02),
          isSmallScreen
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RemeberMeRow(signInController: controller),
                    const SizedBox(height: 3),
                    ForgotPasswordWidget(controller: controller)
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RemeberMeRow(signInController: controller),
                    ForgotPasswordWidget(controller: controller)
                  ],
                ),
        ],
      ),
    );
  }
}
