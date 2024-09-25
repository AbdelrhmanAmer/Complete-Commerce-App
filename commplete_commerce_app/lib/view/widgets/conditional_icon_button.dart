import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/color.dart';

class ConditionalIconButton extends StatelessWidget {
  const ConditionalIconButton({super.key,
    required this.trueCondition,
    required this.onPress,
    this.trueIconData = CupertinoIcons.heart_fill,
    this.falseIconData = CupertinoIcons.heart,
    this.trueColor = Colors.red,
    this.falseColor,
    this.iconSize = 15,
    this.height = 25,
    this.rightMargin = 0});

  final bool trueCondition;
  final Function() onPress;
  final IconData trueIconData;
  final IconData falseIconData;
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
        color: Theme
            .of(context)
            .colorScheme
            .surface,
      ),
      child: InkWell(
        onTap: onPress,
        borderRadius: BorderRadius.circular(50),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Icon(
            trueCondition ? trueIconData : falseIconData,
            size: iconSize,
            color: trueCondition ? trueColor : (falseColor ??
                (Get.isDarkMode ? AppColor.whiteText : AppColor.darkText)),
          ),
        ),
      ),
    );
  }
}
