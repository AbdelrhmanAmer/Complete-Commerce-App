import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../custom_icon_button.dart';
import '../search_field.dart';

class ItemsAppbar extends StatelessWidget {
  const ItemsAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const SearchField(
          hintText: 'Find Product',
          widthPercent: .73,
        ),
        const SizedBox(width: 8),
        CustomIconButton(
          iconData: Icons.alarm,
          onPress: () {},
          radius: 12,
          foregroundColor: Get.isDarkMode ? Colors.white : Colors.black,
          backgroundColor: Get.isDarkMode
              ? AppColor.lightDarkBackground
              : AppColor.lightwhiteBackground,
          height: 47,
          width: 47,
        ),
      ],
    );
  }
}
