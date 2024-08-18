import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/functions/validate_input.dart';
import '../../../../core/constant/constants.dart';
import '../../../../controller/authentication/sign_up_controller.dart';
import '../../input_decoration.dart';

class SignUpFrom extends StatelessWidget {
  const SignUpFrom({
    super.key,
    required this.controller,
  });

  final SignUpController controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formState,
      child: Column(
        children: [
          TextFormField(
            style: Get.textTheme.bodyMedium,
            decoration: inputDecoration(
              labelText: "Username",
              hintText: "Enter your username",
              iconData: Icons.person_2_outlined,
            ),
            validator: (val) {
              return validateInput(val!, 'username', min: 8);
            },
            controller: controller.username,
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: size.height * .03),
          TextFormField(
            style: Get.textTheme.bodyMedium,
            decoration: inputDecoration(
              labelText: "Email",
              hintText: "Enter your email",
              iconData: Icons.email_outlined,
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
              labelText: "Phone",
              hintText: "Enter your phone",
              iconData: Icons.local_phone_outlined,
            ),
            validator: (val) {
              return validateInput(val!, 'phone');
            },
            controller: controller.phone,
            keyboardType: TextInputType.phone,
          ),
          SizedBox(height: size.height * .03),
          TextFormField(
            style: Get.textTheme.bodyMedium,
            decoration: inputDecoration(
              labelText: "Address",
              hintText: "Enter your address",
              iconData: Icons.map,
            ),
            controller: controller.address,
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: size.height * .03),
          Obx(
            () => TextFormField(
              style: Get.textTheme.bodyMedium,
              decoration: inputDecoration(
                labelText: "Password",
                hintText: "Enter your password",
                onpressed: controller.togglePasswordVisibility,
                pressed: true,
                iconData: controller.hiddenPassword.value
                    ? CupertinoIcons.eye
                    : CupertinoIcons.eye_slash,
              ),
              validator: (val) {
                return validateInput(val!, 'password', min: 6, max: 50);
              },
              controller: controller.password,
              obscureText: controller.hiddenPassword.value,
            ),
          ),
          SizedBox(height: size.height * .03),
        ],
      ),
    );
  }
}
