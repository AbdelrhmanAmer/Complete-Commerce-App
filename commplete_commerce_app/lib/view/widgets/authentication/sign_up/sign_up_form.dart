import 'package:flutter/material.dart';

import '../../../../core/constant/constants.dart';
import '../../../../controller/sign_up_controller.dart';
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
      child: Column(
        children: [
          TextFormField(
            decoration: inputDecoration(
              labelText: "Username",
              hintText: "Enter your username",
              iconData: Icons.person_2_outlined,
            ),
            controller: controller.username,
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: size.height * .03),
          TextFormField(
            decoration: inputDecoration(
              labelText: "Email",
              hintText: "Enter your email",
              iconData: Icons.email_outlined,
            ),
            controller: controller.email,
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: size.height * .03),
          TextFormField(
            decoration: inputDecoration(
              labelText: "Phone",
              hintText: "Enter your phone",
              iconData: Icons.local_phone_outlined,
            ),
            controller: controller.phone,
            keyboardType: TextInputType.phone,
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
          SizedBox(height: size.height * .03),
        ],
      ),
    );
  }
}
