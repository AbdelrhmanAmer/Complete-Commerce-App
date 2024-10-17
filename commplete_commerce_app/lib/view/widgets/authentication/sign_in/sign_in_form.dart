import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/functions/validate_input.dart';
import '../../../../core/constant/constants.dart';
import '../../../../controller/authentication/sign_in_controller.dart';
import '../input_decoration.dart';
import 'forgot_password_widget.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
    required this.controller,
  });

  final SignInController controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formState,
      child: Column(
        children: [
          TextFormField(
            style: Get.textTheme.bodyMedium,
            decoration: inputDecoration(
              context,
              hintText: "Email address",
              iconPath: 'assets/icons/Message.svg',
            ),
            validator: (val) {
              return validateInput(val!, 'email');
            },
            controller: controller.email,
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: size.height * .03),
          TextFormField(
            style: Get.textTheme.bodyMedium,
            decoration: inputDecoration(
              context,
              hintText: "Password",
              iconPath: 'assets/icons/Lock.svg',
            ),
            validator: (val) {
              return validateInput(val!, 'password', min: 6, max: 50);
            },
            controller: controller.password,
            obscureText: true,
          ),
          SizedBox(height: size.height * .004),
          const ForgotPasswordWidget(),
        ],
      ),
    );
  }
}
