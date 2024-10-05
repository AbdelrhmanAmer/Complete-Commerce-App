import 'package:commplete_commerce_app/view/widgets/profile/personalTile.dart';
import 'package:commplete_commerce_app/view/widgets/profile/premium_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/app_routes.dart';

import '../../../controller/profile/settings_controller.dart';
import 'settings_list_tile.dart';

class SettingsBody extends GetView<ProfileController> {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final String? username =
        controller.myServices.sharedPreferences.getString('username');
    final String? email =
        controller.myServices.sharedPreferences.getString('email');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PersonalTile(username: username!, email: email!, onPress: () {}),
        const SizedBox(height: 20),
        const PremiumCard(),
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
