import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../core/constant/color.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.onPress,
    this.radius = 50,
    this.buttonWidth = 40,
    this.buttonHeight = 40,
    this.iconSize = 20,
    this.iconData, // If icon is IconData
    this.isSvg = false, // If icon is Svg
    this.svgPath,
    this.backgroundColor,
    this.foregroundColor,
  });

  final IconData? iconData;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double radius;
  final double buttonWidth;
  final double buttonHeight;
  final double iconSize;
  final bool isSvg;
  final String? svgPath;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      borderRadius: BorderRadius.circular(radius),
      child: Container(
        width: buttonWidth,
        height: buttonHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: backgroundColor ?? Colors.transparent,
        ),
        child: Center(
          child: isSvg
              ? SvgPicture.asset(
                  svgPath ?? 'assets/icons/DotsH.svg',
                  colorFilter: ColorFilter.mode(
                      foregroundColor ??
                          Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(.9),
                      BlendMode.srcIn),
                  height: iconSize,
                )
              : Icon(
                  iconData ?? Icons.warning_outlined,
                  color: foregroundColor ??
                      (Get.isDarkMode
                          ? AppColor.lightDarkText
                          : AppColor.lightWhiteText),
                  size: iconSize,
                ),
        ),
      ),
    );
  }
}
