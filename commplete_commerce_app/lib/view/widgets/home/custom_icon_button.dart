import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.iconData,
    required this.onPress,
    this.foregroundColor = AppColor.darkText,
    this.backgroundColor = AppColor.primaryColor,
    this.radius = 50,
    this.width = 40,
    this.height = 40,
    this.iconSize = 20,
  });
  final IconData iconData;
  final Color backgroundColor;
  final Color foregroundColor;
  final double radius;
  final double width;
  final double height;
  final double iconSize;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      borderRadius: BorderRadius.circular(radius),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: backgroundColor),
        child: Center(
          child: Icon(
            iconData,
            color: foregroundColor,
            size: iconSize,
          ),
        ),
      ),
    );
  }
}
