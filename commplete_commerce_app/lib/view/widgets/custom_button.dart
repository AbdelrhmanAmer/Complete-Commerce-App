import 'package:flutter/material.dart';

import '../../core/constant/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.press,
    this.width,
    this.elevation = 0,
    this.textStyle,
    this.foregroundColor = Colors.white,
    this.backgroundColor,
    this.horizontalPadding = 30,
    this.verticalPadding = 18,
    this.height = 50,
    this.iconData,
  });

  final Color? backgroundColor;
  final Color foregroundColor;
  final String text;
  final double elevation;
  final double? width;
  final double height;
  final TextStyle? textStyle;
  final double horizontalPadding;
  final double verticalPadding;
  final IconData? iconData;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? size.width * .9,
      height: height,
      child: ElevatedButton(
        onPressed: press,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.primary,

          padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding, vertical: verticalPadding),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide(color: Theme.of(context).colorScheme.primary)),
          elevation: elevation,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconData != null) ...[
              Icon(iconData, size: 15),
              const SizedBox(width: 7)
            ],
            Text(
              text,
              style: textStyle ??
                  Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: foregroundColor, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
