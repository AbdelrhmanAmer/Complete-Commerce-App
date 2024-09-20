import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoriteIconButton extends StatelessWidget {
  const FavoriteIconButton(
      {super.key,
      required this.isFavorite,
      required this.onPress,
      this.iconSize = 15,
      this.height = 25,
      this.rightMargin = 0});

  final bool isFavorite;
  final Function() onPress;
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
          padding: const EdgeInsets.all(6),
          child: Icon(
            isFavorite ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
            size: iconSize,
            color: isFavorite
                ? Colors.red
                : Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
