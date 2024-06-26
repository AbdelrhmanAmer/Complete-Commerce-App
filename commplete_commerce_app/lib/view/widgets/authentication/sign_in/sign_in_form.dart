import 'package:flutter/material.dart';

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
      child: Column(
        children: [
          TextFormField(
            decoration: inputDecoration(
                labelText: "Email",
                hintText: "Enter your email",
                iconData: Icons.email_outlined),
            controller: controller.email,
          ),
          SizedBox(height: size.height * .03),
          TextFormField(
            decoration: inputDecoration(
                labelText: "Password",
                hintText: "Enter your password",
                iconData: Icons.lock_outline),
            controller: controller.password,
            obscureText: true,
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
