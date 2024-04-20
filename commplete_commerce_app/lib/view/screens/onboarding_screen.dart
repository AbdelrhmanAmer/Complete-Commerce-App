import 'package:flutter/material.dart';

import '../../core/constant/color.dart';
import '../widgets/custom_button.dart';
import '../widgets/page_view_card.dart';
import '../widgets/dot_controller.dart';
import '../../data/data_source/static/static.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int selectedIndex = 0;

  onClick() {
    setState(() {
      if (selectedIndex < onBoardingList.length - 1) {
        selectedIndex++;
      }
    });
  }

  onPageChanged(int value) {
    setState(() {
      selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: CustomPageView(
                onPageChanged: onPageChanged, selectedIndex: selectedIndex),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    onBoardingList.length,
                    (index) => DotControllerOnBoarding(
                        currentIndex: index, selectedIndex: selectedIndex),
                  ),
                ),
                const SizedBox(height: 40),
                CustomButton(
                  backgroundColor: AppColor.primaryColor,
                  foregroundColor: Colors.white,
                  text: selectedIndex == 0 ? "Let's Go" : "Continue",
                  onClick: onClick,
                ),
                const SizedBox(height: 6),
                CustomButton(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  text: "Skip",
                  onClick: () {},
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
