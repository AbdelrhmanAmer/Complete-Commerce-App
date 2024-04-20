import 'package:commplete_commerce_app/core/constant/color.dart';
import 'package:commplete_commerce_app/data/data_source/static/static.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: PageView.builder(
          itemCount: onBoardingList.length,
          itemBuilder: (ctx, index) {
            return Column(
              children: [
                Text(
                  onBoardingList[index].title!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 80),
                Image.asset(onBoardingList[index].image!),
                const SizedBox(height: 80),
                Text(
                  onBoardingList[index].body!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColor.grey,
                  ),
                )
              ],
            );
          }),
    ));
  }
}
