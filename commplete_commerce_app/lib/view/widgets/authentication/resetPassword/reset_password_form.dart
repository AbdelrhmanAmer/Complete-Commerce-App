import 'package:flutter/material.dart';

import '../../../../controller/authentication/forgotPassword/reset_password_controller.dart';
import '../../../../core/constant/constants.dart';
import '../../../../core/functions/validate_input.dart';
import '../input_decoration.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({
    super.key,
    required this.controller,
  });

  final ResetPasswordController controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formState,
      child: Column(
        children: [
          SizedBox(height: size.height * .03),
          TextFormField(
            decoration: inputDecoration(
              context,
              hintText: "Enter your password",
              iconPath: 'assets/icons/Lock.svg',
            ),
            validator: (val) {
              return validateInput(val!, 'password', min: 6, max: 50);
            },
            controller: controller.password,
            obscureText: true,
          ),
          SizedBox(height: size.height * .03),
          TextFormField(
            decoration: inputDecoration(
              context,
              hintText: "Re-Enter your password",
              iconPath: 'assets/icons/Lock.svg',
            ),
            controller: controller.rePassword,
            obscureText: true,
            validator: (value) {
              String? result =
                  validateInput(value!, 'password', min: 8, max: 50);
              if (result != null) {
                return result;
              }
              return validatePasswordMatch(controller.password.text, value);
            },
          ),
        ],
      ),
    );
  }
}
