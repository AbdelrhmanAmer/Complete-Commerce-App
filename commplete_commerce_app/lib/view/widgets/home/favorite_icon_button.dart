import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class FavoriteIconButton extends StatelessWidget {
  const FavoriteIconButton({
    super.key,
    required this.isFavorite,
    required this.onPress,
  });

  final bool isFavorite;
  final Function() onPress;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 15,
      top: 15,
      child: InkWell(
        onTap: onPress,
        child: Container(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).colorScheme.surface,
          ),
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Icon(
              isFavorite ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
              size: 15,
              color: isFavorite
                  ? Colors.red
                  : Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}
