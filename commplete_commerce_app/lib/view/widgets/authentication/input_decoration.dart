import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

InputDecoration inputDecoration(
  BuildContext context, {
  String? hintText,
  String? iconPath,
  Color iconColor = Colors.grey,
  double iconSize = 24,
}) {
  return InputDecoration(
    hintText: hintText,
    prefixIcon: hintText != "Phone number"
        ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 16 * .75),
            child: SvgPicture.asset(
              iconPath!,
              height: iconSize,
              width: iconSize,
              colorFilter:
                  ColorFilter.mode(iconColor.withOpacity(.9), BlendMode.srcIn),
            ),
          )
        : SizedBox(
            width: 90,
            child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    SvgPicture.asset(
                      iconPath!,
                      height: iconSize,
                      width: iconSize,
                      colorFilter: ColorFilter.mode(
                        iconColor.withOpacity(.9),
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text('+20 ',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(color: iconColor)),
                    SizedBox(
                      height: 25,
                      child: VerticalDivider(
                        color: Theme.of(context)
                            .colorScheme
                            .surfaceContainerHighest,
                        thickness: 1.5,
                        width: 10,
                      ),
                    ),
                  ],
                )),
          ),
  );
}
