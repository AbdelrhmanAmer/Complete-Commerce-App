import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import '../../controller/onboarding_controller.dart';

class CustomButton extends GetView<OnBoardingControllerImp> {
  const CustomButton({
    super.key,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.text,
    this.elevation = 0,
  });
  final Color backgroundColor;
  final Color foregroundColor;
  final String text;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .8,
      child: ElevatedButton(
          onPressed: ()=>controller.onClick(),
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            foregroundColor: foregroundColor,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: elevation,
          ),
          child: Text(text)),
    );
  }
}
