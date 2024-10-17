import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/functions/validate_input.dart';
import '../../../../core/constant/constants.dart';
import '../../../../controller/authentication/sign_up_controller.dart';
import '../input_decoration.dart';

class SignUpFrom extends StatelessWidget {
  const SignUpFrom({
    super.key,
    required this.controller,
  });

  final SignUpController controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.signupFormState,
      child: Column(
        children: [
          TextFormField(
            style: Get.textTheme.bodyMedium,
            decoration: inputDecoration(
              context,
              hintText: "Enter your email",
              iconPath: 'assets/icons/Message.svg',
            ),
            validator: (val) {
              return validateInput(val!, 'email');
            },
            controller: controller.email,
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: size.height * .02),
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
        ],
      ),
    );
  }
}
