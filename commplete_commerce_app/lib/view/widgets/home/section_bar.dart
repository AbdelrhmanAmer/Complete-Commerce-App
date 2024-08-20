import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../authentication/timer.dart';
import '../../../core/constant/color.dart';
import 'custom_icon_button.dart';

class SectionBar extends StatelessWidget {
  const SectionBar({
    super.key,
    required this.title,
    required this.onPress,
    this.titleSize = 18,
    this.enableTimer = false,
    this.timer,
  });
  final String title;
  final double titleSize;
  final bool enableTimer;
  final Timer? timer;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: titleSize,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface),
            ),
            const SizedBox(width: 15),
            enableTimer
                ? Container(
                    height: 25,
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor.withOpacity(.8),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: timer ?? Container(),
                  )
                : Container()
          ],
        ),
        Row(
          children: [
            Text('See all', style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(width: 8),
            CustomIconButton(
              iconData: CupertinoIcons.forward,
              onPress: onPress,
              width: 23,
              height: 23,
              iconSize: 16,
              backgroundColor: AppColor.lightwhiteBackground,
            )
          ],
        )
      ],
    );
  }
}
