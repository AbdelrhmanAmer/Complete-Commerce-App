import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsListTile extends StatelessWidget {
  const SettingsListTile({
    super.key,
    required this.onPress,
    required this.title,
    this.leadingIconData,
    this.isSvgIcon = false,
    this.enabled = true,
    this.svgPath,
    this.tileColor,
  });

  final VoidCallback onPress;
  final IconData? leadingIconData;
  final String title;
  final bool enabled;
  final bool isSvgIcon;
  final String? svgPath;
  final Color? tileColor;

  @override
  Widget build(BuildContext context) {
    Color color = enabled
        ? (tileColor ?? Theme.of(context).colorScheme.onSurface)
        : Theme.of(context).colorScheme.onSurface.withOpacity(.5);

    return ListTile(
      onTap: onPress,
      enabled: enabled,
      leading: Container(
          margin: const EdgeInsets.only(right: 8),
          child: isSvgIcon
              ? SvgPicture.asset(
                  svgPath ?? 'assets/icons/DotsH.svg',
                  height: 25,
                  colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                )
              : Icon(
                  leadingIconData,
                  color: color,
                )),
      shape: Border(
          bottom: BorderSide(
        color: Colors.grey.withOpacity(.3),
      )),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 14, color: color),
          ),
          Icon(
            Icons.arrow_forward_rounded,
            color: color,
            size: 17,
          )
        ],
      ),
      style: ListTileStyle.list,
    );
  }
}
