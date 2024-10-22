import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controller/authentication/sign_up/sign_up_controller.dart';
import '../../../../../core/constant/constants.dart';
import '../../../../../core/functions/validate_input.dart';
import '../../input_decoration.dart';

class SetupProfileForm extends StatelessWidget {
  const SetupProfileForm({
    super.key,
    required this.controller,
  });

  final SignUpController controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.setupFromState,
      child: Column(
        children: [
          TextFormField(
            style: Get.textTheme.bodyLarge,
            decoration: inputDecoration(
              context,
              hintText: "Username",
              iconPath: 'assets/icons/Profile.svg',
            ),
            validator: (val) {
              return validateInput(val!, 'username');
            },
            controller: controller.username,
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: size.height * .02),
          TextFormField(
            style: Get.textTheme.bodyLarge,
            decoration: inputDecoration(
              context,
              hintText: "Address",
              iconPath: 'assets/icons/Address.svg',
            ),
            validator: (val) {
              return validateInput(val!, 'address', min: 6, max: 50);
            },
            controller: controller.address,
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: size.height * .02),
          TextFormField(
            style: Get.textTheme.bodyLarge,
            decoration: inputDecoration(
              context,

              hintText: "Phone number",
              iconPath: 'assets/icons/Call.svg',
            ),
            validator: (val) {
              return validateInput(val!, 'phone', min: 6, max: 50);
            },
            controller: controller.phone,
          ),
        ],
      ),
    );
  }
}
