import 'package:flutter/material.dart';

import '../../core/constant/color.dart';
import '../../data/data_source/static/static.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({
    super.key,
    required this.onPageChanged,
    required this.selectedIndex,
  });
  final Function(int value) onPageChanged;
  final int selectedIndex;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: onBoardingList.length,
      onPageChanged: (value) {
          onPageChanged(value);
      },
      itemBuilder: (ctx, _) {
        return SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              Text(
                onBoardingList[selectedIndex].title!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 80),
              Image.asset(
                onBoardingList[selectedIndex].image!,
                width: 200,
                height: 230,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 60),
              Text(
                onBoardingList[selectedIndex].body!,
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
