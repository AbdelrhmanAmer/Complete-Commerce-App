import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/constants.dart';
import '../../../../controller/sign_in_controller.dart';
import '../../input_decoration.dart';
import 'forgot_password.dart';
import 'remeber_me_row.dart';

class SignInForm extends StatelessWidget {
  SignInForm({
    super.key,
  });

  final controller = Get.put(SignInController());

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
                    const ForgotPassword()
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RemeberMeRow(signInController: controller),
                    const ForgotPassword()
                  ],
                ),
        ],
      ),
    );
  }
}
