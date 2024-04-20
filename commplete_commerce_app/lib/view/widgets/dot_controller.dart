import 'package:commplete_commerce_app/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import '../../core/constant/color.dart';
import '../../data/data_source/static/static.dart';

class DotControllerOnBoarding extends StatelessWidget {
  const DotControllerOnBoarding({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
      builder: (controller) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            onBoardingList.length,
            (index) => AnimatedContainer(
              margin: const EdgeInsets.only(right: 10),
              width: controller.currentPage == index ? 18 : 6,
              height: 4,
              decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(5)),
              duration: const Duration(milliseconds: 300),
            ),
          ),
        );
      },
    );
  }
}
