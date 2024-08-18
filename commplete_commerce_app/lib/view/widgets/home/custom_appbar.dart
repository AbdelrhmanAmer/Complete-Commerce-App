import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller.dart';
import '../../../controller/theme_controller.dart';
import '../../../core/constant/color.dart';
import 'custom_icon_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomIconButton(
          onPress: () {},
          iconData: CupertinoIcons.gear_big,
          foregroundColor: Get.isDarkMode ? Colors.black : Colors.white,
        ),
        Column(
          children: [
            Text(
              'Delivery address',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 11),
            ),
            Text(
              '${controller.address}',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 13),
            )
          ],
        ),
        Row(
          children: [
            Obx(
              () => CustomIconButton(
                onPress: themeController.toggleTheme,
                iconData: themeController.isDarkMode.value
                    ? CupertinoIcons.brightness_solid
                    : CupertinoIcons.moon,
                foregroundColor: Get.isDarkMode ? Colors.white : Colors.black,
                backgroundColor: Get.isDarkMode
                    ? AppColor.lightDarkBackground
                    : AppColor.lightwhiteBackground,
              ),
            ),
            const SizedBox(width: 6),
            Stack(
              clipBehavior: Clip.none,
              children: [
                CustomIconButton(
                  onPress: () {},
                  iconData: CupertinoIcons.bell,
                  foregroundColor: Get.isDarkMode ? Colors.white : Colors.black,
                  backgroundColor: Get.isDarkMode
                      ? AppColor.lightDarkBackground
                      : AppColor.lightwhiteBackground,
                ),
                Positioned(
                    right: 5,
                    top: -2,
                    child: Container(
                      height: 10,
                      width: 10,
                      decoration: const BoxDecoration(
                          color: AppColor.primaryColor, shape: BoxShape.circle),
                    ))
              ],
            ),
          ],
        )
      ],
    );
  }
}
