import 'package:commplete_commerce_app/controller/profile/preferences_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/profile/preferences/preference_list_tile.dart';
import '../../widgets/profile/preferences/preferences_appbar.dart';


class Preferences extends StatelessWidget {
  const Preferences({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PreferencesController());
    return SafeArea(
      child: Scaffold(
        appBar: settingsAppBar(context),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              GetBuilder<PreferencesController>(builder: (controller) {
                return PreferenceListTile(
                    title: 'Dark Theme',
                    subTitle:
                        "Switch between light and dark modes for a personalized look.",
                    onSwitch: (newValue) {
                      controller.toggleTheme(newValue);
                    },
                    value: controller.isDarkTheme);
              })
              // const Divider()
            ],
          ),
        ),
      ),
    );
  }
}
