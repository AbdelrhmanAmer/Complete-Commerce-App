import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../core/constant/color.dart';

class ConditionalIconButton extends StatelessWidget {
  const ConditionalIconButton(
      {super.key,
      required this.trueCondition,
      required this.onPress,
      this.trueIconData = 'assets/icons/heart_fill.svg',
      this.falseIconData = 'assets/icons/heart.svg',
      this.trueColor = const Color(0xFF4caac9),
      this.falseColor,
      this.iconSize = 18,
      this.height = 25,
      this.rightMargin = 0});

  final bool trueCondition;
  final Function() onPress;
  final String trueIconData;
  final String falseIconData;
  final Color trueColor;
  final Color? falseColor;
  final double iconSize;
  final double height;
  final double rightMargin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: rightMargin),
      height: height,
      width: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).colorScheme.surface,
      ),
      child: InkWell(
        onTap: onPress,
        borderRadius: BorderRadius.circular(50),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: SvgPicture.asset(
            trueCondition ? trueIconData : falseIconData,
            height: iconSize,
            width: iconSize,
            colorFilter: ColorFilter.mode(
              trueCondition
                  ? trueColor
                  : (falseColor ??
                      (Get.isDarkMode
                          ? AppColor.whiteText
                          : AppColor.darkText)),
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
