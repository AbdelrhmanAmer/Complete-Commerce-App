import 'package:flutter/material.dart';

import '../../core/constant/color.dart';
import '../../data/model/OnBoardingModel.dart';

class PageViewCard extends StatelessWidget {
  const PageViewCard({
    super.key, required this.card,
  });
  final OnBoardingModel card;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 30),
          Text(
            card.title!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 80),
          Image.asset(
            card.image!,
            width: 200,
            height: 230,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 60),
          Text(
            card.body!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColor.grey,
            ),
          ),
        ],
      ),
    );
  }
}
