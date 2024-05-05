import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/onboarding_controller.dart';
import '../../core/constant/color.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_page_view.dart';
import '../widgets/dot_controller.dart';

class OnBoardingScreen extends GetView<OnBoardingControllerImp> {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(
            flex: 3,
            child: CustomPageView(),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                const SizedBox(height: 20),
                const DotControllerOnBoarding(),
                const SizedBox(height: 40),
                CustomButton(
                  backgroundColor: AppColor.primaryColor,
                  foregroundColor: Colors.white,
                  text: "Continue",
                  press: ()=>controller.next(),
                ),
                const SizedBox(height: 6),
                CustomButton(
                  backgroundColor: AppColor.lightWhite,
                  foregroundColor: Colors.black,
                  text: "Skip",
                  press: () => controller.skip(),
                  elevation: 1,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    ));
  }
}
