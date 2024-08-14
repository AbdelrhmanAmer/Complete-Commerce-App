import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';

import '../../../../controller/authentication/forgotPassword/success_reset_pass_conroller.dart';
import '../../../../core/constant/color.dart';
import '../../../widgets/custom_button.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    SuccessResetPassConroller controller = Get.put(SuccessResetPassConroller());

    return Scaffold(
      appBar: AppBar(title: const Text('Success')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * .05),
            Stack(
              children: [
                // Background dots
                ..._generateDots(size: size),
                SizedBox(
                  width: double.infinity,
                  height: size.height * .5,
                  child: Icon(
                    Icons.check_circle_rounded,
                    size: size.height * .28,
                    color: AppColor.primaryColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .05),
            Text('Password Reset Successful',
                style: Theme.of(context).textTheme.displayLarge),
            SizedBox(height: MediaQuery.of(context).size.height * .05),
            CustomButton(
              backgroundColor: AppColor.primaryColor,
              foregroundColor: Colors.white,
              text: 'Continue',
              press: controller.goToSignIn,
              widthRatio: .5,
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _generateDots({required Size size}) {
    final List<Widget> dots = [];
    final random = Random();

    const double iconSize = 200;
    final double iconTop = (size.height * .5 - iconSize) / 2;
    final double iconLeft = (size.width - iconSize) / 2;
    final double iconBottom = iconTop + iconSize;
    final double iconRight = iconLeft + iconSize;

    for (int i = 0; i < 100; i++) {
      final double dotSize = random.nextDouble() * 10 + 5;
      double top;
      double left;

      do {
        top = random.nextDouble() * size.height;
        left = random.nextDouble() * size.width;
      } while (top > iconTop &&
          top < iconBottom &&
          left > iconLeft &&
          left < iconRight);

      dots.add(Positioned(
        top: top,
        left: left,
        child: Container(
          width: dotSize,
          height: dotSize,
          decoration: BoxDecoration(
            color: AppColor.primaryColor.withOpacity(.7),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ));
    }
    return dots;
  }
}
