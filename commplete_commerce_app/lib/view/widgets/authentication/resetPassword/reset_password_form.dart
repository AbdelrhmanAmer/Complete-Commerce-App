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
                labelText: "Password",
                hintText: "Enter your password",
                iconData: Icons.lock_outline),
            controller: controller.password,
            obscureText: true,
            validator: (value) {
              return validateInput(value!, 'password', min: 8, max: 50);
            },
          ),
          SizedBox(height: size.height * .03),
          TextFormField(
            decoration: inputDecoration(
                labelText: "Confirm Password",
                hintText: "Re-Enter your password",
                iconData: Icons.lock_outline),
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
