import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/authentication/forgotPassword/success_reset_controller.dart';
import '../../../widgets/custom_button.dart';
import '../../../../core/constant/constants.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessResetController controller = Get.put(SuccessResetController());

    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size.height * .2),
            SizedBox(
              height: size.height * .4,
              width: double.infinity,
              child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Image.asset(
                    'assets/images/password.png',
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(height: size.height * .07),
            Text(
              'Your password has been changed successfully!',
              style: Theme.of(context).textTheme.displaySmall,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: size.height * .13),
            CustomButton(text: 'Log in', press: () => controller.goToLogIn()),
          ],
        ),
      ),
    );
  }
}
