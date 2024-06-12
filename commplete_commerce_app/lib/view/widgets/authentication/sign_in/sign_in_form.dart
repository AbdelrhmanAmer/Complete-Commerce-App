import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/constants.dart';
import '../../../../controller/sign_in_controller.dart';
import '../../inputDecoration.dart';

class SignInForm extends StatelessWidget {
  SignInForm({
    super.key,
  });

  final signInController = Get.put(SignInController());
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
          ),
          SizedBox(height: size.height * .03),
          TextFormField(
            decoration: inputDecoration(
                labelText: "Password",
                hintText: "Enter your password",
                iconData: Icons.lock_outline),
            obscureText: true,
          ),
          SizedBox(height: size.height * .02),
          isSmallScreen
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Obx(
                          () => Checkbox(
                            value: signInController.remember.value,
                            onChanged: (newValue) {
                              signInController.remember.value = newValue!;
                            },
                          ),
                        ),
                        const Text("Remember Me"),
                      ],
                    ),
                    const SizedBox(height: 3),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "Forgot Password",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Obx(
                          () => Checkbox(
                            value: signInController.remember.value,
                            onChanged: (newValue) {
                              signInController.remember.value = newValue!;
                            },
                          ),
                        ),
                        const Text("Remember Me"),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "Forgot Password",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
