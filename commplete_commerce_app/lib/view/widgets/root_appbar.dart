import 'package:flutter/material.dart';

import '../../core/constant/color.dart';
import 'custom_icon_button.dart';

appBar(BuildContext context, {Color? backgroundColor}) {
  return AppBar(
    backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.surface,
    title: Text(
      'ShopEase',
      style: Theme.of(context).textTheme.labelLarge,
    ),
    centerTitle: false,
    actions: [
      Row(
        children: [
          CustomIconButton(
            onPress: () {},
            backgroundColor: Colors.transparent,
            foregroundColor:
                Theme.of(context).colorScheme.onSurface.withOpacity(.9),
            isSvg: true,
            svgPath: 'assets/icons/Search.svg',
            iconSize: 25,
          ),
          const SizedBox(width: 6),
          Stack(
            clipBehavior: Clip.none,
            children: [
              CustomIconButton(
                onPress: () {},
                isSvg: true,
                svgPath: 'assets/icons/Notification.svg',
                iconSize: 24,
              ),
              Positioned(
                  right: 10,
                  top: 5,
                  child: Container(
                    height: 10,
                    width: 10,
                    decoration: const BoxDecoration(
                        color: AppColor.primaryColor, shape: BoxShape.circle),
                  ))
            ],
          ),
          const SizedBox(width: 15),
        ],
      )
    ],
  );
}
