import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/reset_password_controller.dart';
import '../../../core/constant/constants.dart';
import '../../../core/constant/color.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/input_decoration.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ResetPasswordController());

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Reset Password',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: Colors.black.withOpacity(.7)),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: size.height * .05),
                Text(
                  'Reset Password',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                SizedBox(height: size.height * .03),
                Text(
                  'Please enter your new password and confirm it\n',
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(height: 1.5),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: size.height * .09),
                Form(
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
                      ),
                      SizedBox(height: size.height * .03),
                      TextFormField(
                        decoration: inputDecoration(
                            labelText: "Confirm Password",
                            hintText: "Re-Enter your password",
                            iconData: Icons.lock_outline),
                        controller: controller.repassword,
                        obscureText: true,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * .22),
                CustomButton(
                  backgroundColor: AppColor.primaryColor,
                  foregroundColor: Colors.white,
                  text: 'Continue',
                  press: controller.goToSuccess,
                  widthRatio: .75,
                ),
                SizedBox(height: size.height * .01),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
