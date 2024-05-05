import 'package:flutter/material.dart';

import '../../core/constant/color.dart';
import '../widgets/custom_button.dart';

class Language extends StatelessWidget {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Choose Language.', style: Theme.of(context).textTheme.displayLarge),
            const SizedBox(height: 20),
            CustomButton(
              backgroundColor: AppColor.primaryColor,
              foregroundColor: Colors.white,
              text: "العربية",
              press: () {},
              widthRatio: .45,
            ),
            const SizedBox(height: 20),
            CustomButton(
              backgroundColor: AppColor.primaryColor,
              foregroundColor: Colors.white,
              text: "English",
              press: () {},
              widthRatio: .45,
            ),
          ],
        ),
      ),
    );
  }
}
