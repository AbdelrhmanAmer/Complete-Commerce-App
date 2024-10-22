import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    super.key,
    required this.imagePath,
    this.selected = false,
  });

  final String imagePath;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSecondaryContainer,
          border: Border.all(
              color: selected ? AppColor.primaryColor : Colors.transparent,width: 1.5),
          borderRadius: BorderRadius.circular(8)),
      child: Image.asset(imagePath),
    );
  }
}
