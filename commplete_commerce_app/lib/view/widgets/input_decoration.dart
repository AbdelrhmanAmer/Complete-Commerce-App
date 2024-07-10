import 'package:flutter/material.dart';

InputDecoration inputDecoration({
  required String labelText,
  String? hintText,
  IconData? iconData,
  bool pressed = false,
  VoidCallback? onpressed,
  Color iconColor = Colors.grey,
  double iconSize = 22,
}) {
  return InputDecoration(
    labelText: labelText,
    hintText: hintText,
    suffixIcon: pressed
        ? InkWell(
            onTap: onpressed,
            borderRadius: BorderRadius.circular(50),
            child: Icon(
              iconData,
              size: iconSize,
              color: iconColor.withOpacity(.9),
            ),
          )
        : Icon(
            iconData,
            size: iconSize,
            color: iconColor.withOpacity(.7),
          ),
  );
}
