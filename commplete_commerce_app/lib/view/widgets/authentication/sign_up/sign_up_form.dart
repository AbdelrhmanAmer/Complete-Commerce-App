import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/constant/constants.dart';
import '../../../../controller/sign_in_controller.dart';
import '../../input_decoration.dart';

class SignUpFrom extends StatelessWidget {
  SignUpFrom({
    super.key,
  });

  final signInController = Get.put(SignInController());
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
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: size.height * .03),
          TextFormField(
            decoration: inputDecoration(
              labelText: "Email",
              hintText: "Enter your email",
              iconData: Icons.email_outlined,
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: size.height * .03),
          TextFormField(
            decoration: inputDecoration(
              labelText: "Phone",
              hintText: "Enter your phone",
              iconData: Icons.local_phone_outlined,
            ),
            keyboardType: TextInputType.phone,
          ),
          SizedBox(height: size.height * .03),
          TextFormField(
            decoration: inputDecoration(
                labelText: "Password",
                hintText: "Enter your password",
                iconData: Icons.lock_outline),
            obscureText: true,
          ),
          SizedBox(height: size.height * .03),
        ],
      ),
    );
  }
}
