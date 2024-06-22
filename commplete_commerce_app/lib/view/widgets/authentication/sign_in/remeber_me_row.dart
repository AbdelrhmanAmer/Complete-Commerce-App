import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/sign_in_controller.dart';

class RemeberMeRow extends StatelessWidget {
  const RemeberMeRow({
    super.key,
    required this.signInController,
  });

  final SignInController signInController;

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
