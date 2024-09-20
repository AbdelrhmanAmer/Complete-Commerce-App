import 'package:flutter/material.dart';

import 'authentication/timer.dart';

class SmallContainer extends StatelessWidget {
  const SmallContainer({
    super.key,
    required this.object,
    this.foregroundColor = Colors.black,
    this.backgroundColor = Colors.white,
    this.fontSize = 11,
  });

  final dynamic object;
  final Color foregroundColor;
  final Color backgroundColor;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 21,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.only(left: 5, right: 5, top: 3, bottom: 3),
      child: object is Timer
          ? object
          : Text(object,
              style: TextStyle(
                  color: foregroundColor,
                  fontWeight: FontWeight.bold,
                  fontSize: fontSize)),
    );
  }
}