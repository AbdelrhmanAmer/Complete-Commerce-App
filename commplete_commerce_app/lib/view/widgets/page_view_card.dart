import 'package:commplete_commerce_app/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import '../../core/constant/color.dart';
import '../../data/data_source/static/static.dart';

class CustomPageView extends GetView<OnBoardingControllerImp> {
  const CustomPageView({
    super.key,
    required this.selectedIndex,
  });
  final int selectedIndex;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
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
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 80),
              Image.asset(
                onBoardingList[index].image!,
                width: 200,
                height: 230,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 60),
              Text(
                onBoardingList[index].body!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColor.grey,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
