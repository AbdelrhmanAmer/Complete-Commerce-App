import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/constants.dart';
import '../background_dot.dart';

class VisaCard extends StatelessWidget {
  const VisaCard({
    super.key,
    required this.visaNumber,
    required this.onPress,
    this.color,
  });

  final String visaNumber;
  final Color? color;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    final surfaceColor = Theme.of(context).colorScheme.surface;
    return Stack(
      children: [
        Container(
          height: 165,
          decoration: BoxDecoration(
            color: color ?? AppColor.primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Visa',
                    style: GoogleFonts.libreFranklin(
                      color: surfaceColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.check_circle, color: surfaceColor, size: 22),
                ],
              ),
              Text(
                '**** **** **** 1234',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: surfaceColor,
                    ),
              ),
              Text(
                'EaseShop\n10/24',
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: Get.isDarkMode ? Colors.black54 : Colors.white60),
              )
            ],
          ),
        ),
        Positioned(
          top: -10,
          left: -5,
          child: Text(
            ''
            'VISA',
            style: GoogleFonts.libreFranklin(
                color: surfaceColor.withOpacity(.2),
                fontSize: 50,
                fontWeight: FontWeight.bold),
          ),
        ),
        const BackgroundDot(50, left: 30, bottom: 10, ),
        BackgroundDot(90, top: -5, right: size.width * .02),
        BackgroundDot(120, bottom: -20, right: size.width * .2),
        BackgroundDot(60, top: -20, right: size.width * .4),
      ],
    );
  }
}