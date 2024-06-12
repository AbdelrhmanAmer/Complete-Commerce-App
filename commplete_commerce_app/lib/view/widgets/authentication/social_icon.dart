import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialIcon extends StatelessWidget {
  const SocialIcon({
    super.key,
    required this.icon,
    required this.press,
  });
  final String icon;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        height: 35,
        width: 35,
        padding: const EdgeInsets.all(9),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
