import 'package:flutter/material.dart';

import '../../../../controller/authentication/sign_in_controller.dart';

class ForgotPasswordWidget extends StatelessWidget {
  const ForgotPasswordWidget({
    super.key,
    required this.controller,
  });
  final SignInController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: controller.goToForgotPassword,
      child: Text("Forgot Password",
          style: Theme.of(context).textTheme.bodyMedium!
              .copyWith(decoration: TextDecoration.underline)),
    );
  }
}
