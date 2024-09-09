import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgImageCard extends StatelessWidget {
  const SvgImageCard({
    super.key,
    required this.imagePath,
  });

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerHigh,
          shape: BoxShape.circle),
      child: SvgPicture.asset(
        imagePath,
        height: 30,
        width: 30,
        colorFilter: ColorFilter.mode(
            Theme.of(context).colorScheme.onSurface, BlendMode.srcIn),
      ),
    );
  }
}
