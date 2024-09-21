import 'package:flutter/material.dart';

class ColorDot extends StatelessWidget {
  const ColorDot({
    super.key,
    required this.color,
    required this.onPress,
    this.selected = false,
  });
  final Color color;
  final Function() onPress;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 22,
      width: 22,
      margin: const EdgeInsets.only(right: 8),
      padding: EdgeInsets.all(selected ? 3 : 0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: selected ? Colors.red : Colors.transparent),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      ),
    );
  }
}
