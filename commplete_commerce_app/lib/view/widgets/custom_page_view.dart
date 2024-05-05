import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import '../../controller/onboarding_controller.dart';
import '../../data/data_source/static/static.dart';

class CustomPageView extends GetView<OnBoardingControllerImp> {
  const CustomPageView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      itemCount: onBoardingList.length,
      onPageChanged: (value) {
          controller.onPageChanged(value);
      },
      itemBuilder: (ctx, index) {
        return SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              Text(
                onBoardingList[index].title!,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 60),
              Image.asset(
                onBoardingList[index].image!,
                width: 200,
                height: 230,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 30),
              Text(
                onBoardingList[index].body!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        );
      },
    );
  }
}
