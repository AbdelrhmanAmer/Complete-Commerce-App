import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/onboarding_controller.dart';
import '../../core/constant/color.dart';
import '../widgets/custom_button.dart';
import '../widgets/page_view_card.dart';
import '../widgets/dot_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return const Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: CustomPageView(),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                SizedBox(height: 20),
                DotControllerOnBoarding(),
                SizedBox(height: 40),
                CustomButton(
                  backgroundColor: AppColor.primaryColor,
                  foregroundColor: Colors.white,
                  text: "Continue",
                ),
                SizedBox(height: 6),
                CustomButton(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  text: "Skip",
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    ));
  }
}
