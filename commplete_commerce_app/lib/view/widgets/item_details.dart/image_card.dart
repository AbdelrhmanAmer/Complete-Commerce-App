import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    super.key,
    required this.imagePath,
  });

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          border: Border.all(color: AppColor.primaryColor),
          borderRadius: BorderRadius.circular(8)),
      child: Image.asset(imagePath),
    );
  }
}
