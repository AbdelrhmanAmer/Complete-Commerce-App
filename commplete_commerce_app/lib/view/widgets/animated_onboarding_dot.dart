import 'package:flutter/material.dart';

import '../../core/constant/color.dart';

class AnimatedOnBoardingDot extends StatelessWidget {
  const AnimatedOnBoardingDot({
    super.key,
    required this.currentIndex,
    required this.selectedIndex,
  });
  final int currentIndex;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(right: 10),
      width: currentIndex == selectedIndex ? 18 : 4,
      height: 4,
      decoration: BoxDecoration(
          color: AppColor.primaryColor, borderRadius: BorderRadius.circular(5)),
      duration: const Duration(milliseconds: 300),
    );
  }
}