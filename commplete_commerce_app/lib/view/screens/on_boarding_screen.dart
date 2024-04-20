import 'package:flutter/material.dart';

import '../widgets/page_view_card.dart';
import '../widgets/animated_onboarding_dot.dart';
import '../../data/data_source/static/static.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int selectedIndex = 0;
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: PageView.builder(
                itemCount: onBoardingList.length,
                onPageChanged: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
                itemBuilder: (ctx, index) {
                  return PageViewCard(card: onBoardingList[index],);
                }),
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
                    (index) => AnimatedOnBoardingDot(
                      currentIndex: index,
                      selectedIndex: selectedIndex,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}



