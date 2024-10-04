import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/app_routes.dart';

import '../../../controller/profile/settings_controller.dart';
import 'settings_list_tile.dart';

class SettingsBody extends GetView<ProfileController> {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          onTap: () {},
          title: Row(
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(
                  'https://th.bing.com/th/id/R.90bb9597bff6b281ea8e079c339e97d8?rik=T1yOj6l%2bhakOrw&pid=ImgRaw&r=0',
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi, ${controller.myServices.sharedPreferences.getString('username')}',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    Text(
                      '${controller.myServices.sharedPreferences.getString('email')}',
                      style: Theme.of(context).textTheme.labelSmall,
                    )
                  ],
                ),
              )
            ],
          ),
          trailing: const Icon(
            Icons.arrow_forward_rounded,
            size: 17,
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Account',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
        ),
        const SizedBox(height: 10),
        SettingsListTile(
          onPress: () {},
          title: 'Orders',
          enabled: false,
          isSvgIcon: true,
          svgPath: 'assets/icons/Order.svg',
        ),
        const SizedBox(height: 10),
        SettingsListTile(
          onPress: () {},
          title: 'Returns',
          isSvgIcon: true,
          enabled: false,
          svgPath: 'assets/icons/Return.svg',
        ),
        const SizedBox(height: 10),
        SettingsListTile(
          onPress: () {},
          title: 'Whitelist',
          isSvgIcon: true,
          enabled: false,
          svgPath: 'assets/icons/Wishlist.svg',
        ),
        const SizedBox(height: 10),
        SettingsListTile(
          onPress: () {},
          title: 'Addresses',
          isSvgIcon: true,
          enabled: false,
          svgPath: 'assets/icons/Address.svg',
        ),
        const SizedBox(height: 10),
        SettingsListTile(
          onPress: () {},
          title: 'Payment',
          enabled: false,
          isSvgIcon: true,
          svgPath: 'assets/icons/card.svg',
        ),

        // -------------------------------------------------------------
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'PERSONALIZATION',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
        ),
        const SizedBox(height: 10),
        SettingsListTile(
          onPress: () {},
          title: 'Notification',
          enabled: false,
          isSvgIcon: true,
          svgPath: 'assets/icons/Notification.svg',
        ),
        const SizedBox(height: 10),
        SettingsListTile(
          onPress: () => Get.toNamed(Routes.preferences),
          title: 'Preferences',
          isSvgIcon: true,
          svgPath: 'assets/icons/Preferences.svg',
        ),

        // -------------------------------------------------------------
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'SETTINGS',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
        ),

        const SizedBox(height: 10),
        SettingsListTile(
          onPress: () {},
          title: 'Language',
          enabled: false,
          isSvgIcon: true,
          svgPath: 'assets/icons/Language.svg',
        ),
        const SizedBox(height: 10),
        SettingsListTile(
          onPress: () {},
          title: 'Location',
          enabled: false,
          isSvgIcon: true,
          svgPath: 'assets/icons/Location.svg',
        ),

        // -------------------------------------------------------------
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'HELP & SUPPORT',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
        ),
        const SizedBox(height: 10),
        SettingsListTile(
          onPress: () {},
          title: 'Get Help',
          enabled: false,
          isSvgIcon: true,
          svgPath: 'assets/icons/Help.svg',
        ),
        const SizedBox(height: 10),
        SettingsListTile(
          onPress: () {},
          title: 'FAQ',
          isSvgIcon: true,
          enabled: false,
          svgPath: 'assets/icons/FAQ.svg',
        ),

        const SizedBox(height: 20),
        SettingsListTile(
          onPress: controller.logout,
          title: 'Logout',
          isSvgIcon: true,
          tileColor: Colors.red,
          svgPath: 'assets/icons/Logout.svg',
        ),
      ],
    );
  }
}
