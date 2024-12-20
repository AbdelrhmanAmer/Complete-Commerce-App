import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/onboarding_controller.dart';
import '../../../core/constant/color.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/onboarding/custom_page_view.dart';
import '../../widgets/onboarding/dot_controller.dart';

class OnBoarding extends GetView<OnBoardingControllerImp> {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(()=>OnBoardingControllerImp(), fenix: true);
    return Scaffold(
      backgroundColor: AppColor.onboardingColor,
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(
            flex: 2,
            child: CustomPageView(),
          ),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
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
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    text: "Skip",
                    press: () => controller.skip(),
                    elevation: 1,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    ));
  }
}
