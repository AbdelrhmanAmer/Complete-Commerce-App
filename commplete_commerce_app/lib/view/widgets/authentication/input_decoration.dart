import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

InputDecoration inputDecoration({
  String? hintText,
  String? iconPath,
  Color iconColor = Colors.grey,
  double iconSize = 24,
}) {
  return InputDecoration(
    hintText: hintText,
    prefixIcon: Padding(
      padding: const EdgeInsets.symmetric(vertical: 16 * .75),
      child: SvgPicture.asset(
        iconPath!,
        height: iconSize,
        width: iconSize,
        colorFilter: ColorFilter.mode(iconColor.withOpacity(.9), BlendMode.srcIn),
      ),
    ),
  );
}
