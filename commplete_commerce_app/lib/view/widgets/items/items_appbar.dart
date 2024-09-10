import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../custom_icon_button.dart';
import '../search_field.dart';

class ItemsAppbar extends StatelessWidget {
  const ItemsAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomIconButton(
          iconData: Icons.arrow_back,
          onPress: () {
            Get.back();
          },
        ),
        const SizedBox(width: 5),
        const Expanded(
          child: SearchField(
            hintText: 'Find Product',
            
          ),
        ),
        const SizedBox(width: 8),
        CustomIconButton(
          iconData: Icons.alarm,
          onPress: () {},
          radius: 12,
          height: 47,
          width: 47,
        ),
      ],
    );
  }
}
