import 'package:flutter/material.dart';

class BackgroundDot extends StatelessWidget {
  const BackgroundDot(
    this.height, {
    super.key,
    this.top,
    this.bottom,
    this.right,
    this.left,
  });

  final double height;
  final double? top;
  final double? bottom;
  final double? right;
  final double? left;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Container(
        height: height,
        width: height,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.white10),
      ),
    );
  }
}
