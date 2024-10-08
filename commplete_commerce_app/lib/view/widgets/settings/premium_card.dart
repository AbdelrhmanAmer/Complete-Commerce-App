import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../background_dot.dart';
import '../custom_button.dart';
import '../../../core/constant/constants.dart';

class PremiumCard extends StatelessWidget {
  const PremiumCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * .25,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(25),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const BackgroundDot(90, top: -30, right: -30),
          BackgroundDot(30, top: 0, right: size.width * .3),
          BackgroundDot(120, bottom: -20, right: size.width * .2),
          BackgroundDot(60, top: -20, right: size.width * .5),
          Positioned(
            right: -20,
            child: SizedBox(
              height: size.height * .2,
              width: size.width * .33,
              child: Get.isDarkMode
                  ? Image.asset(
                      'assets/Illustration/Illustration-0.png')
                  : Image.asset(
                      'assets/Illustration/Illustration_darkTheme_0.png'),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Starter Plan\n',
                        style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                            height: 2,
                            fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: 'All features unlocked!',
                        style: TextStyle(
                            fontSize: 20,
                            height: 1.5,
                            color: Theme.of(context).colorScheme.onPrimary),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: 'Upgrade',
                textStyle: TextStyle(
                    fontSize: 15,
                    color: Theme.of(context).colorScheme.onPrimaryContainer),
                height: 45,
                horizontalPadding: 5,
                backgroundColor:
                    Theme.of(context).colorScheme.onSecondaryContainer,
                press: () {},
                width: 120,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
